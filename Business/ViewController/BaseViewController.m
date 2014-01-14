//
//  BaseViewController.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBarBtnUtil.h"
#import "UIColor+Addition.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (IOS7_OR_LATER) {
        self.edgesForExtendedLayout= UIRectEdgeNone;
    }
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#c3c3c3"]];
    if (IOS7_OR_LATER) {
//        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#b10000"]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg1.png"] forBarMetrics:UIBarMetricsDefault];
    }
    else{
//        self.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"#b10000"];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg.png"] forBarMetrics:UIBarMetricsDefault];
    }
    self.title = @"药交会";
    
//    if (IOS_VERSION > 4.9) {
//        //iOS5+
//        
//        
//        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
//                                                 initWithTitle:@"返回"
//                                                 style:UIBarButtonItemStylePlain
//                                                 target:self
//                                                 action:nil];
//        
//        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"button_bg_01"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)]
//                                                          forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        
////        [[UIBarButtonItem appearance] setBackgroundImage:[ThemeImage(@"button_bg_02") resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)]
////                                                forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    } else {
//        // 用来被拉伸的图片
//        UIButton *rightButton = [UINavigationBarBtnUtil BackButtonWithAction:@selector(back) withTarget:self];
//        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//        
//        [self.navigationItem setLeftBarButtonItem:leftItem];
//        if ([self.navigationController.viewControllers objectAtIndex:0]==self) {
//            self.navigationItem.leftBarButtonItem.customView.hidden=YES;
//        }
//        
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
