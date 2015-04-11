//
//  PDFeedTableViewCell.h
//  PipeDream
//  Created by elif ece arslan on 4/8/15.


#import <UIKit/UIKit.h>






@interface PDFeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) IBOutlet UILabel *articleSummaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *articleDateLabel;
@property (strong, nonatomic) IBOutlet UIView *newsCell;

@end
