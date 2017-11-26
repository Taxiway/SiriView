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

@synthesize siriView, slider;

- (void)refreshView {
    self.siriView.volumn = self.slider.value;
    [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.02];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.blackColor;
    
    CGRect frame = self.view.bounds;
    frame.size.height = 50.0;
    frame.size.width = 400.0;
    self.siriView = [[SiriView alloc] initWithFrame:frame];
    CGPoint center = self.siriView.center;
    center.x = self.view.center.x;
    self.siriView.center = center;
    [self.view addSubview:self.siriView];
    [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.02];
    
    frame.size.width = 200;
    frame.size.height = 30;
    self.slider = [[UISlider alloc] initWithFrame:frame];
    self.slider.center = self.view.center;
    self.slider.minimumValue = 0.0;
    self.slider.maximumValue = 1.0;
    [self.view addSubview:self.slider];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
