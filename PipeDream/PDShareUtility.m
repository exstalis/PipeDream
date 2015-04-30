//
//  PDShareUtility.m
//  PipeDream
//
//  Created by elif ece arslan on 4/25/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDShareUtility.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation PDShareUtility

    
    

    


//utilitynin icine sadece kendini instance type olarak tanimlanam gerekiyor.. api yi falan sil

//

-(instancetype)initWithArticleURL:(NSURL *)articleURL{
    
    
    if (self=[super init]) {

        
        
        _url=[[NSURL alloc]init];
        _url=articleURL;
        
              
        _shareDialog = [[FBSDKShareDialog alloc] init];
        _shareDialog.delegate = self;
        _shareDialog.shouldFailOnDataError = YES;
        
    

    }
    return self;
    
}





- (void)dealloc
{
    _shareDialog.delegate=nil;
    
    
}



-(void) startSharing{
    
    
    NSString *const publish_actions = @"publish_actions";
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:publish_actions]) {

        
        [self getShareDialogWithContentURL:_url];
        _shareDialog.delegate = self;

        [_shareDialog show];
    
    } else {
        [[[FBSDKLoginManager alloc] init]
         logInWithPublishPermissions:@[publish_actions]
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if ([result.grantedPermissions containsObject:publish_actions]) {

                 [self getShareDialogWithContentURL:_url];
                 _shareDialog.delegate = self;

                 [_shareDialog show];
                 
                 
                 
                 
             } else {
                 
                 

                 [_delegate shareUtilityDidFailShareOnFacebook:error];
                 
                 
                 
             }
         }];
    }

}
                       
#pragma mark - FBSDKSharingDelegate


- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results {
    

    [_delegate shareUtilityDidCompleteShareOnFacebook];


}


- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    
    NSLog(@"Unexpected error when sharing : %@", error);
    [_delegate shareUtilityDidFailShareOnFacebook:error];
    
    
    
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer {
    
    [_delegate shareUtilityEndWithError];
    

}





- (FBSDKShareLinkContent *)getShareLinkContentWithContentURL:(NSURL *)objectURL
{
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = objectURL;
    return content;
}

- (FBSDKShareDialog *)getShareDialogWithContentURL:(NSURL *)objectURL
{
    FBSDKShareDialog *shareDialog = [[FBSDKShareDialog alloc] init];
    shareDialog.shareContent = [self getShareLinkContentWithContentURL:objectURL];
    _shareDialog.shareContent=shareDialog.shareContent;
    
    return shareDialog;
}




@end
