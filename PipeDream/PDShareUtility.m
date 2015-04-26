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


-(instancetype)initWithUtility:(PDShareUtility *)utility{
    
    
    if (self=[super init]) {
     
        
        self.shareUtility=utility;
        
        
    }
    return self;
    
}





- (void)dealloc
{
    _shareUtility.delegate=nil;
    
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
