//
//  ProductViewModel.m
//  ShoppingCart
//
//  Created by Daniel Bermudez on 5/3/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import "ProductViewModel.h"
#import "Request.h"
#import "ProductModel.h"
@implementation ProductViewModel
-(instancetype)init {
    if ( self = [super init]){
        self.request = Request.new;
    }
    return self;
}
- (void)convertDataToModel: (void(^) (NSMutableArray* productList))completionHandler {
    NSMutableArray<ProductModel *> *productList = NSMutableArray.new;
    [self.request fetchDataFromJSON:^(NSData * _Nonnull result) {
        NSError * err;
        id jsonResponse = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingAllowFragments error:&err];
        
        if (err){
            NSLog(@"Failed to serialize into JSON: %@",err);
            return;
        }
        if([jsonResponse isKindOfClass:[NSDictionary class]]){
            NSDictionary *rawResult = jsonResponse;
            NSDictionary * dataDictionary = rawResult[@"data"];
            NSArray *dataArray = dataDictionary[@"data"];
            for (NSDictionary *products in dataArray){
                NSDictionary *store = products[@"store"];
                ProductModel *product = [self createProductModelfrom:products[@"name"] withPrice:store[@"price"] andImageURL:products[@"image"]];
                NSLog(@"%@", product.name);
                NSLog(@"%@", product.price);
                NSLog(@"%@", product.imageURL);
                [productList addObject:product];
            }
            completionHandler(productList);
        }
    }];
}

-(ProductModel*)createProductModelfrom:(NSString*)name withPrice:(NSNumber*)price andImageURL:(NSString*)imageURL {
    ProductModel *resultProduct = ProductModel.new;
    resultProduct.name = name;
    resultProduct.price = price;
    resultProduct.imageURL = [NSURL URLWithString:imageURL];
    return resultProduct;
    
}

@end
