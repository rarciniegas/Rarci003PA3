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

@property (weak, nonatomic) IBOutlet UILabel *movingLabel;

@property (strong, nonatomic) CMMotionManager *motionManager;

-(void)outputAccelertionData:(CMAcceleration)acceleration;



@end

