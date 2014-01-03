//
//  DrawView.m
//  Touch
//
//  Created by Richard Lichkus on 11/1/13.
//  Copyright (c) 2013 Richard Lichkus. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()
{
    NSMutableArray *allPaths;   // Store of paths
    NSMutableArray *pathColor;  // Store of colors
}
@end

@implementation DrawView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        allPaths = [[NSMutableArray alloc]init];
        pathColor = [[NSMutableArray alloc]init];
        _currentColor  = [UIColor blackColor];
        _drawingEnabled = NO;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int i = 0;
    for(UIBezierPath *currentPath in allPaths)          // Draws all previous stored paths
    {
        [currentPath setLineWidth:4];                   // Line thickness
        [currentPath setLineCapStyle:kCGLineCapRound];  // Line cap
        [[pathColor objectAtIndex:i] setStroke];        // Set line color
        [currentPath stroke];                           // Draw line
        i++;
    }
    
    [_currentColor setStroke];                  // Set color
    [path setLineWidth:4];                      // Line thickness
    [path setLineCapStyle:kCGLineCapRound];     // Line cap
    [path stroke];                              // Draw line
    //NSLog(@"Draw");
}

// Touch Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_drawingEnabled)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        
        path = [UIBezierPath bezierPath];           // Create path
        path.miterLimit = -100;                     // Smoother corners
        [path moveToPoint:point];                   // Set initial start point

        //[self setNeedsDisplay];
        NSLog(@"began %f, %f",point.x,point.y);
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_drawingEnabled)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
    
        [path addLineToPoint:point];                // Add point to current path

        [self setNeedsDisplay];                     // Update display
        NSLog(@"moved %f, %f",point.x,point.y);
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_drawingEnabled)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
    
        [path addLineToPoint:point];                // Add point to finish path
        [allPaths addObject:path];                  // Add path to array
        [pathColor addObject:_currentColor];        // Add current color state
        [self setNeedsDisplay];                     // Update display
        NSLog(@"ended %f, %f",point.x,point.y);
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}

-(void)clearScreen{
    [path removeAllPoints];            // Clear current path
    [allPaths removeAllObjects];       // Remove all stored paths
    [pathColor removeAllObjects];      // Remove all stored colors
    [self setNeedsDisplay];            // Update display
}

-(void)redraw{
    [self setNeedsDisplay];            // Redraw image (used for orientation changes)
}

@end
