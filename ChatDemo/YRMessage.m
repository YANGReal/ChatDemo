//
//  YRMessage.m
//  ChatDemo
//
//  Created by YANGRui on 14-7-17.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "YRMessage.h"

#define MAX_WIDTH 200

@implementation YRMessage



 

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.picture = [aDecoder decodeObjectForKey:@"picture"];
        self.audioPath = [aDecoder decodeObjectForKey:@"audioPath"];
        self.timeStampe = [aDecoder decodeObjectForKey:@"timeStampe"];
        self.messageType = [aDecoder decodeIntForKey:@"messageType"];
        self.messageCategory = [aDecoder decodeIntForKey:@"messageCategory"];
        
    }
    return  self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_content forKey:@"content"];
    [aCoder encodeObject:_avatar forKey:@"avatar"];
    [aCoder encodeObject:_picture forKey:@"picture"];
    [aCoder encodeObject:_audioPath forKey:@"audioPath"];
    [aCoder encodeObject:_timeStampe forKey:@"timeStampe"];
    [aCoder encodeInt:_messageType forKey:@"messageType"];
    [aCoder encodeInt:_messageCategory forKey:@"messageCategory"];
}

- (CGFloat)messageHeight
{
    if (_messageCategory == textType)
    {
        UIFont *font = [UIFont systemFontOfSize:14];
        NSDictionary *attr = @{NSFontAttributeName: font};
        CGSize size = [self.content sizeWithAttributes:attr];
        CGFloat width = size.width;
        if (width>MAX_WIDTH)
        {
            width = MAX_WIDTH;
        }
        return [self stringHeightWithFontSize:14 andWidth:width];
        
    }
    else if (_messageCategory == pictureType)
    {
        return 150;
    }
    else
    {
        return 40;
    }
    return 100;
}

- (CGFloat)messageWidth
{
    if (_messageCategory == textType)
    {
        UIFont *font = [UIFont systemFontOfSize:14];
        NSDictionary *attr = @{NSFontAttributeName: font};
        CGSize titleSize = [self.content sizeWithAttributes:attr];
        if (titleSize.width>MAX_WIDTH)
        {
            titleSize.width = MAX_WIDTH;
        }
        return titleSize.width;
    }
    else if (_messageCategory == pictureType)
    {
        return 100;
    }
    else
    {
        return 100;
    }
}


- (CGFloat)stringHeightWithFontSize:(CGFloat)fontSize
                           andWidth:(CGFloat)width
{
    UIFont  *font = [UIFont systemFontOfSize:fontSize];
    CGSize size = CGSizeMake(width,CGFLOAT_MAX);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary * attributes = @{NSFontAttributeName:font,
                                  NSParagraphStyleAttributeName:paragraphStyle};
    //UsesLineFragmentOrigin
   // var text = self as NSString
    CGRect rect = [_content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect.size.height;
}

- (BOOL)showTimeStampe
{
    return _timeStampe.length != 0;
}

@end
