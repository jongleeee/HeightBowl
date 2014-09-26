//
//  ViewController.m
//  test
//
//  Created by Jong Yun Lee on 9/25/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
 
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .1;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    

    self.list = [NSMutableArray array];
    
}



-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    
//    self.accX.text = [NSString stringWithFormat:@" %.9fg",acceleration.x];
//    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
//    {
//        currentMaxAccelX = acceleration.x;
//    }
//    self.accY.text = [NSString stringWithFormat:@" %.9fg",acceleration.y];
//    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
//    {
//        currentMaxAccelY = acceleration.y;
//    }
    self.accZ.text = [NSString stringWithFormat:@" %.9fg",acceleration.z];
    
    [self.list addObject:[NSNumber numberWithDouble:acceleration.z]];
    
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.9f",currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.9f",currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.9f",currentMaxAccelZ];
    
    
}
 


- (IBAction)resetMaxValue:(id)sender {
    
    NSLog(@"%@", self.list);
    
    if (count == 0) {
        self.count.text = @"clicked";
        count++;
    }
    else {
        self.count.text = @"unclicked";
        count = 0;
        NSLog(@"THIS IS DIFFERENCE: %.15f",(float)[self getDifference]);
    }
    
    
}


- (NSInteger)getDifference {
    
    self.point = [self.list objectAtIndex:0];
    self.lastPoint = [self.list objectAtIndex:[self.list count]-1];
    
    NSLog(@"%@", self.point);

    
    initPoint = self.point.floatValue;
    finalPoint = self.lastPoint.floatValue;
    
    return finalPoint - initPoint;
    
}


@end
