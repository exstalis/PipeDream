//
//  PDBaseTableViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"

@interface PDBaseTableViewController :PDBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,getter=isLoading) BOOL loading;
@property(nonatomic) BOOL canLoadMore;
@property(nonatomic)BOOL canPullToResfresh;

-(void)loadDataWithResfresh:(BOOL)refresh;


@end
