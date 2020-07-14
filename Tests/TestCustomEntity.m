//
//  TestCustomEntity.m
//  BrainCloud-iOS
//
//  Created by Ryan Ruth on 2018-11-07.
//  Copyright © 2018 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"

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
    
    
    [[m_client customEntityService]
     readSingleton:@"athletes" completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForFailedResult];
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
@end
