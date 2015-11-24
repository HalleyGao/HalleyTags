//
//  FSOrderTypeTagView.m
//  CallPlaneFS
//
//  Created by Rafferty on 15/11/10.
//  Copyright © 2015年 PowerVision. All rights reserved.
//

#import "HGTagView.h"
#import "HGFillLabel.h"
@interface HGTagView()
{
    CGFloat _tagViewWidth;
}
@end
@implementation HGTagView


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(id)initWithFrame:(CGRect)frame  {
    self=[super initWithFrame:frame];
    if(self)
    {
        _tagViewWidth=frame.size.width;
        
    }
    return self;
}
-(CGRect)setTagViewValue:(NSMutableArray *)tagArray

{
   
   if(self.subviews.count>0)
   {
       for (UIView *view in self.subviews) {
           [view removeFromSuperview];
       }
   }
    CGFloat frameWidth = _tagViewWidth;
    
    CGFloat tagsTotalWidth = 0.0f;
    CGFloat tagsTotalHeight = 0.0f;
    
    CGFloat tagHeight = 0.0f;
    for (NSString *tag in tagArray)
    {
        HGFillLabel *fillLabel = [[HGFillLabel alloc] initWithFrame:CGRectMake(tagsTotalWidth, tagsTotalHeight, 0, 0)];
        fillLabel.text = tag;
        tagsTotalWidth += fillLabel.frame.size.width + 9;
        tagHeight = fillLabel.frame.size.height;
        
        if(tagsTotalWidth >= frameWidth)
        {
            tagsTotalHeight += fillLabel.frame.size.height + 5;
            tagsTotalWidth = 0.0f;
            fillLabel.frame = CGRectMake(tagsTotalWidth, tagsTotalHeight, fillLabel.frame.size.width, fillLabel.frame.size.height);
            tagsTotalWidth += fillLabel.frame.size.width + 9;
        }
        [self addSubview:fillLabel];
        
    }
    tagsTotalHeight += tagHeight;
      self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _tagViewWidth, tagsTotalHeight);
    return self.frame;
}

@end
