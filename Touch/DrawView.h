//
//  DrawView.h
//  Touch
//
//  Created by Richard Lichkus on 11/1/13.
//  Copyright (c) 2013 Richard Lichkus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
{
    UIBezierPath *path;
}
@property UIColor *currentColor;
@property BOOL drawingEnabled;

- (void)clearScreen;
- (void)redraw;

@end
