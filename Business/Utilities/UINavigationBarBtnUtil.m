//
//  UINavigationBarBtnUtil.m
//  iPhoneXMPP
//
//  Created by  on 12-5-3.
//  Copyright (c) 2012年 zhihuiguan. All rights reserved.
//

#import "UINavigationBarBtnUtil.h"

@implementation UINavigationBarBtnUtil

+ (UIButton *)buttonWithTitle:(NSString *)title withAction:(SEL)action withTarget:(id)target{

    //资料 按钮
    UIFont *font = [UIFont boldSystemFontOfSize:14.0];

    UIButton *btnRightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btnRightItem setBackgroundImage:ThemeImage(@"button_bg_02") forState:UIControlStateNormal];
    [btnRightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnRightItem setTitle:title forState:UIControlStateNormal];
    btnRightItem.titleLabel.font = font;
    
    CGSize size = [title sizeWithFont:font];
    
    CGFloat floatWidth = size.width > 60?size.width:60;
    
    btnRightItem.frame = CGRectMake(0, 0, floatWidth, 30);
    
    [btnRightItem addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return btnRightItem;
}



+ (UIButton *)BackButtonWithAction:(SEL)action withTarget:(id)target{
    UIFont *font = [UIFont boldSystemFontOfSize:14.0];

    UIButton *btnRightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btnRightItem setBackgroundImage:ThemeImage(@"button_bg_01") forState:UIControlStateNormal];
    [btnRightItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnRightItem setTitle:@"返回" forState:UIControlStateNormal];

    btnRightItem.titleLabel.font = font;
    
    CGFloat floatWidth = 50.0;
    btnRightItem.frame = CGRectMake(0, 0, floatWidth, 30);
    
    [btnRightItem addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btnRightItem;

}

/**自定义navagation的返回按钮
 * returnType:void
 */
+(void)addLeftNavItemBar:(id)controller andImage:(UIImage *)btnImage Title:(NSString *)btnTitel Width:(CGFloat)btnWidth Heigth:(CGFloat)btnHeight BtnTarget:btnTarget Selector:(SEL)btnSelector{
    
    UIButton *leftBarBtn = [UIButton buttonWithNormalImage:btnImage andTitle:btnTitel width:btnWidth height:btnHeight target:btnTarget selector:btnSelector];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc]initWithCustomView:leftBarBtn];
    if ([controller isKindOfClass:[UIViewController class]]) {
        [[(UIViewController *)controller navigationItem] setLeftBarButtonItem:leftBarBtnItem];
    }
//    [leftBarBtnItem release];
}

@end


//返回指定图片、大小的圆角button
#import <QuartzCore/QuartzCore.h>

@implementation UIButton(myfun)

/**
 * 传入一个可伸缩的图片,返回一个按钮
 * 图片大小 宽度&高度:由参数指定
 */
+ (UIButton *)buttonWithNormalImage:(UIImage *)image andTitle:(NSString*)title width:(CGFloat)aWidth height:(CGFloat)aHeight target:(id)aTarget selector:(SEL)aSelector{
    //    UIImage *img = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0 )];
    UIImage *img = [image stretchableImageWithLeftCapWidth:image.size.width/2.0 topCapHeight:image.size.height/2.0];
    
    UIFont *font = [UIFont boldSystemFontOfSize:13];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(0, 0, aWidth, aHeight); // 
    
    [btn addTarget:aTarget action:aSelector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

@end
