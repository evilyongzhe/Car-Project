//
//  ReduceCell.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/26.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReduceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellPlace;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UIButton *CallOnClick;
@property (weak, nonatomic) IBOutlet UIButton *ReduceOnclick;

@end
