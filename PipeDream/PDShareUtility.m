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
{
    NSString *_articleTitle;
    FBSDKMessageDialog *_messageDialog;
    UIImage *_articleImage;
    int _sendAsMessageButtonIndex;
    FBSDKShareAPI *_shareAPI;
    FBSDKShareDialog *_shareDialog;
    NSArray *_friends;
    NSString *_place;
}



-(instancetype)initWithArticleTitle:(NSString *)articleTitle place:(NSString *)place friends:(NSArray *)friends photo:(UIImage *)articleImage{
    if (self=[super init]) {
        _articleTitle=[articleTitle copy];
        _articleImage=[self _normalizeImage:articleImage];
        _place=[place copy];
        _friends=[friends copy];
        FBSDKShareOpenGraphContent *shareContent = [self contentForSharing];
        
        _shareAPI = [[FBSDKShareAPI alloc] init];
        _shareAPI.delegate = self;
        _shareAPI.shareContent = shareContent;
        
        _shareDialog = [[FBSDKShareDialog alloc] init];
        _shareDialog.delegate = self;
        _shareDialog.shouldFailOnDataError = YES;
        _shareDialog.shareContent = shareContent;
        
        _messageDialog = [[FBSDKMessageDialog alloc] init];
        _messageDialog.delegate = self;
        _messageDialog.shouldFailOnDataError = YES;
        _messageDialog.shareContent = shareContent;
        
        
    }
    return self;

}



- (void)dealloc
{
    _shareAPI.delegate = nil;
    _shareDialog.delegate = nil;
    _messageDialog.delegate = nil;
}



- (void)_postOpenGraphAction
{
    NSString *const publish_actions = @"publish_actions";
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:publish_actions]) {
        [self.delegate shareUtilityWillShare:self];
        [_shareAPI share];
    } else {
        [[[FBSDKLoginManager alloc] init]
         logInWithPublishPermissions:@[publish_actions]
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if ([result.grantedPermissions containsObject:publish_actions]) {
                 [self.delegate shareUtilityWillShare:self];
                 [_shareAPI share];
             } else {
                 // This would be a nice place to tell the user why publishing
                 // is valuable.
                 [_delegate shareUtility:self endWithError:nil];
             }
         }];
    }
}

- (void)start
{
    [self _postOpenGraphAction];
}









- (UIImage *)_normalizeImage:(UIImage *)image
{
    if (!image) {
        return nil;
    }
    
    CGImageRef imgRef = image.CGImage;
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    CGSize imageSize = bounds.size;
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    
    switch (orient) {
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        default:
            // image is not auto-rotated by the photo picker, so whatever the user
            // sees is what they expect to get. No modification necessary
            transform = CGAffineTransformIdentity;
            break;
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if ((image.imageOrientation == UIImageOrientationDown) ||
        (image.imageOrientation == UIImageOrientationRight) ||
        (image.imageOrientation == UIImageOrientationUp)) {
        // flip the coordinate space upside down
        CGContextScaleCTM(context, 1, -1);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}
                       
                       
#pragma mark - FBSDKSharingDelegate


- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results {
    [_delegate shareUtilityDidCompleteShare:self];
}

- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    [_delegate shareUtility:self endWithError:error];
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer {
    [_delegate shareUtility:self endWithError:nil];
}





//boyle olacak

//contenti cekmek viewlerin icinde

// FBSDKShareDialog *facebookShareDialog = [self getShareDialogWithContentURL:[self _currentPhoto].objectURL];
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
    return shareDialog;
}




@end
