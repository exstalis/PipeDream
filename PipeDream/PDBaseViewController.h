//
//  PDBaseViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 3/21/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface PDBaseViewController : UIViewController<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>


@property(nonatomic,strong) NSArray* menuItems;

@property(nonatomic)UIView *contentView;
//gesture recognizerlara bak eklemen gerekebilir
- (void)showErrorViewWithError:(NSError*)error;
-(void)showEmptyViewWithInfo:(NSString *)info;

//- (void)informError:(id)error details:(NSString *)details;
//- (void)showMessage:(NSString *)message;
//- (void)showLoadingMessage:(NSString *)message;
//
//

@end
