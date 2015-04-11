//
//  PDBaseTableViewController.h
//  PipeDream
//
//  Created by elif ece arslan on 4/9/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDBaseViewController.h"
#import "PDNavigationController.h"
#import "PDDrawerViewController.h"
#import "PDDrawerTableViewCell.h"
#import "PDDrawerCustomCellBackground.h"

@interface PDBaseTableViewController : PDBaseViewController<PDDrawerViewContollerDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *menuTableView;



@end
