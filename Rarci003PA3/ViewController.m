//  PROGRAMMER: Roberto Arciniegas
//  PANTHERID: 1385020
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Participation Assignment #3
//  DUE:            Tuesday 10/13/15
//
//  ViewController.m
//  Rarci003PA3
//
//  Created by roberto arciniegas on 10/13/15.
//  Copyright (c) 2015 roberto arciniegas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize motionManager, movingButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .01;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
}

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    CGRect newButtonPressLocation = movingButton.frame;
    newButtonPressLocation.origin.y -= (5 * acceleration.y);
    newButtonPressLocation.origin.x += (5 * acceleration.x);
    
    if (newButtonPressLocation.origin.y < 0)
        newButtonPressLocation.origin.y = 1024;
    if (newButtonPressLocation.origin.y > 1024)
        newButtonPressLocation.origin.y = 0;
    
    if (newButtonPressLocation.origin.x < 0)
        newButtonPressLocation.origin.x = 768;
    if (newButtonPressLocation.origin.x > 768)
        newButtonPressLocation.origin.x = 0;
    
    [UIView animateWithDuration:0 animations:^{
        movingButton.frame = newButtonPressLocation;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
