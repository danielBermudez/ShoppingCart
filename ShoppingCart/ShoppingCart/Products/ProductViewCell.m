//
//  ProductViewCell.m
//  ShoppingCart
//
//  Created by Daniel Bermudez on 4/30/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import "ProductViewCell.h"
#import "ProductModel.h"
@implementation ProductViewCell
@synthesize nameLabel = _nameLabel;
@synthesize priceLabel = _priceLabel;
@synthesize imageView = _imageView;
@synthesize addButton = _addButton;
- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.layer.borderWidth = 2.0f;
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.addButton.layer.borderWidth = 2.0f;
}
//- (void) prepareCellFrom: ProductModel product {
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
