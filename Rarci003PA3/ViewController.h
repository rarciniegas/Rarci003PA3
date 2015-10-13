//  PROGRAMMER: Roberto Arciniegas
//  PANTHERID: 1385020
//  CLASS:          COP 465501 TR 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     Participation Assignment #3
//  DUE:            Tuesday 10/13/15
//
//  ViewController.h
//  Rarci003PA3
//
//  Created by roberto arciniegas on 10/13/15.
//  Copyright (c) 2015 roberto arciniegas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *movingButton;

@property (strong, nonatomic) CMMotionManager *motionManager;

-(void)outputAccelertionData:(CMAcceleration)acceleration;



@end

