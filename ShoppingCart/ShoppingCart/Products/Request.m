//
//  Request.m
//  ShoppingCart
//
//  Created by Daniel Bermudez on 4/30/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import "Request.h"

@implementation Request
-(void)fetchDataFromJSON:(void (^) (NSData* result))completionHandler{
    NSLog(@"Fetching Products");
    NSString *urlString = @"http://applicorera3jjjs.com/api/mobile/categories/14/products?page=1";
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Finished fetching products");
        completionHandler(data);
    }]resume];
    
}
@end
