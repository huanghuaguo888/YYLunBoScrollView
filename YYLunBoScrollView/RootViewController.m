//
//  RootViewController.m
//  YYLunBoScrollView
//
//  Created by wangyuanyuan on 15/3/3.
//  Copyright (c) 2015年 wangyuanyuan. All rights reserved.
//

#import "RootViewController.h"
#import "YYCycleScrollView.h"
@interface RootViewController ()

//@property (nonatomic , assign) NSInteger pageIndex;
@property(nonatomic,strong)UIImageView *currentImage;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    YYCycleScrollView *cycleScrollView = [[YYCycleScrollView alloc] initWithFrame:CGRectMake((self.view.frame.size.width- self.currentImage.frame.size.width)*0.08, 100, 350, 300) animationDuration:2.0];
//    cycleScrollView.backgroundColor = [UIColor redColor];
    
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 350, 300)];
        self.currentImage = tempImageView;
        
        tempImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        tempImageView.contentMode = UIViewContentModeScaleAspectFill;
        tempImageView.clipsToBounds = true;
        [viewArray addObject:tempImageView];
    }
    [cycleScrollView setFetchContentViewAtIndex:^UIView *(NSInteger(pageIndex)) {
        return [viewArray objectAtIndex:pageIndex];
    }];
    [cycleScrollView setTotalPagesCount:^NSInteger{
        return 5;
    }];
    [cycleScrollView setTapActionBlock:^(NSInteger(pageIndex)) {
        
        NSLog(@"点击的相关的页面%ld",(long)pageIndex);
        
    }];
    
    [self.view addSubview:cycleScrollView];

    
    
    
    
        
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
