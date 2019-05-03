//
//  ProductViewCell.h
//  ShoppingCart
//
//  Created by Daniel Bermudez on 4/30/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UILabel *priceLabel;
@property (nonatomic,weak) IBOutlet UIImageView *imageview;
@property (nonatomic,weak) IBOutlet UIButton *addButton;
@end

NS_ASSUME_NONNULL_END
