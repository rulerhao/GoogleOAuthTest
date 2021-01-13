//
//  ViewController.m
//  GoogleOAuthTest
//
//  Created by louie on 2021/1/12.
//

#import "ViewController.h"
@import GoogleSignIn;

@interface ViewController ()
@property(nonatomic, strong) GIDSignInButton *gidSignButton;
@property(nonatomic, strong) UIButton *buttonToTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [GIDSignIn sharedInstance].presentingViewController = self;

    // Automatically sign in the user.
    [[GIDSignIn sharedInstance] restorePreviousSignIn];
    
    //--------------------- View Init -----------------------
    [self viewInit];
    //--------------------- Constraints set -----------------------
    [self updateConstraints];
}
#pragma mark - View Init

- (void) viewInit {
    //--------------------- GIDSignInButton -----------------------
    self.gidSignButton = [[GIDSignInButton alloc] initWithFrame:CGRectZero];
    [self.gidSignButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:self.gidSignButton];
    //--------------------- ButtonToTest -----------------------
    self.buttonToTest = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.buttonToTest setTitle:@"TestButton" forState:normal];
    [self.buttonToTest setBackgroundColor:[UIColor grayColor]];
    [self.buttonToTest addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonToTest];
    
}

#pragma mark - Constraints

- (void)updateConstraints {
    //--------------------- ColumnTextView -----------------------
    [self.gidSignButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
    
    //--------------------- ButtonToTest -----------------------
    [self.buttonToTest mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gidSignButton.mas_bottom).offset(100);
        make.bottom.equalTo(self.view.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

#pragma mark - Target Action
- (void) buttonAction : (UIButton *) sender {
    [[GIDSignIn sharedInstance] signOut];
}

@end
