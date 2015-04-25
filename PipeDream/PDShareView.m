//
//  PDShareView.m
//  PipeDream
//
//  Created by elif ece arslan on 4/24/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDShareView.h"

@implementation PDShareView

-(PDShareButton *)shareButtoninitWith:(PDShareButton *)button{
    
    if (self.shareButton==nil) {
        self.shareButton=[[PDShareButton alloc]init];
    }
    
    _shareButton=button;
    return _shareButton;
    
    
}

-(void)sharingOptions{
    
    
    self.popupViewShowed=NO;
    
    RNBlurModalView *modal;
    
    
    if (!_popupViewShowed) {
        
        modal = [[RNBlurModalView alloc] initWithTitle:@"Hello world! Hello world! Hello world! Hello world! Hello world! Hello world! Hello world!" message:@"This is the default modal for RNBlurModalView. Feel free to pass any UIView to it as you wish!"];
        modal.defaultHideBlock = ^{
            NSLog(@"Code called after the modal view is hidden");
        };
    }
    
    else{
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        view.backgroundColor = [UIColor redColor];
        view.layer.cornerRadius = 5.f;
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 5.f;
        
        modal = [[RNBlurModalView alloc] initWithView:view];
    }
    
    
    [modal show];
    
    
}
@end
