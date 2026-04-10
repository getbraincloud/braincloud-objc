// Runs first (alphabetically before all other TestXxx fixtures) to verify that all
// required portal configurations exist. A single failure here means the environment
// is missing portal setup — fix those before investigating other test failures.

#import "TestFixtureBase.h"

@interface TestAAAPortalPreflightChecks : TestFixtureBase
@end

@implementation TestAAAPortalPreflightChecks

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

// Run an API call without asserting on success or failure.
// Returns YES if the call succeeded.
- (BOOL)runSilently:(void (^)(BCCompletionBlock success, BCErrorCompletionBlock failure))makeCall
{
    __block bool done = false;
    __block bool succeeded = false;

    BCCompletionBlock silentSuccess = ^(NSString *serviceName, NSString *serviceOperation,
                                        NSString *jsonData, BCCallbackObject cbObject) {
        succeeded = true;
        done = true;
    };
    BCErrorCompletionBlock silentFailure = ^(NSString *serviceName, NSString *serviceOperation,
                                              NSInteger statusCode, NSInteger returnCode,
                                              NSString *statusMessage, BCCallbackObject cbObject) {
        succeeded = false;
        done = true;
    };

    makeCall(silentSuccess, silentFailure);
    [TestFixtureBase waitForResponse:m_client watchResult:&done];
    return succeeded ? YES : NO;
}

