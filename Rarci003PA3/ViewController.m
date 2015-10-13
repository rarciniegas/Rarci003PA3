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
@synthesize movingLabel, motionManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
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
    CGRect newButtonPressLocation = movingLabel.frame;
    newButtonPressLocation.origin.y -= (50 * acceleration.y);
    newButtonPressLocation.origin.x += (50 * acceleration.x);
    if (newButtonPressLocation.origin.y < 0)
        newButtonPressLocation.origin.y = 1056;
    if (newButtonPressLocation.origin.y > 1056)
        newButtonPressLocation.origin.y = 0;
    
    
    
    if (newButtonPressLocation.origin.x < 0)
        newButtonPressLocation.origin.x = 800;
    if (newButtonPressLocation.origin.x > 800)
        newButtonPressLocation.origin.x = 0;
    [UIView animateKeyframesWithDuration:0 delay:0 options:UIViewAnimationCurveEaseInOut animations:^{movingLabel.frame = newButtonPressLocation;} completion:nil];
    //[UIView animateWithDuration:0.5 animations:^{
    //    movingLabel.frame = newButtonPressLocation;
    //}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
