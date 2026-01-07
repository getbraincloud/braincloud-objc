// Copyright 2026 bitHeads, Inc. All Rights Reserved.

#pragma once
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import "BrainCloudCompletionBlocks.hh"
#import <Foundation/Foundation.h>

@class BrainCloudClient;

@interface BrainCloudUserItems : NSObject

/**
 * Initializes the brainCloudService
 */
- (instancetype) init: (BrainCloudClient*) client;

/**
 * Allows item(s) to be awarded to a user without collecting
 *  the purchase amount. If includeDef is true, response
 * includes associated itemDef with language fields limited
 *  to the current or default language.
 *
 * Service Name - userItems
 * Service Operation - AWARD_USER_ITEM
 *
 * @param defId The unique id of the item definition to award.
 * @param quantity The quantity of the item to award.
 * @param includeDef If true, the associated item definition will be included in the response.
 */
- (void)awardUserItem:(NSString *)defId
             quantity:(int)quantity
           includeDef:(bool)includeDef
      completionBlock:(BCCompletionBlock)completionBlock
 errorCompletionBlock:(BCErrorCompletionBlock)ecb
             cbObject:(BCCallbackObject)cbObject;

/**
 * Allows a quantity of a specified user item to be dropped,
 * without any recovery of the money paid for the item.
 * If any quantity of the user item remains, it will be returned,
 * potentially with the associated itemDef (with language fields
 * limited to the current or default language).
 *
 * Service Name - userItems
 * Service Operation - DROP_USER_ITEM
 *
 * @param itemId The unique id of the user item.
 * @param quantity The quantity of the item to award.
 * @param includeDef If true, the associated item definition will be included in the response.
 */
- (void)dropUserItem:(NSString *)itemId
            quantity:(int)quantity
          includeDef:(bool)includeDef
     completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
            cbObject:(BCCallbackObject)cbObject;

/**
 * Retrieves the page of user's items from the server
 * based on the context. If includeDef is true, response
 *  includes associated itemDef with each user item, with
 * language fields limited to the current or default language.
 *
 * Service Name - userItems
 * Service Operation - GET_USER_ITEMS_PAGE
 *
 * @param context The json context for the page request.
 * @param includeDef If true, the associated item definition will be included in the response.
 */
- (void)getUserItemsPage:(NSString *)context
              includeDef:(bool)includeDef
         completionBlock:(BCCompletionBlock)completionBlock
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject;

/**
 * Retrieves the page of user's items from the server
 *  based on the encoded context. If includeDef is true,
 * response includes associated itemDef with each user item,
 * with language fields limited to the current or default
 * language.
 *
 * Service Name - userItems
 * Service Operation - GET_USER_ITEMS_PAGE_OFFSET
 *
 * @param context The context string returned from the server from a previous call to SysGetCatalogItemsPage or SysGetCatalogItemsPageOffset.
 * @param pageOffset The positive or negative page offset to fetch. Uses the last page retrieved using the context string to determine a starting point.
 * @param includeDef If true, the associated item definition will be included in the response.
 */
- (void)getUserItemsPageOffset:(NSString *)context
                    pageOffset:(int)pageOffset
                    includeDef:(bool)includeDef
               completionBlock:(BCCompletionBlock)completionBlock
          errorCompletionBlock:(BCErrorCompletionBlock)ecb
                      cbObject:(BCCallbackObject)cbObject;

/**
 * Retrieves the identified user item from the server.
 * If includeDef is true, response includes associated
 * itemDef with language fields limited to the current
 * or default language.
 *
 * Service Name - userItems
 * Service Operation - GET_USER_ITEM
 *
 * @param itemId The unique id of the user item.
 * @param includeDef If true, the associated item definition will be included in the response.
 * @param callback The method to be invoked when the server response is received
 */

- (void)getUserItem:(NSString *)itemId
           includeDef:(bool)includeDef
      completionBlock:(BCCompletionBlock)completionBlock
 errorCompletionBlock:(BCErrorCompletionBlock)ecb
             cbObject:(BCCallbackObject)cbObject;

/**
 * Gifts item to the specified player.
 *
 * Service Name - userItems
 * Service Operation - GIVE_USER_ITEM_TO
 *
 * @param profileId The ID of the recipient's user profile.
 * @param itemId The ID uniquely identifying the user item to be transferred.
 * @param version The version of the user item being transferred.
 * @param quantity The quantity of the user item to transfer.
 * @param immediate 	Flag set to true if item is to be immediately transferred, otherwise false to have the sender sents an event and transfers item(s) only when recipient calls receiveUserItemFrom.
 */

- (void)giveUserItemTo:(NSString *)profileId
                itemId:(NSString *)itemId
               version:(int)version
               quantity: (int)quantity
             immediate:(bool)immediate
       completionBlock:(BCCompletionBlock)completionBlock
  errorCompletionBlock:(BCErrorCompletionBlock)ecb
              cbObject:(BCCallbackObject)cbObject;

