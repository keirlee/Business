//
//  UINavigationBarBtnUtil.h
//  iPhoneXMPP
//
//  Created by  on 12-5-3.
//  Copyright (c) 2012年 zhihuiguan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface UINavigationBarBtnUtil : NSObject

+ (UIButton *)buttonWithTitle:(NSString *)title withAction:(SEL)action withTarget:(id)target;
+ (UIButton *)BackButtonWithAction:(SEL)action withTarget:(id)target;
+(void)addLeftNavItemBar:(id)controller andImage:(UIImage *)btnImage Title:(NSString *)btnTitel Width:(CGFloat)btnWidth Heigth:(CGFloat)btnHeight BtnTarget:btnTarget Selector:(SEL)btnSelector;
@end

@interface UIButton(myfun)
+ (UIButton *)buttonWithNormalImage:(UIImage *)image andTitle:(NSString*)title width:(CGFloat)aWidth height:(CGFloat)aHeight target:(id)aTarget selector:(SEL)aSelector;
@end
