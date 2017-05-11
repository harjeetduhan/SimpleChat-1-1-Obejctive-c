//
//  CellTableView.h
//  SimpleChat
//
//  Created by bliss on 05/05/17.
//  Copyright © 2017 bliss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellTableView : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *senderTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *reciverTextLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profImae;
@property (strong, nonatomic) IBOutlet UIImageView *reciverProfImage;
@property (strong, nonatomic) IBOutlet UIImageView *senderImage;
@property (strong, nonatomic) IBOutlet UIImageView *reciverImae;

@end
