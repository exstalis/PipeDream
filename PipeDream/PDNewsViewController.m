//
//  PDNewsViewController.m
//  PipeDream
//
//  Created by elif ece arslan on 4/8/15.
//  Copyright (c) 2015 elif ece arslan. All rights reserved.
//

#import "PDNewsViewController.h"
#import "PDFeedTableViewCell.h"



@interface PDNewsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuLeftBarButtonItem;

- (IBAction)menuButtonPressed:(id)sender;
//@property(nonatomic) UIButton *menuButton;
@property(nonatomic)   PDDrawerViewController *drawer;
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end



@implementation PDNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsTableView.delegate=self;
    self.newsTableView.dataSource=self;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)menuButtonPressed:(id)sender {
 

    [self menuAction:sender];

}


#pragma mark - tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   
    
    PDFeedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (cell==nil) {
        cell=[[PDFeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
        
    }
    
    return cell;
    
}

@end
