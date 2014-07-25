/* 

Before:  
    CGRect frame = myView.frame;
    frame.origin.x = newX;
    myView.frame = frame;

After:  
    myView.x = newX;
 
*/

#import <UIKit/UIKit.h>

@interface UIView (Ext)

@property float x;
@property float y;
@property float width;
@property float height;

@end
