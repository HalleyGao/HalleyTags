//
//  FSFillLabel.m
//  CallPlaneFS
//
//  Created by Rafferty on 15/11/10.
//  Copyright © 2015年 PowerVision. All rights reserved.
//
#define MAX_SIZE_HEIGHT 10000
#define DEFAULT_BACKGROUDCOLOR [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1]
#define DEFAULT_TEXTCOLOR [UIColor whiteColor]
#define DEFAULT_FONT [UIFont systemFontOfSize:17]
#define DEFAULT_TEXTALIGNMENT NSTextAlignmentCenter
#define DEFAULT_RADIUS 0.0f
#import "HGFillLabel.h"

@implementation HGFillLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = DEFAULT_BACKGROUDCOLOR;
        self.textColor = DEFAULT_TEXTCOLOR;
        self.font = DEFAULT_FONT;
        self.textAlignment = DEFAULT_TEXTALIGNMENT;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = DEFAULT_RADIUS;
        self.lineBreakMode=NSLineBreakByCharWrapping;
        
    }
    return self;
}

-(void)setRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
}

-(void)setText:(NSString *)text
{
    super.text = text;
    
//    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(320, MAX_SIZE_HEIGHT) lineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize size = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAX_SIZE_HEIGHT)
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
   
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width + 9, size.height+4);
}

@end
