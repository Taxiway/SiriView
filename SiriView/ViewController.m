//
//  ViewController.m
//  SiriView
//
//  Created by Hang on 11/22/17.
//  Copyright © 2017 Hang. All rights reserved.
//

#import "ViewController.h"
#import "SiriView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize siriView;

- (void)refreshView {
    [self.siriView setNeedsDisplay];
    [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.02];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.blackColor;
    CGRect frame = self.view.bounds;
    frame.size.height = 100.0;
    self.siriView = [[SiriView alloc] initWithFrame:frame];
    [self.view addSubview:self.siriView];
    [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.02];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
