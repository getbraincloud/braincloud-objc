// Copyright 2026 bitHeads, Inc. All Rights Reserved.

//
//  BrainCloudAppStore.m
//  BrainCloud-iOS
//
//  Created by Ryan Ruth on 2018-09-21.

//

#include "braincloud/BrainCloudClient.h"
#include "BrainCloudCallback.hh"

#import "BrainCloudAppStore.hh"
#import "BrainCloudClient.hh"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

@interface BrainCloudAppStore ()
{
    BrainCloud::BrainCloudClient *_client;
}
@end

@implementation BrainCloudAppStore

- (instancetype) init: (BrainCloudClient*) client
{
    self = [super init];
    
    if(self) {
        _client = (BrainCloud::BrainCloudClient *)[client getInternalClient];
    }
    
    return self;
}

-(void)cachePurchasePayloadContext:(NSString *)storeId
                             iapId:(NSString *)iapId
                           payload:(NSString *)payload
                   completionBlock:(BCCompletionBlock)cb
              errorCompletionBlock:(BCErrorCompletionBlock)ecb
                          cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->cachePurchasePayloadContext([storeId UTF8String], [iapId UTF8String], [payload UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

-(void)verifyPurchase:(NSString *)storeId
          receiptData:(NSString *)receiptData
      completionBlock:(BCCompletionBlock)cb
 errorCompletionBlock:(BCErrorCompletionBlock)ecb
             cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->verifyPurchase([storeId UTF8String], [receiptData UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getEligiblePromotions:(BCCompletionBlock)cb
         errorCompletionBlock:(BCErrorCompletionBlock)ecb
                     cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->getEligiblePromotions(new BrainCloudCallback(cb, ecb, cbObject));
}


- (void)refreshPromotions:(BCCompletionBlock)cb
     errorCompletionBlock:(BCErrorCompletionBlock)ecb
                 cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->refreshPromotions(new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getSalesInventory:(NSString *)storeId
             userCurrency:(NSString *)userCurrency
          completionBlock:(BCCompletionBlock)cb
     errorCompletionBlock:(BCErrorCompletionBlock)ecb
                 cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->getSalesInventory([storeId UTF8String], [userCurrency UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getSalesInventoryByCategory:(NSString *)storeId
                       userCurrency:(NSString *)userCurrency
                           category:(NSString *)category
                    completionBlock:(BCCompletionBlock)cb
               errorCompletionBlock:(BCErrorCompletionBlock)ecb
                           cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->getSalesInventoryByCategory(
         [storeId UTF8String], [userCurrency UTF8String], [category UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)startPurchase:(NSString *)storeId
         purchaseData:(NSString *)purchaseData
      completionBlock:(BCCompletionBlock)cb
 errorCompletionBlock:(BCErrorCompletionBlock)ecb
             cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->startPurchase(
         [storeId UTF8String], [purchaseData UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)finalizePurchase:(NSString *)storeId
           transactionId:(NSString *)transactionId
         transactionData:(NSString *)transactionData
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject
{
    _client->getAppStoreService()->finalizePurchase(
         [storeId UTF8String], [transactionId UTF8String], [transactionData UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

@end
#pragma clang diagnostic pop
