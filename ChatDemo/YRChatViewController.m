//
//  YRChatViewController.m
//  ChatDemo
//
//  Created by YANGRui on 14-7-17.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "YRChatViewController.h"
#import "YRMessageCell.h"
@interface YRChatViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak , nonatomic) IBOutlet UITableView *tableView;
@property (strong , nonatomic) NSMutableArray *dataArray;
@end

@implementation YRChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:DOCUMENTS_PATH(@"data.archive")];
        NSLog(@"dataArray = %@",_dataArray);
        if (self.dataArray == nil)
        {
            self.dataArray = [NSMutableArray array];
            for (NSInteger i = 0;i<1000;i++)
            {
                YRMessage *message = [[YRMessage alloc] init];
                if(i%2==0)
                {
                    message.content = @"呵呵";
                    message.messageType = sendType;
                    message.messageCategory = textType;
                    message.picture = [UIImage imageNamed:@"picture.png"];
                    message.avatar = [UIImage imageNamed:@"me.png"];
                    message.timeStampe = @"2014-07-17";
                    
                }
                else
                {
                    message.content = @"呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵\n呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵";
                    message.messageType = receiveType;
                    message.messageCategory = pictureType;
                    message.picture = [UIImage imageNamed:@"picture.png"];
                    message.avatar = [UIImage imageNamed:@"other.png"];
                }
                [_dataArray addObject:message];
            }
            [NSKeyedArchiver archiveRootObject:_dataArray toFile:DOCUMENTS_PATH(@"data.archive")];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.tableView.backgroundColor = [UIColor redColor];
    //self.automaticallyAdjustsScrollViewInsets = YES;
    // Do any additional setup after loading the view from its nib.
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identider = @"cell";
    YRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identider];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YRMessageCell"
                                              owner:self
                                            options:nil] lastObject];
    }
    cell.message = _dataArray[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YRMessage *message = _dataArray[indexPath.row];
    return [YRMessageCell cellHeightWithMessage:message];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
