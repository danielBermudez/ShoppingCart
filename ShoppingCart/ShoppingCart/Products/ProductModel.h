//
//  ProductModel.h
//  ShoppingCart
//
//  Created by Daniel Bermudez on 4/29/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductModel : NSObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSNumber  *price;
@property (strong,nonatomic) NSURL *imageURL;
@end

NS_ASSUME_NONNULL_END
