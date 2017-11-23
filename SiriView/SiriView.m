//
//  SiriView.m
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import "SiriView.h"

@implementation SiriView

- (void)drawRect:(CGRect)rect {
    // Create a gradient from white to red
    CGFloat colors [] = {
        1.0, 1.0, 1.0, 1.0,
        1.0, 0.0, 0.0, 1.0
    };
    
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, colors, NULL, 2);
    CGColorSpaceRelease(baseSpace), baseSpace = NULL;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
        CGMutablePathRef pathRef = CGPathCreateMutable();
    static int i = 0;
    ++i;
    if (i == 100) i = 0;
    
        /* do something with pathRef. For example:*/
        CGPathMoveToPoint(pathRef, NULL, 100 + i, 100);
        CGPathAddLineToPoint(pathRef, NULL, 100 + i, 100+100);
        CGPathAddLineToPoint(pathRef, NULL, 200 + i, 100);
        CGPathCloseSubpath(pathRef);
    
        CGContextAddPath(context, pathRef);
    
    CGContextClip(context);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
//    CGContextRef lpCurrentContext = UIGraphicsGetCurrentContext();
//    CGGradientRef gradient;
//    CGColorSpaceRef colorSpace;
//    size_t locations_num = 2;
//
//    CGFloat locations[2] = {0.0,1.0};
//
//    CGFloat components[8] = {  1.0, 0.0, 0.0, 0.8,
//        1.0, 0.0, 0.0, 0.2
//    };
//    colorSpace = CGColorSpaceCreateDeviceRGB();
//    gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, locations_num);
//
//    CGPoint startPoint, endPoint;
//
//    //Start point
//    startPoint.x = self.frame.size.width/2;
//    startPoint.y = self.frame.size.height/2;
//
//    //End point
//    endPoint.x = self.frame.size.width/2;
//    endPoint.y = self.frame.size.height/2;
//
//    CGMutablePathRef pathRef = CGPathCreateMutable();
//
//    /* do something with pathRef. For example:*/
//    CGPathMoveToPoint(pathRef, NULL, 0, 0);
//    CGPathAddLineToPoint(pathRef, NULL, 0, 0+100);
//    CGPathAddLineToPoint(pathRef, NULL, 100, 0);
//    CGPathCloseSubpath(pathRef);
//
//    CGContextAddPath(lpCurrentContext, pathRef);
//    CGContextFillPath(lpCurrentContext);
    
    //CGContextDrawRadialGradient(lpCurrentContext, gradient, startPoint, 0, endPoint, self.frame.size.width/2, 0);
    
}


@end
