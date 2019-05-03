//
//  ListViewController.m
//  ShoppingCart
//
//  Created by Daniel Bermudez on 4/29/19.
//  Copyright © 2019 Endava. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductViewModel.h"
@interface ProductsViewController ()
@property  (strong,nonatomic) NSMutableArray<ProductModel *> *products;
@end

@implementation ProductsViewController
NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.products = NSMutableArray.new;
    self.navigationItem.title = @"Available Products";
    self.navigationController.navigationBar.prefersLargeTitles = YES ;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
    ProductModel *product = ProductModel.new;
    product.name = @"Cerveza Andina";
    product.price = @(2000);
    [self.products addObject:product];
   
    
    ProductViewModel *productViewModel = ProductViewModel.new;
    [productViewModel convertDataToModel:^(NSMutableArray * _Nonnull productList) {
        self.products = productList;
        dispatch_async(dispatch_get_main_queue(),^(void){[self.tableView reloadData];});
    }];
   
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.products.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *productCellIdentifier = @"ProductViewCell";
    ProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productCellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:productCellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = self.products[indexPath.section].name;
     cell.priceLabel.text = [self.products[indexPath.section].price stringValue];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
