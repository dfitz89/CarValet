//
//  DJFViewController.h
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/27/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJFCarEditViewControllerProtocol.h"

@interface DJFViewController : UIViewController <DJFCarEditViewControllerProtocol>
@property (weak, nonatomic) IBOutlet UILabel *carNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalCarsLabel;
@property (weak, nonatomic) IBOutlet UILabel *carInfoLabel;
- (IBAction)newCar:(id)sender;
- (IBAction)previousCar:(id)sender;
- (IBAction)nextCar:(id)sender;
@end
