//
//  TestCustomEntity.m
//  BrainCloud-iOS
//
//  Created by Ryan Ruth on 2018-11-07.
//  Copyright © 2018 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"
#import "ACL.hh"

@interface TestCustomEntity : TestFixtureBase

@end

@implementation TestCustomEntity


- (bool)authenticateOnSetup { return false; }

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }


- (void)testCreateEntity
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testGetPage
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     getPage:@"athletes" context:@"{\test\":\"Testing\"}"
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testGetPageOffset
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     getPageOffset:@"athletes" context:@"eyJzZWFyY2hDcml0ZXJpYSI6eyJlbnRpdHlUeXBlIjoidGVzdEdsb2JhbEVudGl0eSIs"
     @"ImdhbWVJZCI6IjEwMTcwIiwiJG9yIjpbeyJvd25lcklkIjoiMTgwNjNkMDUtYmIzYi0"
     @"0MWJmLTgyZTYtYTUxMWVjNjMzOTZlIn0seyJhY2wub3RoZXIiOnsiJG5lIjowfX1dfS"
     @"wic29ydENyaXRlcmlhIjp7fSwicGFnaW5hdGlvbiI6eyJyb3dzUGVyUGFnZSI6MTAwL"
     @"CJwYWdlTnVtYmVyIjoxfSwib3B0aW9ucyI6bnVsbH0" pageOffset:1
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testReadEntity
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
        
            [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
        errorCompletionBlock:failureBlock
        cbObject:nil];
        [self waitForResult];

        NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingMutableContainers
                                                                  error:nil];

    NSString *entityId=[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"entityId"];
        
    [[m_client customEntityService]
     readEntity:@"athletes" entityId:entityId     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}


- (void)testUpdateEntity

{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
        
            [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
        errorCompletionBlock:failureBlock
        cbObject:nil];
        [self waitForResult];

        NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingMutableContainers
                                                                  error:nil];

    NSString *entityId=[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"entityId"];
        
    [[m_client customEntityService]
     updateEntity:@"athletes" entityId:entityId version:1 dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:1 completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testUpdateEntityFields

{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
        
            [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
        errorCompletionBlock:failureBlock
        cbObject:nil];
        [self waitForResult];

        NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingMutableContainers
                                                                  error:nil];

    NSString *entityId=[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"entityId"];
    
    [[m_client customEntityService]
     updateEntityFields:@"athletes" entityId:entityId version:1 fieldsJson:@"{\"position\":\"defense\"}"  completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testGetCount

{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     getCount:@"athletes" whereJson:@"{\"position\":\"defense\"}" completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testDeleteEntity

{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
        [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
    errorCompletionBlock:failureBlock
    cbObject:nil];
    [self waitForResult];

    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];

NSString *entityId=[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"entityId"];
    
    [[m_client customEntityService]
     deleteEntity:@"athletes" entityId:entityId jsonEntityData:@"data" version:1
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testDeleteEntities

{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     deleteEntities:@"athletes" deleteCriteria:@"{\test\":\"Testing\"}"
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testDeleteSingleton
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
        
        [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
    errorCompletionBlock:failureBlock
    cbObject:nil];
    [self waitForResult];
    
    [[m_client customEntityService]
     deleteSingleton:@"athletes" version:1 completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testUpdateSingleton
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     updateSingleton:@"athletes" version:1 dataJson:@"{\"position\":\"defense\"}" acl:@"{\"test\":\"testing\"}" timeToLive:NULL completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testUpdateSingletonFields

{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
        
        [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
    errorCompletionBlock:failureBlock
    cbObject:nil];
    [self waitForResult];
    
    [[m_client customEntityService]
     updateSingletonFields:@"athletes" version:1 fieldsJson:@"{\"position\":\"defense\"}"  completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testReadSingleton
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
        
        [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
    errorCompletionBlock:failureBlock
    cbObject:nil];
    [self waitForResult];
    
    [[m_client customEntityService]
     readSingleton:@"athletes" completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
}

- (void)testIncrementData
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    
    [[m_client customEntityService]
     incrementData:@"athletes" entityId:@"_badID" fieldsJson:@"{\"goals\":3,\"assists\":5}" completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForFailedResult];
}


/* Helper functions */
- (NSString *)createDefaultEntity:(Access)access
{
    [[m_client customEntityService] createEntity:@"athletes" dataJson:@"{\test\":\"Testing\"}" acl:@"{\test\":\"Testing\"}" timeToLive:NULL isOwned:true completionBlock:successBlock
    errorCompletionBlock:failureBlock
    cbObject:nil];
    [self waitForResult];

    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];

    return [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"entityId"];
}

- (void)deleteEntity:(NSString *)entityId version:(int)version
{
    [[m_client entityService] deleteEntity:entityId
                                   version:version
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForResult];
}
@end
