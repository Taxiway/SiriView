//
//  SiriView.m
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import "SiriView.h"

@implementation SiriView

const CGFloat K = 0.5;
const int nWave = 6;
const int speed = 2;

@synthesize volumn;

- (void)generateRandomTick
{
    for (int i = 0; i < nWave; ++i) {
        tickLimit[i] = rand() % 10 + 41;
        tick[i] = rand() % tickLimit[i];
        amp[i] = rand() * 0.5 / RAND_MAX + 0.5;
        int index = rand() % NCOLOR;
        for (int j = 0; j < 3; ++j) {
            color[i][j] = colors[index][j];
        }
    }
}

- (void)generateRandomPos:(int)index
{
    CGFloat width = self.bounds.size.width;
    pos[index] = (rand() - RAND_MAX * 0.5) * width * 0.5 / RAND_MAX;
}

- (void)nextState
{
    for (int i = 0; i < nWave; ++i) {
        tick[i] += speed;
        if (tick[i] >= tickLimit[i]) {
            tick[i] = 0;
            tickLimit[i] = rand() % 10 + 41;
            amp[i] = rand() * 0.5 / RAND_MAX + 0.5;
            int index = rand() % NCOLOR;
            for (int j = 0; j < 3; ++j) {
                color[i][j] = colors[index][j];
            }
            [self generateRandomPos:i];
        }
    }
}

- (void)refreshView {
    [self setNeedsDisplay];
    [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.02];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self generateRandomTick];
        for (int i = 0; i < nWave; ++i) {
            [self generateRandomPos:i];
        }
    }
    [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.02];
    return self;
}

- (CGFloat)yPos:(CGFloat)x andIndex:(int)index
{
    CGFloat gfn = pow(K / (K + pow(x, 2)), 2);
    gfn *= sin(M_PI * (0.5 + tick[index]) / tickLimit[index]);
    return MAX(0, gfn) * self.bounds.size.height / 2.0;
}

- (void)drawOneWave:(int)index withSign:(int)sign{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat width = self.bounds.size.width, height = self.bounds.size.height;
    CGContextSaveGState(context);
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGFloat x = 0, y = height / 2.0;
    CGPathMoveToPoint(pathRef, NULL, x + pos[index], y);
    for (CGFloat d = -3; d <= 3; d += 0.01) {
        CGFloat yPos = [self yPos:d andIndex:index];
        CGPathAddLineToPoint(pathRef, NULL, x + pos[index] + (3 + d) * width / 6.0, y - yPos * sign * amp[index] * volumn);
    }
    CGPathCloseSubpath(pathRef);
    CGContextAddPath(context, pathRef);
    CGContextClip(context);
    
    CGGradientRef gradient;
    CGColorSpaceRef colorSpace;
    size_t locations_num = 3;
    CGFloat locations[3] = {0.0, 0.05, 1.0};
    
    CGFloat components[12] = {
        1.0, 1.0, 1.0, 0.8,
        color[index][0]/256.0, color[index][1]/256.0, color[index][2]/256.0, 0.6,
        color[index][0]/256.0, color[index][1]/256.0, color[index][2]/256.0, 0.4
    };
    colorSpace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, locations_num);
    
    CGPoint startPoint, endPoint;
    startPoint.x = width / 2;
    startPoint.y = height / 2;
    
    endPoint.x = width / 2;
    endPoint.y = height / 2 - (height * sign / 2);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGPathRelease(pathRef);
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
}

- (void)drawOneWave:(int)index {
    [self drawOneWave:index withSign:1];
    [self drawOneWave:index withSign:-1];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    for (int i = 0; i < nWave; ++i) {
        [self drawOneWave:i];
    }
    
    [self nextState];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"Change");
    if ([keyPath isEqualToString:@"value"]) {
        UISlider *slider = (UISlider *)object;
        self.volumn = slider.value;
    }
}

@end
