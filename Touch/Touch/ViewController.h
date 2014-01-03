//
//  ViewController.h
//  Touch
//
//  Created by Richard Lichkus on 11/1/13.
//  Copyright (c) 2013 Richard Lichkus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface ViewController : UIViewController

- (IBAction)pressedClear:(id)sender;
- (IBAction)pressedEnableDrawing:(id)sender;
- (IBAction)pressedColor:(id)sender;

@property (weak, nonatomic) IBOutlet DrawView *customView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnEnable;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbtnColor;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbtnYellow;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbtnGreen;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbtnBlue;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbtnBlack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bbtnWhite;

@end
