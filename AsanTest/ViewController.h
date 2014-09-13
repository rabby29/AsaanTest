//
//  ViewController.h
//  AsanTest
//
//  Created by MC MINI on 9/8/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <GooglePlus/GooglePlus.h>
@class GPPSignInButton;

@interface ViewController : UIViewController<FBLoginViewDelegate,GPPSignInDelegate>{
}

@property ( nonatomic) IBOutlet FBLoginView *loginView;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@property (retain, nonatomic) IBOutlet GPPSignInButton *signInButton;


@end