- (void)testPortalPreflightCheck
{
    NSMutableArray<NSString *> *missing = [NSMutableArray array];

    // -------------------------------------------------------------------------
    // Leaderboards
    // -------------------------------------------------------------------------
    for (NSString *lbId in @[@"testLeaderboard", @"testSocialLeaderboard", @"testTournamentLeaderboard", @"groupLeaderboardConfig"])
    {
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            [[m_client leaderboardService] getGlobalLeaderboardEntryCount:lbId
                                                          completionBlock:success
                                                     errorCompletionBlock:failure
                                                                 cbObject:nil];
        }];
        if (!ok) [missing addObject:[NSString stringWithFormat:@"leaderboard: %@", lbId]];
    }

    // -------------------------------------------------------------------------
    // Item catalog
    // -------------------------------------------------------------------------
    for (NSString *itemId in @[@"sword001", @"equipmentBundle"])
    {
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            [[m_client itemCatalogService] getCatalogItemDefinition:itemId
                                                   completionBlock:success
                                              errorCompletionBlock:failure
                                                          cbObject:nil];
        }];
        if (!ok) [missing addObject:[NSString stringWithFormat:@"catalog item: %@", itemId]];
    }

    // -------------------------------------------------------------------------
    // Global properties
    // -------------------------------------------------------------------------
    {
        __block NSString *propsJson = nil;
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            // Capture json via a wrapper that forwards to success
            BCCompletionBlock capturingSuccess = ^(NSString *serviceName, NSString *serviceOperation,
                                                    NSString *jsonData, BCCallbackObject cbObject) {
                propsJson = jsonData;
                success(serviceName, serviceOperation, jsonData, cbObject);
            };
            [[m_client globalAppService] readSelectedProperties:@[@"prop1", @"prop2", @"prop3"]
                                               completionBlock:capturingSuccess
                                          errorCompletionBlock:failure
                                                      cbObject:nil];
        }];
        if (ok && propsJson != nil)
        {
            NSData *data = [propsJson dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSDictionary *props = root[@"data"][@"response"];
            for (NSString *name in @[@"prop1", @"prop2", @"prop3"])
            {
                if (![props isKindOfClass:[NSDictionary class]] || props[name] == nil)
                    [missing addObject:[NSString stringWithFormat:@"global property: %@", name]];
            }
        }
        else
        {
            [missing addObject:@"global properties: prop1, prop2, prop3"];
        }
    }

    // -------------------------------------------------------------------------
    // Achievements
    // -------------------------------------------------------------------------
    {
        __block NSString *achsJson = nil;
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            BCCompletionBlock capturingSuccess = ^(NSString *serviceName, NSString *serviceOperation,
                                                    NSString *jsonData, BCCallbackObject cbObject) {
                achsJson = jsonData;
                success(serviceName, serviceOperation, jsonData, cbObject);
            };
            [[m_client gamificationService] readAchievements:false
                                             completionBlock:capturingSuccess
                                        errorCompletionBlock:failure
                                                    cbObject:nil];
        }];
        if (ok && achsJson != nil)
        {
            NSData *data = [achsJson dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *achs = root[@"data"][@"achievements"];
            NSMutableSet *ids = [NSMutableSet set];
            if ([achs isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *ach in achs)
                    if (ach[@"id"]) [ids addObject:ach[@"id"]];
            }
            if (![ids containsObject:@"testAchievement01"])
                [missing addObject:@"achievement: testAchievement01"];
            if (![ids containsObject:@"testAchievement02"])
                [missing addObject:@"achievement: testAchievement02"];
        }
        else
        {
            [missing addObject:@"achievement: testAchievement01"];
            [missing addObject:@"achievement: testAchievement02"];
        }
    }

    // -------------------------------------------------------------------------
    // Milestone and quest category: Experience
    // -------------------------------------------------------------------------
    {
        __block NSString *milestonesJson = nil;
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            BCCompletionBlock capturingSuccess = ^(NSString *serviceName, NSString *serviceOperation,
                                                    NSString *jsonData, BCCallbackObject cbObject) {
                milestonesJson = jsonData;
                success(serviceName, serviceOperation, jsonData, cbObject);
            };
            [[m_client gamificationService] readMilestonesByCategory:@"Experience"
                                                     includeMetaData:false
                                                     completionBlock:capturingSuccess
                                                errorCompletionBlock:failure
                                                            cbObject:nil];
        }];
        if (ok && milestonesJson != nil)
        {
            NSData *data = [milestonesJson dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *milestones = root[@"data"][@"milestones"];
            if (![milestones isKindOfClass:[NSArray class]] || milestones.count == 0)
                [missing addObject:@"milestone category: Experience (no milestones defined)"];
        }
        else
        {
            [missing addObject:@"milestone category: Experience"];
        }
    }
    {
        __block NSString *questsJson = nil;
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            BCCompletionBlock capturingSuccess = ^(NSString *serviceName, NSString *serviceOperation,
                                                    NSString *jsonData, BCCallbackObject cbObject) {
                questsJson = jsonData;
                success(serviceName, serviceOperation, jsonData, cbObject);
            };
            [[m_client gamificationService] readQuestsByCategory:@"Experience"
                                                 includeMetaData:false
                                                 completionBlock:capturingSuccess
                                            errorCompletionBlock:failure
                                                        cbObject:nil];
        }];
        if (ok && questsJson != nil)
        {
            NSData *data = [questsJson dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *quests = root[@"data"][@"quests"];
            if (![quests isKindOfClass:[NSArray class]] || quests.count == 0)
                [missing addObject:@"quest category: Experience (no quests defined)"];
        }
        else
        {
            [missing addObject:@"quest category: Experience"];
        }
    }

    // -------------------------------------------------------------------------
    // Virtual currency type: credits
    // -------------------------------------------------------------------------
    {
        __block NSString *currencyJson = nil;
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            BCCompletionBlock capturingSuccess = ^(NSString *serviceName, NSString *serviceOperation,
                                                    NSString *jsonData, BCCallbackObject cbObject) {
                currencyJson = jsonData;
                success(serviceName, serviceOperation, jsonData, cbObject);
            };
            [[m_client virtualCurrencyService] getCurrency:@"_invalid_id_"
                                           completionBlock:capturingSuccess
                                      errorCompletionBlock:failure
                                                  cbObject:nil];
        }];
        if (ok && currencyJson != nil)
        {
            NSData *data = [currencyJson dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *root = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSDictionary *currency = root[@"data"][@"currency"];
            if (![currency isKindOfClass:[NSDictionary class]] || currency[@"credits"] == nil)
                [missing addObject:@"virtual currency type: credits"];
        }
        else
        {
            [missing addObject:@"virtual currency type: credits"];
        }
    }

    // -------------------------------------------------------------------------
    // Custom entity type: athletes
    // -------------------------------------------------------------------------
    {
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            [[m_client customEntityService] getPage:@"athletes"
                                            context:@"{\"pagination\":{\"rowsPerPage\":1,\"pageNumber\":1},\"searchCriteria\":{}}"
                                    completionBlock:success
                               errorCompletionBlock:failure
                                           cbObject:nil];
        }];
        if (!ok) [missing addObject:@"custom entity type: athletes"];
    }

    // -------------------------------------------------------------------------
    // Tournament division set: testDivSetId
    // -------------------------------------------------------------------------
    {
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            [[m_client tournamentService] getDivisionInfo:@"testDivSetId"
                                         completionBlock:success
                                    errorCompletionBlock:failure
                                                cbObject:nil];
        }];
        if (!ok) [missing addObject:@"tournament division set: testDivSetId"];
    }

    // -------------------------------------------------------------------------
    // Lobby type: MATCH_UNRANKED
    // -------------------------------------------------------------------------
    {
        BOOL ok = [self runSilently:^(BCCompletionBlock success, BCErrorCompletionBlock failure) {
            [[m_client lobbyService] getRegionsForLobbies:@[@"MATCH_UNRANKED"]
                                          completionBlock:success
                                     errorCompletionBlock:failure
                                                 cbObject:nil];
        }];
        if (!ok) [missing addObject:@"lobby type: MATCH_UNRANKED"];
    }

    // -------------------------------------------------------------------------
    // Report
    // -------------------------------------------------------------------------
    if (missing.count > 0)
    {
        NSMutableString *message = [NSMutableString stringWithString:
            @"\nPORTAL PREFLIGHT CHECK FAILED - the following items are not configured on the portal:\n"];
        for (NSString *item in missing)
            [message appendFormat:@"  - %@\n", item];
        [message appendString:@"\nSet these up in the portal before running the full test suite.\n"];
        XCTFail(@"%@", message);
    }
}

@end
