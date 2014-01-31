//
//  DJFCarEditViewController.h
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/29/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJFCarEditViewControllerProtocol.h"

@class Car;

@interface DJFCarEditViewController : UIViewController

@property (weak, nonatomic) id <DJFCarEditViewControllerProtocol> delegate;

@property (strong, nonatomic) Car *currentCar;

@property (weak, nonatomic) IBOutlet UILabel *carNumberLabel;
@property (weak, nonatomic) IBOutlet UITextField *makeField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *fuelField;

@end
