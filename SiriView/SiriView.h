//
//  SiriView.h
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

static const int MAXN = 10;

@interface SiriView : UIView {
    int tick[MAXN];
    int tickLimit[MAXN];
    CGFloat pos[MAXN];
}

@end
