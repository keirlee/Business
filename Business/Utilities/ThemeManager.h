//
//  ThemeManager.h
//  ChildrenDemo
//
//  Created by Ryan on 13-1-22.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef _SYSTEMCONFIGURATION_H
#error  You should include the `SystemConfiguration` framework and \
add `#import <SystemConfiguration/SystemConfiguration.h>`\
to the header prefix.
#endif

#ifdef _SYSTEMCONFIGURATION_H
extern NSString * const ThemeDidChangeNotification;
#endif

#define kThemeDefault   @"Default"
#define kThemeRed       @"Red"
#define kThemeBlue      @"Blue"
#define kThemeBlack     @"Black"

#define IMAGE(imagePath) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(imagePath) ofType:@"png"]]

#define ThemeImage(imageName) [[ThemeManager sharedManager] themeImageNamed:(imageName)]

#define ThemeColor(colorKey) [[ThemeManager sharedManager] themeColorNamed:(colorKey)]

//默认聊天界面 字型字号
#define DEFAULT_FONT_STYLE [UIFont fontWithName:@"STHeitiSC-Light" size:15.0]

#define DEFAULT_FONT_STYLE_SIZE(fontSize) [[ThemeManager sharedManager] defaultFont:(fontSize)]


typedef enum {
    ThemeStatusWillChange = 0, // todo
    ThemeStatusDidChange,
} ThemeStatus;

@interface ThemeManager : NSObject
+ (ThemeManager *)sharedManager;
- (UIImage *)themeImageNamed:(NSString *)key;
- (NSString*)themeImagePathNamed:(NSString*)key;
- (UIColor *)themeColorNamed:(NSString *)key;
- (UIFont *)defaultFont:(CGFloat)fontSize;
@property (strong, nonatomic) NSMutableDictionary *styles;
@end
