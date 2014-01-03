//
//  ViewController.m
//  Touch
//
//  Created by Richard Lichkus on 11/1/13.
//  Copyright (c) 2013 Richard Lichkus. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.customView];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
   	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressedClear:(id)sender {
    [self.customView clearScreen];          // Clear custom view
}

- (IBAction)pressedEnableDrawing:(id)sender {
    self.customView.drawingEnabled = YES;           // Enable drawing
    _btnEnable.tintColor = [UIColor grayColor];     // Indicate enable was selected
}

- (IBAction)pressedColor:(id)sender
{
    // Set color via button tag
    switch([sender tag]){
        case 0:
            self.customView.currentColor = [UIColor redColor];
            //NSLog(@"color set to red");
            break;
        case 1:
            self.customView.currentColor = [UIColor yellowColor];
            //NSLog(@"color set to y");
            break;
        case 2:
            self.customView.currentColor = [UIColor greenColor];
            //NSLog(@"color set to g");
            break;
        case 3:
            self.customView.currentColor = [UIColor blueColor];
            //NSLog(@"color set to b");
            break;
        case 4:
            self.customView.currentColor = [UIColor blackColor];
            //NSLog(@"color set to black");
            break;
        case 5:
            self.customView.currentColor = [UIColor whiteColor];
            //NSLog(@"color set to white");
            break;
    }
    
}

-(void)deviceOrientationDidChange:(NSNotification *)notification{
    //UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    [self.customView redraw];  // Redraw customView on orientation change
}


@end
