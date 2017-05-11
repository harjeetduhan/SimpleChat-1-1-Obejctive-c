//
//  ChatViewController.h
//  SimpleChat
//
//  Created by bliss on 05/05/17.
//  Copyright © 2017 bliss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController<UIImagePickerControllerDelegate>


@property (strong, nonatomic) IBOutlet UITextField *textChatFiled;
- (IBAction)sendChat:(id)sender;
- (IBAction)replyAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)attachAction:(id)sender;
- (IBAction)reciverAttachAction:(id)sender;

- (IBAction)backAction:(id)sender;

@end
