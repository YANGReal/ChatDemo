//
//  YRMesaageCell.m
//  ChatDemo
//
//  Created by YANGRui on 14-7-17.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "YRMessageCell.h"
#import "UIView+ModifyFrame.h"
#define PADDING 10
#define TOP_PADDING 26
#define BG_PADDING 5
@interface YRMessageCell ()
@property (weak , nonatomic) IBOutlet UIImageView *avatarView;
@property (weak , nonatomic) IBOutlet UILabel *timeStampeLabel;
@property (weak , nonatomic) IBOutlet UILabel *contentLabel;
@property (weak , nonatomic) IBOutlet UIImageView *bgView;
@property (weak , nonatomic) IBOutlet UIImageView *pictureView;

@end
@implementation YRMessageCell

- (void)awakeFromNib
{
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
   // self.backgroundColor = [UIColor blueColor];
    self.contentLabel.backgroundColor = [UIColor clearColor];
   // _bgView.backgroundColor = [UIColor grayColor];
    //self.contentLabel.backgroundColor = [UIColor redColor];
    self.pictureView.clipsToBounds = YES;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    _timeStampeLabel.hidden = ![_message showTimeStampe];
    _timeStampeLabel.text = _message.timeStampe;
    self.avatarView.image = _message.avatar;
    CGFloat messageWidth = [_message messageWidth];
    CGFloat mesageHeight = [_message messageHeight];
    self.bgView.y = self.contentLabel.y-BG_PADDING;
    UIImage *bgImage = nil;
    if (_message.messageType == sendType)
    {
        self.avatarView.x = self.width-self.avatarView.width-PADDING;
        self.contentLabel.x = self.width-messageWidth-PADDING-PADDING-_avatarView.width-BG_PADDING*1.5;
        self.contentLabel.width = messageWidth;
        self.contentLabel.height = mesageHeight;
        self.bgView.x = self.width-messageWidth-_avatarView.width-BG_PADDING*7;
        self.bgView.height = mesageHeight+BG_PADDING*2;
        self.bgView.width = messageWidth+BG_PADDING*5;
        bgImage = [UIImage imageNamed:@"to.png"];
        bgImage = [bgImage stretchableImageWithLeftCapWidth:30 topCapHeight: 50];
        if (_message.messageCategory == textType)
        {
            self.pictureView.hidden = YES;
            self.contentLabel.text = _message.content;
        }
        else if (_message.messageCategory == pictureType)
        {
            self.pictureView.hidden = NO;
            self.pictureView.width = self.contentLabel.width-BG_PADDING;
            self.pictureView.height = self.contentLabel.height-BG_PADDING;
            CGFloat x = _contentLabel.center.x-1;
            CGFloat y = _contentLabel.center.y;
            self.pictureView.center =  CGPointMake(x, y);
            self.pictureView.image = _message.picture;
        }
        else
        {
            
        }
        
    }
    else
    {
        self.avatarView.x = PADDING;
        self.contentLabel.x = PADDING+_avatarView.width+PADDING+BG_PADDING*2;
        self.contentLabel.width = messageWidth;
        self.contentLabel.height = mesageHeight;
        self.bgView.x = PADDING+self.avatarView.width;
        self.bgView.width = messageWidth+BG_PADDING*5;
        self.bgView.height = mesageHeight+BG_PADDING*2;
        bgImage = [UIImage imageNamed:@"from.png"];
        bgImage = [bgImage stretchableImageWithLeftCapWidth:30 topCapHeight:50];
        if (_message.messageCategory == textType)
        {
            self.pictureView.hidden = YES;
            self.contentLabel.text = _message.content;
            
        }
        else if (_message.messageCategory == pictureType)
        {
            self.pictureView.hidden = NO;
            self.pictureView.width = self.contentLabel.width-BG_PADDING;
            self.pictureView.height = self.contentLabel.height-BG_PADDING;
            CGFloat x = _contentLabel.center.x-2;
            CGFloat y = _contentLabel.center.y;
            self.pictureView.center =  CGPointMake(x, y);
            self.pictureView.image = _message.picture;
        }
        else
        {
            
        }

    }
    self.bgView.image = bgImage;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeightWithMessage:(YRMessage *)message
{
    return [message messageHeight]+TOP_PADDING+20;
    
}

@end
