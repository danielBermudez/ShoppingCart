//
//  ProductViewModel.h
//  ShoppingCart
//
//  Created by Daniel Bermudez on 5/3/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
#import "ProductModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProductViewModel : NSObject
@property  (nonatomic) Request* request;
- (void) convertDataToModel: (void(^) (NSMutableArray* productList))completionHandler ;
    

@end

NS_ASSUME_NONNULL_END
