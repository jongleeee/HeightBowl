//
//  ViewController.h
//  test
//
//  Created by Jong Yun Lee on 9/25/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

double currentMaxAccelX;
double currentMaxAccelY;
double currentMaxAccelZ;
double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

double initPoint;

double finalPoint;

double count = 0;
double gravity = 9.80665;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

@property (strong, nonatomic) IBOutlet UILabel *maxAccX;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccZ;


@property (strong, nonatomic) NSMutableArray *list;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (strong, nonatomic) IBOutlet UILabel *count;

@property (strong, nonatomic) NSNumber *point;
@property (strong, nonatomic) NSNumber *lastPoint;

- (IBAction)resetMaxValue:(id)sender;

- (NSInteger)getDifference;


@end

