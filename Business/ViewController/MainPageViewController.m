//
//  MainPageViewController.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

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
    // Do any additional setup after loading the view from its nib.
//    self.navigationController.navigationBarHidden = YES;
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.frame = CGRectMake(10, 10, 50, 30);
    btnLeft.tag = 88;
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btnLeft setTitle:@"返回" forState:UIControlStateNormal];
    [btnLeft.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btnLeft setHidden:YES];
    [self.navigationController.navigationBar addSubview:btnLeft];
    self.mainWebView.scrollView.showsHorizontalScrollIndicator = NO;
    self.mainWebView.scrollView.showsVerticalScrollIndicator = NO;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?ios=1",WEbURL]];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back
{
    [self.mainWebView goBack];
    UIButton *btn = (UIButton *)[self.navigationController.navigationBar viewWithTag:88];
    if ([self.mainWebView canGoBack])
        btn.hidden = NO;
    else
        btn.hidden = YES;
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [MBProgressHUD hideHUDForView:webView animated:YES];
    if ([request.URL.absoluteString isEqualToString:@"http://www.cxzg.com/cxpt/ind_2/index.php?ios=1#none"]) {
        return NO;
    }
    if ([request.URL.absoluteString rangeOfString:@"#none"].length > 0) {
        [MBProgressHUD hideHUDForView:webView animated:YES];
        return NO;
    }
    
    if ([request.URL.absoluteString rangeOfString:@"tel:"].length == 0) {
        [MBProgressHUD showHUDAddedTo:webView animated:YES];
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:webView animated:YES];
    UIButton *btn = (UIButton *)[self.navigationController.navigationBar viewWithTag:88];
    if ([self.mainWebView canGoBack])
        btn.hidden = NO;
    else
        btn.hidden = YES;
}
@end
