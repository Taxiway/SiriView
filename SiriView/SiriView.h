//
//  SiriView.h
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

static const int MAXN = 10;
static const int NCOLOR = 6;
static float colors[NCOLOR][3] = {
    32, 133, 252,
    94, 252, 169,
    253, 71, 103,
    45, 246, 238,
    252, 18, 245,
    224, 245, 22
};

@interface SiriView : UIView {
    int tick[MAXN];
    int tickLimit[MAXN];
    CGFloat amp[MAXN];
    CGFloat pos[MAXN];
    float color[MAXN][3];
}

@property (nonatomic) CGFloat volumn;

@end
