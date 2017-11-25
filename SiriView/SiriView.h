//
//  SiriView.h
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

static const int MAXN = 10;
static float colors[3][3] = {
    32, 133, 252,
    94, 252, 169,
    253, 71, 103
};

@interface SiriView : UIView {
    int tick[MAXN];
    int tickLimit[MAXN];
    CGFloat amp[MAXN];
    CGFloat pos[MAXN];
    float color[MAXN][3];
}

@end
