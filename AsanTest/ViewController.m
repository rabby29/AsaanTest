    //
    //  ViewController.m
    //  AsanTest
    //
    //  Created by MC MINI on 9/8/14.
    //  Copyright (c) 2014 Tech Fiesta. All rights reserved.
    //

    #import "ViewController.h"
    #import <GoogleOpenSource/GoogleOpenSource.h>
    #import "GTLPersonendpoint.h"

    #import <GooglePlus/GooglePlus.h>


    @interface ViewController ()

    @end

    @implementation ViewController

    @synthesize signInButton;



    - (void)viewDidLoad
    {
        [super viewDidLoad];
            self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
        [self GPSigninInit];
        
     
      
    }

    #pragma mark -GPlus login

    -(void)GPSigninInit{
        GPPSignIn *signIn = [GPPSignIn sharedInstance];
        signIn.shouldFetchGooglePlusUser = YES;
        signIn.shouldFetchGoogleUserEmail = YES;  // Uncomment to get the user's email
        
        // You previously set kClientId in the "Initialize the Google+ client" step
        signIn.clientID = @"1041863510961-fmarksr003s0fvdisitq7lff8jlub2pa.apps.googleusercontent.com";
        
        // Uncomment one of these two statements for the scope you chose in the previous step
        signIn.scopes = @[ kGTLAuthScopePlusLogin,@"profile" ];  // "https://www.googleapis.com/auth/plus.login" scope
       // signIn.scopes = @[ @"profile" ];            // "profile" scope
        
        // Optional: declare signIn.actions, see "app activities"
        signIn.delegate = self;
    }




    - (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
          finishedWithAuth:(GTMOAuth2Authentication *)auth
                     error:(NSError *)error {
        [self dismissViewControllerAnimated:YES completion:nil];
        
        if (error != nil) {
            // Authentication failed
        } else {
            // Authentication succeeded

            NSLog(@"result: %@",auth);
            // Make some API calls
        }
    }



    - (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                       error: (NSError *) error {
        NSLog(@"Received error %@ and auth object %@",error, auth);
    }

    - (void)didDisconnectWithError:(NSError *)error{
        NSLog(@"%@",[error description]);
    }

    - (void)presentSignInViewController:(UIViewController *)viewController {
        // This is an example of how you can implement it if your app is navigation-based.
        NSLog(@"pushed");
        [[self navigationController] pushViewController:viewController animated:YES];
    }

    #pragma mark -FBLogin

    - (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                                user:(id<FBGraphUser>)user {
        self.profilePictureView.profileID =user.objectID;
        self.nameLabel.text = user.name;
    }

    - (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
        self.statusLabel.text = @"You're logged in as";
    }
    - (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
        self.profilePictureView.profileID = nil;
        self.nameLabel.text = @"";
        self.statusLabel.text= @"You're not logged in!";
    }

    - (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
        NSString *alertMessage, *alertTitle;
      
        if ([FBErrorUtility shouldNotifyUserForError:error]) {
            alertTitle = @"Facebook error";
            alertMessage = [FBErrorUtility userMessageForError:error];
            
        } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
            alertTitle = @"Session Error";
            alertMessage = @"Your current session is no longer valid. Please log in again.";
            
          
        } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
            NSLog(@"user cancelled login");
            
           
         } else {
            alertTitle  = @"Something went wrong";
            alertMessage = @"Please try again later.";
            NSLog(@"Unexpected error:%@", error);
        }
        
        if (alertMessage) {
            [[[UIAlertView alloc] initWithTitle:alertTitle
                                        message:alertMessage
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
    }






    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    #pragma mark AppEngine Test

    - (IBAction)Signin:(id)sender
    {
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        GTLPersonendpointDeviceInfo *deviceinfo=[GTLPersonendpointDeviceInfo alloc];
        deviceinfo.deviceFormFactor=@"Phone";
        deviceinfo.deviceOS=@"ios";
        deviceinfo.deviceMACAddress=@"FB:12:34:56:78";
        
        
        GTLQueryPersonendpoint *querry =[GTLQueryPersonendpoint queryForNativeLoginWithObject:deviceinfo email:@"test1@test2.com" password:@"password"];
        
        
        if(querry==nil){
            NSLog(@"querry nil");
        }
        
        static GTLServicePersonendpoint *service = nil;
        if (!service) {
            service = [[GTLServicePersonendpoint alloc] init];
            service.retryEnabled = YES;
            [GTMHTTPFetcher setLoggingEnabled:YES];
        }
        
        
        [service executeQuery:querry completionHandler:^(GTLServiceTicket *ticket,GTLPersonendpointPersonInfoWrapper*  object,NSError *error){
            
            
            NSLog(@"Signin error: %@",[error.userInfo description]);
            NSLog(@"Signin object %@",[object description]);
            
            
            
        }];
    }

    -(IBAction)Signup:(id)sender{
        
        

        GTLPersonendpointPersonInfoWrapper *personInfoWrapper=[GTLPersonendpointPersonInfoWrapper alloc];
        GTLPersonendpointDeviceInfo *deviceinfo=[GTLPersonendpointDeviceInfo alloc];
        GTLPersonendpointPersonProfile *personalProfile=[GTLPersonendpointPersonProfile alloc];
        GTLPersonendpointPersonCredentials *personCredintial=[GTLPersonendpointPersonCredentials alloc];



        [personInfoWrapper setPersonProfile:personalProfile];
        [personInfoWrapper setPersonCredentials:personCredintial];
        [personInfoWrapper setDeviceInfo:deviceinfo];

        deviceinfo.deviceFormFactor=@"Phone";
        deviceinfo.deviceOS=@"ios";
        deviceinfo.deviceMACAddress=@"FB:12:34:56";
        deviceinfo.deviceGCMRegistrationId=@"bakhfad alsdjads";
        deviceinfo.deviceManufacturer=@"Apple";
        deviceinfo.deviceOSVersion=@"7.1";

        [personalProfile setName:@"Rabbi alam"];
        personalProfile.city=@"Dhaka";
        [personalProfile setPhone:@"017103528952"];
        personalProfile.zip=@"1200-12";
        personalProfile.streetAddress=@"Dhanmondi 1";
        personalProfile.state=@"dhaka";
        
       
        [personCredintial setEmail:@"rabbyalam@gmail.com"];
        personCredintial.profilePhotoUrl=@"http://myGplus.profile.photo.png";
        
        [personCredintial setOwner:personalProfile];
        
        [personCredintial setLoginProviderType:[NSNumber numberWithInt:0]];
        personCredintial.userId=@"";
        [personCredintial setToken:@"password"];
        
        
        

        
        
       // NSLog(@"log %@",[personInfoWrapper.personProfile description]);
        GTLQueryPersonendpoint *querry=[GTLQueryPersonendpoint queryForNativeSignupWithObject:personInfoWrapper];
       
    
        static GTLServicePersonendpoint *service = nil;
        if (!service) {
            service = [[GTLServicePersonendpoint alloc] init];
            service.retryEnabled = YES;
            [GTMHTTPFetcher setLoggingEnabled:YES];
        }
        
       
        
        [service executeQuery:querry completionHandler:^(GTLServiceTicket *ticket,GTLPersonendpointPersonInfoWrapper* object,NSError *error){
            
            
            
            
            NSLog(@"Signpu error: %@",[error.userInfo description]);
            NSLog(@"Signup object %@",[object description]);
            
            
        }];

    }

    @end
