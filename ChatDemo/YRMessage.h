//
//  YRMessage.h
//  ChatDemo
//
//  Created by YANGRui on 14-7-17.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark -- 定义APP沙盒路径
/******************************
 定义APP沙盒路径
 ******************************/
#define DOCUMENTPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define TMPPATH NSTemporaryDirectory()
#define CACHPATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define CACH_DOCUMENTS_PATH(fileName) [CACHPATH stringByAppendingPathComponent:fileName]//缓存文件路径
#define DOCUMENTS_PATH(fileName) [DOCUMENTPATH stringByAppendingPathComponent:fileName]//Documents文件夹路径



typedef enum
{
    sendType,
    receiveType,
}YRMessageType;

typedef enum
{
    textType,
    pictureType,
    voiceType
    
}YRMessageCategory;


@interface YRMessage : NSObject <NSCoding>;
@property (copy , nonatomic) NSString *content;
@property (strong , nonatomic) UIImage *avatar;
@property (strong , nonatomic) UIImage *picture;
@property (copy , nonatomic) NSString *audioPath;
@property (copy , nonatomic) NSString *timeStampe;
@property (assign , nonatomic) YRMessageType messageType;
@property (assign , nonatomic) YRMessageCategory messageCategory;

- (CGFloat)messageHeight;
- (CGFloat)messageWidth;
- (BOOL)showTimeStampe;
@end