/**
 * Retrieves the identified user item from the server.
 * If includeDef is true, response includes associated
 * itemDef with language fields limited to the current
 * or default language.
 *
 * Service Name - userItems
 * Service Operation - PURCHASE_USER_ITEM
 *
 * @param defId The unique id of the item definition to purchase.
 * @param quantity The quantity of the item to purchase.
 * @param shopId The id identifying the store the item is being purchased from (not yet supported). Use null or empty string to specify the default shop price.
 * @param includeDef If true, the associated item definition will be included in the response.
 */

- (void)purchaseUserItem:(NSString *)defId
                quantity:(int)quantity
                  shopId:(NSString *)shopId
              includeDef:(bool)includeDef
completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * Retrieves and transfers the gift item from
 * the specified player, who must have previously
 * called giveUserItemTo.
 *
 * Service Name - userItems
 * Service Operation - RECEVIE_USER_ITEM_FROM
 *
 * @param profileId The profile ID of the user who is giving the item.
 * @param itemId The ID uniquely identifying the user item to be transferred.
 */

- (void)receiveUserItemFrom:(NSString *)profileId
                     itemId:(NSString *)itemId
            completionBlock:(BCCompletionBlock)completionBlock
       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                   cbObject:(BCCallbackObject)cbObject;

/**
 * Allows a quantity of a specified user item to be sold.
 * If any quantity of the user item remains, it will be returned,
 * potentially with the associated itemDef (with language fields
 * limited to the current or default language), along with the
 * currency refunded and currency balances.
 *
 * Service Name - userItems
 * Service Operation - SELL_USER_ITEM
 *
 * @param itemId The unique id of the user item.
 * @param version The version of the user item being sold.
 * @param quantity The quantity of the user item to sell.
 * @param shopId The id identifying the store the item is being purchased from (not yet supported). Use null or empty string to specify the default shop price.
 * @param includeDef 	If true and any quantity of the user item remains, the associated item definition will be included in the response.
 */

- (void)sellUserItem:(NSString *)itemId
             version:(int)version
            quantity:(int)quantity
              shopId:(NSString *)shopId
          includeDef:(bool)includeDef
     completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
            cbObject:(BCCallbackObject)cbObject;

/**
 * Updates the item data on the specified user item.
 *
 * Service Name - userItems
 * Service Operation - UPDATE_USER_ITEM_DATA
 *
 * @param itemId The unique id of the user item.
 * @param version The version of the user item being updated.
 * @param newItemData New item data to replace existing user item data.
 */

- (void)updateUserItemData:(NSString *)itemId
                   version:(int)version
               newItemData:(NSString*)newItemData
           completionBlock:(BCCompletionBlock)completionBlock
      errorCompletionBlock:(BCErrorCompletionBlock)ecb
                  cbObject:(BCCallbackObject)cbObject;

/**
 * Uses the specified item, potentially consuming it.
 *
 * Service Name - userItems
 * Service Operation - USE_USER_ITEM
 *
 * @param itemId The unique id of the user item.
 * @param version The version of the user item being used.
 * @param newItemData Optional item data to replace existing user item data. Specify null to leave item data unchanged. Specify empty map to clear item data.
 * @param includeDef If true, the associated item definition will be included in the response.
 */

- (void)useUserItem:(NSString *)itemId
            version:(int)version
        newItemData:(NSString *)newItemData
         includeDef:(bool)includeDef
    completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
           cbObject:(BCCallbackObject)cbObject;

/**
 * Allows item(s) to be awarded to a user without 
 * collecting the purchase amount. If includeDef 
 * is true, response includes associated itemDef 
 * with language fields limited to the current 
 * or default language.
 * 
 * Service Name - userItems
 * Service Operation - AWARD_USER_ITEM
 * 
 * @param defId - The unique id of the item definition to award.
 * @param quantity - The quantity of the item to award.
 * @param includeDef - If true, the associated item definition will be included in the response.
 * @param optionsJson -  Optional support for specifying 'blockIfExceedItemMaxStackable' indicating
 *  how to process the award if the defId is for a stackable item with a max stackable quantity and 
 * the specified quantity to award is too high. If true and the quantity is too high, the call is 
 * blocked and an error is returned. If false (default) and quantity is too high, the quantity is 
 * adjusted to the allowed maximum and the quantity not awarded is reported in response key 
 * 'itemsNotAwarded' - unless the adjusted quantity would be 0, in which case the call is blocked 
 * and an error is returned.
 */
- (void)awardUserItemWithOptions:(NSString *)defId
            quantity:(int)quantity
         includeDef:(bool)includeDef
         optionsJson:(NSString *)optionsJson
    completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
           cbObject:(BCCallbackObject)cbObject;



