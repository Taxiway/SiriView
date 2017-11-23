//
//  SiriView.m
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import "SiriView.h"

@implementation SiriView

const CGFloat K = 1.0;

- (CGFloat)yPos:(CGFloat)x
{
    CGFloat gfn = pow(K / (K + pow(x, 2)), 2);
    gfn *= cos(M_PI * tick / 100);
    return MAX(0, gfn) * self.bounds.size.height / 2.0;
}

- (void)drawRect:(CGRect)rect {
    tick += 1;
    if (tick == 51) {
        tick = 0;
    }
    CGFloat width = self.bounds.size.width, height = self.bounds.size.height;
    if (tick == 0) {
        pos = (rand() - RAND_MAX * 0.5) * width * 0.5 / RAND_MAX;
    }
    CGContextClearRect(UIGraphicsGetCurrentContext(), rect);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGMutablePathRef pathRef = CGPathCreateMutable();

    CGFloat x = 0, y = height / 2.0;
    CGPathMoveToPoint(pathRef, NULL, x + pos, y);
    for (CGFloat i = -3; i <= 3; i += 0.01) {
        CGFloat yPos = [self yPos:i];
        CGPathAddLineToPoint(pathRef, NULL, x + pos + (3 + i) * width / 6.0, y - yPos);
    }
    CGPathCloseSubpath(pathRef);
    CGContextAddPath(context, pathRef);
    CGContextClip(context);

    CGGradientRef gradient;
    CGColorSpaceRef colorSpace;
    size_t locations_num = 2;
    CGFloat locations[2] = {0.0, 1.0};

    CGFloat components[8] = {  32/256.0, 133/256.0, 252/256.0, 0.2,
        32/256.0, 133/256.0, 252/256.0, 0.4
    };
    colorSpace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, locations_num);

    CGPoint startPoint, endPoint;
    startPoint.x = width / 2;
    startPoint.y = height / 2;
    
    endPoint.x = width / 2;
    endPoint.y = 0;
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
}


@end
