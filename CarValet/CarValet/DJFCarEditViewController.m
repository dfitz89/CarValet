//
//  DJFCarEditViewController.m
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/29/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import "DJFCarEditViewController.h"
#import "Car.h"

@interface DJFCarEditViewController ()

@end

@implementation DJFCarEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *carNumberText;
    carNumberText = [NSString stringWithFormat:@"Car Number: %ld", (long)[self.delegate carNumber]];
    
    self.carNumberLabel.text = carNumberText;
    
    self.currentCar = [self.delegate carToEdit];
    
    self.makeField.text = self.currentCar.make;
    
    self.modelField.text = self.currentCar.model;
    
    self.yearField.text = [NSString stringWithFormat:@"%d", self.currentCar.year];
    
    self.fuelField.text = [NSString stringWithFormat:@"%0.2f", self.currentCar.fuelAmount];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.currentCar.make = self.makeField.text;
    self.currentCar.model = self.modelField.text;
    self.currentCar.year = [self.yearField.text integerValue];
    self.currentCar.fuelAmount = [self.makeField.text floatValue];
    
    [self.delegate editedCarUpdated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditDoneSegue"]) {
        self.currentCar.make = self.makeField.text;
        self.currentCar.model = self.modelField.text;
        self.currentCar.year = [self.yearField.text integerValue];
        self.currentCar.fuelAmount = [self.fuelField.text floatValue];
    }
}

@end
