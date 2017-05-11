//
//  ViewController.m
//  SimpleChat
//
//  Created by bliss on 05/05/17.
//  Copyright © 2017 bliss. All rights reserved.
//

#import "ViewController.h"
#import "ChatViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startChatAction:(id)sender
{
    ChatViewController *chatView =[self.storyboard instantiateViewControllerWithIdentifier:@"ChatViewController"];
    [self.navigationController pushViewController:chatView animated:YES];
}
@end
