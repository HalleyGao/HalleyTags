//
//  ViewController.m
//  HalleyTags
//
//  Created by Rafferty on 15/11/24.
//  Copyright © 2015年 Halley Gao. All rights reserved.
//

#import "ViewController.h"
#import "HGTagView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    HGTagView *tag=[[HGTagView alloc] initWithFrame:CGRectMake(10, 100,self.view.frame.size.width, 200)];
    
    NSMutableArray *array=[NSMutableArray new];
    [array addObject:@"你好"];
    [array addObject:@"你大爷"];
    [array addObject:@"好吗你说"];
    [array addObject:@"你好"];
    [array addObject:@"你大爷"];
    [array addObject:@"好吗你说"];
    CGRect frame=[tag setTagViewValue:array];
    
    tag.frame=frame;
    [self.view addSubview:tag];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
