//
//  AppDelegate.h
//  GoogleOAuthTest
//
//  Created by louie on 2021/1/12.
//

#import <UIKit/UIKit.h>

@import GoogleSignIn;
@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;
@end

