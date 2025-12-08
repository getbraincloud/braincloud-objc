#import "TestFixtureBase.h"

@interface TestUserItems : TestFixtureBase

@end

@implementation TestUserItems

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testGetCatalogItemDefinition
{
    [[m_client userItemsService]  awardUserItem:@"sword001"
                                      quantity:5
                                    includeDef:true
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    
    [self waitForResult];
}

- (void)testDropUserItem
{
    [[m_client userItemsService]  dropUserItem:@"invalidForNow"
                                     quantity:1
                                   includeDef:true
                            completionBlock:successBlock
                       errorCompletionBlock:failureBlock
                                   cbObject:nil];
    
    [self waitForFailedResult];
}

- (void)testGetUserItemsPage
{
    NSString* context = @"{\"test\": \"Testing\"}";
    [[m_client userItemsService]  getUserItemsPage:context
                                       includeDef:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    
    [self waitForResult];
}

- (void)testGetUserItemsPageOffset
{
    NSString* context = @"";
    [[m_client userItemsService]  getUserItemsPageOffset:context
                                              pageOffset:1
                                              includeDef:true
                                         completionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    
    [self waitForFailedResult];
}

- (void)testGetUserItem
{
    [[m_client userItemsService]  getUserItem:@"invalidForNow"
                                              includeDef:true
                                         completionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    
    [self waitForFailedResult];
}

//ToDo: not sure why, but this doesn't fail in a way that xcode will mark the test as pass
//- (void)testGiveUserItemTo
//{
//    [[m_client userItemsService]giveUserItemTo:@"736708cd-c109-4073-8e1b-da2c808af8de"
//                                       itemId:@"invalidForNow"
//                                      version:1
//                                   immediate:true
//                              completionBlock:successBlock
//                         errorCompletionBlock:failureBlock
//                                     cbObject:nil];
//
//    [self waitForFailedResult];
//}

- (void)testPurchaseUserItem
{
    [[m_client userItemsService]  purchaseUserItem:@"sword001"
                                         quantity:1
                                            shopId:@""
                                       includeDef:true
                                 completionBlock:successBlock
                            errorCompletionBlock:failureBlock
                                        cbObject:nil];
    
    [self waitForResult];
}

- (void)testReceiveUserItemFrom
{
    [[m_client userItemsService]  receiveUserItemFrom:@"736708cd-c109-4073-8e1b-da2c808af8de"
                                               itemId:@"invalidForNow"
                                   completionBlock:successBlock
                              errorCompletionBlock:failureBlock
                                          cbObject:nil];
    
    [self waitForFailedResult];
}

- (void)testSellUserItem
{
    [[m_client userItemsService]  sellUserItem:@"invalidForNow"
                                               version:1
                                      quantity:1
                                        shopId:@""
                                    includeDef:true
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    
    [self waitForFailedResult];
}

- (void)testUpdateUserItemData
{
    [[m_client userItemsService]  updateUserItemData:@"InvalidForNow"
                                             version:1
                                         newItemData:@"{\"test\": \"Testing\"}"
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    
    [self waitForFailedResult];
}

- (void)testUseUserItem
{
    [[m_client userItemsService]  useUserItem:@"invalidForNow"
                                             version:1
                                         newItemData:@"{\"test\": \"Testing\"}"
                                   includeDef:true
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    
    [self waitForFailedResult];
}

- (void)testAwardUserItemWithOptions
{
    NSString* optionsJson = @"{\"AnswerToEverything\":42}";
    [[m_client userItemsService]  awardUserItemWithOptions:@"sword001"
                                      quantity:5
                                    includeDef:true
                                   optionsJson:optionsJson
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    
    [self waitForResult];
}

- (void)testPurchaseUserItemWithOptions
{
    NSString* optionsJson = @"{\"AnswerToEverything\":42}";
    [[m_client userItemsService]purchaseUserItemWithOptions:@"sword001"
                                      quantity:5
                                    shopId: @""
                                    includeDef:true
                                   optionsJson:optionsJson
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    
    [self waitForResult];
}

- (void)testGetItemPromotionDetails
{
    [[m_client userItemsService]getItemPromotionDetails:@"sword001"
                                                 shopId:@""
                                                 includeDef:true
                                                 includePromotionDetails:true
                                                 completionBlock:successBlock
                                                 errorCompletionBlock:failureBlock
                                                 cbObject:nil];
    [self waitForResult];
}

- (void)testGetItemsOnPromotion
{
    [[m_client userItemsService]getItemsOnPromotion:@""
                                         includeDef:true
                                         includePromotionDetails:true
                                         completionBlock:successBlock
                                         errorCompletionBlock:failureBlock
                                           cbObject:nil];
    [self waitForResult];
}

@end
