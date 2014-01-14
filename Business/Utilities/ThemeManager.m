//
//  ThemeManager.m
//  ChildrenDemo
//
//  Created by Ryan on 13-1-22.
//  Copyright (c) 2013年 zhihuiguan. All rights reserved.
//

#import "ThemeManager.h"
#import "UIColor+Addition.h"

NSString * const ThemeDidChangeNotification = @"app.theme.change";
@interface ThemeManager()
@property (strong, nonatomic) NSString *themeName;
@end
@implementation ThemeManager

+ (ThemeManager *)sharedManager
{
    /*
     static dispatch_once_t once;
     static ThemeManager *instance = nil;
     dispatch_once( &once, ^{ instance = [[ThemeManager alloc] init]; } );
     return instance;
     */
    static ThemeManager *sharedManager = nil;
    
    @synchronized(self) {
        if (sharedManager == nil) {
            sharedManager = [[ThemeManager alloc] init];
        }
    }
    
    return sharedManager;
}

- (id)init
{
    if ((self = [super init]))
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"Default" forKey:@"theme"];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.themeName = [defaults objectForKey:@"theme"] ?: @"Default";
        
        [[NSUserDefaults standardUserDefaults] setObject:self.themeName forKey:@"theme"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:self.themeName ofType:@"plist"];
        self.styles = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}


- (void)setTheme:(NSString *)theme
{
    self.themeName = theme;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:self.themeName ofType:@"plist"];
    self.styles = [NSDictionary dictionaryWithContentsOfFile:path];
    
    // post notification to notify the observers that the theme has changed
    ThemeStatus status = ThemeStatusDidChange;
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:ThemeDidChangeNotification
     object:[NSNumber numberWithInt:status]];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.themeName forKey:@"theme"];
}

- (UIImage *)themeImageNamed:(NSString *)key{
   
    NSDictionary *styles = [ThemeManager sharedManager].styles;
    
    NSString *imageName = [[styles objectForKey:@"Images"] objectForKey:key];
    
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@/%@", @"Images", self.themeName,imageName];

    //APPLog(@"image path is %@",imagePath);
    return [UIImage imageNamed:imagePath];
}

- (NSString*)themeImagePathNamed:(NSString*)key{
    NSDictionary *styles = [ThemeManager sharedManager].styles;
    
    NSString *imageName = [[styles objectForKey:@"Images"] objectForKey:key];
    
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@/%@", @"Images", self.themeName,imageName];

    return imagePath;
}

- (UIColor *)themeColorNamed:(NSString *)key{
    NSDictionary *styles = [ThemeManager sharedManager].styles;
    NSString *labelColor = [[styles objectForKey:@"Colours"] objectForKey:key];
    return [UIColor colorWithHexString:labelColor];
}

- (UIFont *)defaultFont:(CGFloat)fontSize{
    return [UIFont fontWithName:@"STHeitiSC-Light" size:fontSize];
}
@end
