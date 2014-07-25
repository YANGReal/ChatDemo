//
//  YRMesaageCell.h
//  ChatDemo
//
//  Created by YANGRui on 14-7-17.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRMessage.h"
@interface YRMessageCell : UITableViewCell
@property (strong , nonatomic) YRMessage *message;
+ (CGFloat)cellHeightWithMessage:(YRMessage *)message;
@end
