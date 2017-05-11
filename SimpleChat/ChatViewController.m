//
//  ChatViewController.m
//  SimpleChat
//
//  Created by bliss on 05/05/17.
//  Copyright © 2017 bliss. All rights reserved.
//

#import "ChatViewController.h"
#import "CellTableView.h"

@interface ChatViewController ()
{
    NSMutableArray *senderArray,*reciverArray;
     NSData *imageData;
  
}

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    senderArray = [[NSMutableArray alloc] init];
    reciverArray = [[NSMutableArray alloc] init];
    
    //hide reciver controls
    CellTableView *cell = [self.tableView dequeueReusableCellWithIdentifier:@"senderCell"];
    cell.self.reciverProfImage.layer.cornerRadius=15;
    cell.self.reciverProfImage.clipsToBounds=YES;
    
    cell.self.profImae.layer.cornerRadius=15;
    cell.self.profImae.clipsToBounds=YES;

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [senderArray count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *senderCell = @"senderCell";
    CellTableView *cell= [tableView dequeueReusableCellWithIdentifier:senderCell];
            if (cell == nil)
            {
                cell = [[CellTableView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:senderCell];
            }
    
    if([[[senderArray objectAtIndex:indexPath.row ]valueForKey:@"id"] isEqualToString:@"ME"])
    {
        cell.self.profImae.layer.cornerRadius=15;
        cell.self.profImae.clipsToBounds=YES;
        cell.self.senderTextLabel.layer.cornerRadius=5;
        cell.self.senderTextLabel.clipsToBounds=YES;
        
        //sender Image
        cell.self.senderImage.hidden=NO;
        
        //hide reciver controls
        cell.self.reciverProfImage.hidden=YES;
        cell.self.reciverTextLabel.hidden=YES;
        
       //-un-hide reciver controls
        cell.self.profImae.hidden=NO;
        cell.self.senderTextLabel.hidden=NO;
        
        cell.profImae.image=[UIImage imageNamed:@"sender.jpeg"];
         cell.senderTextLabel.backgroundColor=[UIColor blueColor];
        cell.senderTextLabel.textAlignment=NSTextAlignmentRight;
        cell.senderTextLabel.numberOfLines = 0;
        cell.senderTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
       // [cell.senderTextLabel sizeToFit];
        cell.senderTextLabel.text = [[senderArray objectAtIndex:indexPath.row] valueForKey:@"text"];
        cell.senderImage.image =[UIImage imageNamed:[[senderArray objectAtIndex:indexPath.row] valueForKey:@"image"]];
       

    }
    else   if([[[senderArray objectAtIndex:indexPath.row ]valueForKey:@"id"] isEqualToString:@"YOU"])
    {
        cell.self.reciverProfImage.layer.cornerRadius=15;
        cell.self.reciverProfImage.clipsToBounds=YES;
        cell.self.reciverTextLabel.layer.cornerRadius=5;
        cell.self.reciverTextLabel.clipsToBounds=YES;
        
        //======Sender image
        cell.self.senderImage.hidden=YES;
        
        //Un-hide reciver controls
        cell.self.reciverProfImage.hidden=NO;
        cell.self.reciverTextLabel.hidden=NO;
        
        //hide reciver controls
        cell.self.profImae.hidden=YES;
        cell.self.senderTextLabel.hidden=YES;
        

        cell.reciverTextLabel.numberOfLines = 0;
        cell.reciverTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
       // [cell.reciverTextLabel sizeToFit];

        cell.reciverProfImage.image=[UIImage imageNamed:@"reciver.jpeg"];
        cell.reciverTextLabel.backgroundColor=[UIColor greenColor];
         cell.reciverTextLabel.text = [[senderArray objectAtIndex:indexPath.row] valueForKey:@"text"];
        
    }
    else if([[[senderArray objectAtIndex:indexPath.row ]valueForKey:@"idImage"] isEqualToString:@"IMAGE"])
    {
        cell.self.profImae.layer.cornerRadius=15;
        cell.self.profImae.clipsToBounds=YES;
        
        //sender Image
        cell.self.senderImage.hidden=NO;
         cell.self.reciverImae.hidden=YES;
        
        //hide reciver controls
        cell.self.reciverProfImage.hidden=YES;
        cell.self.reciverTextLabel.hidden=YES;
        
        //hide SENDER controls
        cell.self.profImae.hidden=NO;
        cell.self.senderTextLabel.hidden=NO;
        
       //  cell.senderTextLabel.backgroundColor=[UIColor blueColor];
        cell.profImae.image=[UIImage imageNamed:@"sender.jpeg"];
        cell.senderImage.image =[UIImage imageNamed:[[senderArray objectAtIndex:indexPath.row] valueForKey:@"image"]];
    }
    else if([[[senderArray objectAtIndex:indexPath.row ]valueForKey:@"idImage"] isEqualToString:@"IMAGERe"])
    {
        cell.self.reciverProfImage.layer.cornerRadius=15;
        cell.self.reciverProfImage.clipsToBounds=YES;
        
        //sender Image
        cell.self.senderImage.hidden=YES;
         cell.self.reciverImae.hidden=NO;
        
        //hide reciver controls
        cell.self.reciverProfImage.hidden=NO;
        cell.self.reciverTextLabel.hidden=YES;
        
        //hide SENDER controls
        cell.self.profImae.hidden=YES;
        cell.self.senderTextLabel.hidden=YES;
        
        //  cell.senderTextLabel.backgroundColor=[UIColor blueColor];
          cell.reciverProfImage.image=[UIImage imageNamed:@"reciver.jpeg"];
        cell.reciverImae.image =[UIImage imageNamed:[[senderArray objectAtIndex:indexPath.row] valueForKey:@"image"]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *senderCell = @"senderCell";
    CellTableView *cell= [tableView dequeueReusableCellWithIdentifier:senderCell];

    return cell.reciverTextLabel.frame.size.width*0.2;
    //return UITableViewAutomaticDimension;
}


//------------------------------- SEND MESSAGE----------------------------------
- (IBAction)sendChat:(id)sender
{
    NSString *textMessage =self.textChatFiled.text;
    NSLog(@"Text Message -- %@", textMessage);
    self.textChatFiled.text=@"";
    
    NSUserDefaults *userDefault =[NSUserDefaults standardUserDefaults];
    [userDefault setObject:@" " forKey:@"action"];
    [userDefault synchronize];
      
    //Make dict for sender array
    NSMutableDictionary   *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:textMessage forKey:@"text"];
    [dictionary setObject:@"ME" forKey:@"id"];
    
     NSLog(@"dictionary: %@", dictionary);
    [senderArray addObject:dictionary];
      NSLog(@"Sender Array: %@", senderArray);
    
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:senderArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

//------------------------------- REPLY MESSAGE----------------------------------
- (IBAction)replyAction:(id)sender
{
    NSString *lastText =self.textChatFiled.text;
    NSLog(@"last text -- %@", lastText);    
    
    if(lastText.length>0)
    {
         self.textChatFiled.text=@"";
        NSUserDefaults *userDefault =[NSUserDefaults standardUserDefaults];
        [userDefault setObject:@"reply" forKey:@"action"];
        [userDefault synchronize];
        
       
        //Make dict for sender array
     NSMutableDictionary   *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:lastText forKey:@"text"];
                [dictionary setObject:@"YOU" forKey:@"id"];
         NSLog(@"dictionary: %@", dictionary);
        [senderArray addObject:dictionary];
        NSLog(@"Reciver Array: %@", senderArray);
        
       [self.tableView reloadData];
         [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:senderArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    else{
         NSLog(@"Not message");
    }
}


//sender attch image
- (IBAction)attachAction:(id)sender
{
    UIImage *img =[UIImage imageNamed:@"sender.jpeg"];
    
    //Make dict for sender array
    NSMutableDictionary   *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"sender.jpeg" forKey:@"image"];
  //[dictionary setObject:@"MEE" forKey:@"id"];
    [dictionary setObject:@"IMAGE" forKey:@"idImage"];
    
    NSLog(@"dictionary: %@", dictionary);
    [senderArray addObject:dictionary];
    NSLog(@"Sender Array: %@", senderArray);
    
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:senderArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
    ///==============================Custom
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Select Options" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
//                             {
//                                 [self cameraOpen];
//                             }];
//    UIAlertAction *gallary = [UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
//                              {
//                                  [self gallaryOpen];
//                              }];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
//    
//    [alert addAction:camera];
//    [alert addAction:gallary];
//    [alert addAction:cancel];
//    [self presentViewController:alert animated:YES completion:nil];
//    
    //================
    
}

- (IBAction)reciverAttachAction:(id)sender
{
    UIImage *img =[UIImage imageNamed:@"reciver.jpeg"];
    
    //Make dict for sender array
    NSMutableDictionary   *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"reciver.jpeg" forKey:@"image"];
    //[dictionary setObject:@"MEE" forKey:@"id"];
    [dictionary setObject:@"IMAGERe" forKey:@"idImage"];
    
    NSLog(@"dictionary: %@", dictionary);
    [senderArray addObject:dictionary];
    NSLog(@"Sender Array: %@", senderArray);
    
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:senderArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}

- (IBAction)backAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)cameraOpen
{
    NSLog(@"camera");
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
    }
    else
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

-(void)gallaryOpen
{
    NSLog(@"Gallary");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    imageData = UIImagePNGRepresentation(chosenImage);
    [picker dismissViewControllerAnimated:YES completion:NULL];
  //  [self performSelector:@selector(uploadImage) withObject:loadData afterDelay:.1];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