/**
 * Purchases a quantity of an item from the specified store, if the user has enough funds and 
 * purchasing for listed buy price is not disabled for associated catalog item definition. 
 * If includeDef is true, response includes associated itemDef with language fields limited to 
 * the current or default language.
 * 
 * Service Name - userItems
 * Service Operation - PURCHASE_USER_ITEM
 * 
 * @param defId - The unique id of the item definition to award.
 * @param quantity - The quantity of the item to award.
 * @param shopId - The id identifying the store the item is being purchased from, if applicable.
 * @param includeDef - If true, the associated item definition will be included in the response.
 * @param optionsJson -  Optional support for specifying 'blockIfExceedItemMaxStackable' indicating
 *  how to process the award if the defId is for a stackable item with a max stackable quantity and 
 * the specified quantity to award is too high. If true and the quantity is too high, the call is 
 * blocked and an error is returned. If false (default) and quantity is too high, the quantity is 
 * adjusted to the allowed maximum and the quantity not awarded is reported in response key 
 * 'itemsNotAwarded' - unless the adjusted quantity would be 0, in which case the call is blocked 
 * and an error is returned.
 */
- (void)purchaseUserItemWithOptions:(NSString *)defId
            quantity:(int)quantity
            shopId:(NSString *)shopId
         includeDef:(bool)includeDef
         optionsJson:(NSString *)optionsJson
    completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
           cbObject:(BCCallbackObject)cbObject;


/**
 * Returns list of items on promotion available to the current user.
 * 
 * Service Name - userItems
 * Service Operation - GET_ITEMS_ON_PROMOTION
 * 
 * @param shopId - The id identifying the store the item is being purchased from, if applicable.
 * @param includeDef - If true, the associated item definition will be included in the response.
 * @param includePromotionDetails - If true, the promotion details of the eligible promotions will be included in the response.
 */
- (void)getItemsOnPromotion:(NSString *)shopId
         includeDef:(bool)includeDef
         includePromotionDetails:(bool)includePromotionDetails
    completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
           cbObject:(BCCallbackObject)cbObject;


/**
 * Returns list of items on promotion available to the current user.
 * 
 * Service Name - userItems
 * Service Operation - GET_ITEMS_ON_PROMOTION
 * 
 * @param defId - The unique id of the item definition to check.
 * @param shopId - The id identifying the store the item is being purchased from, if applicable.
 * @param includeDef - If true, the associated item definition will be included in the response.
 * @param includePromotionDetails - If true, the promotion details of the eligible promotions will be included in the response.
 */
- (void)getItemPromotionDetails:(NSString *)defId
          shopId:(NSString *)shopId
         includeDef:(bool)includeDef
         includePromotionDetails:(bool)includePromotionDetails
    completionBlock:(BCCompletionBlock)completionBlock
errorCompletionBlock:(BCErrorCompletionBlock)ecb
           cbObject:(BCCallbackObject)cbObject;



//RTT BLOCKCHAIN - will be available when RTT confirmed

/**
 * Publishes the specified item to the item management attached blockchain. Results are reported asynchronously via an RTT event.
 *
 * Service Name - userItems
 * Service Operation - PUBLISH_USER_ITEM_TO_BLOCKCHAIN
 *
 * @param itemId
 * @param version
 */
/**
- (void)publishUserItemToBlockchain:(NSString *)itemId
                            version:(int)version
                    completionBlock:(BCCompletionBlock)completionBlock
               errorCompletionBlock:(BCErrorCompletionBlock)ecb
                           cbObject:(BCCallbackObject)cbObject;
*/
/**
 * Syncs the caller's user items with the item management attached blockchain. Results are reported asynchronously via an RTT event.
 *
 * Service Name - userItems
 * Service Operation - REFRESH_BLOCKCHAIN_USER_ITEMS
 *
 */
/**
- (void)refreshBlockchainUserItems:(BCCompletionBlock)completionBlock
              errorCompletionBlock:(BCErrorCompletionBlock)ecb
                          cbObject:(BCCallbackObject)cbObject;
*/
/**
 * Removes the specified item from the item management attached blockchain. Results are reported asynchronously via an RTT event.
 * Service Name - userItems
 * Service Operation - REMOVE_USER_ITEM_FROM_BLOCKCHAIN
 *
 * @param itemId
 * @param version
 */
/**
- (void)removeUserItemFromBlockchain:(NSString *)itemId
                             version:(int)version
                     completionBlock:(BCCompletionBlock)completionBlock
                errorCompletionBlock:(BCErrorCompletionBlock)ecb
                            cbObject:(BCCallbackObject)cbObject;
*/

@end

#pragma clang diagnostic pop
