//
//  DJFViewController.m
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/27/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import "DJFViewController.h"
#import "Car.h"
#import "HybridCar.h"
#import "DJFCarEditViewController.h"

@interface DJFViewController ()

@end

@implementation DJFViewController

NSMutableArray *arrayOfCars;                 // 1
NSInteger displayedCarIndex;                 // 2

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {            // 1
        DJFCarEditViewController *nextController;
        
        nextController = segue.destinationViewController;             // 2
        nextController.delegate = self;             // 3
        
        Car *currentCar = arrayOfCars[displayedCarIndex];             // 4
        nextController.currentCar = currentCar;                       // 5
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrayOfCars = [[NSMutableArray alloc] init];
    [self newCar:nil];
    displayedCarIndex = 0;
    
    [self displayCurrentCarInfo];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Car *otherCar = [[Car alloc] initWithMake:@"Honda"      // 5
                                        model:@"Accord"
                                         year:2010
                                   fuelAmount:12.5f];
    [otherCar printCarInfo];                                // 6
    [otherCar shoutMake];
    otherCar.showLiters = YES;
    [otherCar printCarInfo];
    
    HybridCar *myHybrid= [[HybridCar alloc] initWithMake:@"Toyota"
                                                   model:@"Prius"
                                                    year:2012
                                              fuelAmount:8.3f
                                                     MPG:42.0f];
    
    [myHybrid printCarInfo];
    
    Car *noMakeCar = [[Car alloc] initWithMake:nil
                                         model:@"Pathfinder"
                                         year:2014
                                         fuelAmount:9.0f];
    
    [noMakeCar printCarInfo];
    

    Car *noModelCar = [[Car alloc] initWithMake:@"Nissan"
                                         model:nil
                                          year:2014
                                    fuelAmount:9.0f];
    
    [noModelCar printCarInfo];

    Car *noMakeModelCar = [[Car alloc] initWithMake:nil
                                          model:nil
                                           year:2014
                                     fuelAmount:9.0f];
    
    [noMakeModelCar printCarInfo];
}

- (void) updateLabel:(UILabel*)theLabel
      withBaseString:(NSString*)baseString
               count:(NSInteger)theCount {
    NSString *newText;
    newText = [NSString stringWithFormat:@"%@: %ld", baseString, (long)theCount];
    
    theLabel.text = newText;
}

- (void) displayCurrentCarInfo {
    Car *currentCar;
    currentCar = arrayOfCars[displayedCarIndex];
    
    self.carInfoLabel.text = currentCar.carInfo;
    
    [self updateLabel:self.carNumberLabel
                withBaseString:@"Car Number"
                count:displayedCarIndex + 1];
}

- (void) changeDisplayedCar:(NSInteger)newIndex {
    if(newIndex < 0) {
        newIndex = 0;
    } else if (newIndex >= [arrayOfCars count]) {
        newIndex = [arrayOfCars count] - 1;
    }
    
    if(displayedCarIndex != newIndex) {
        displayedCarIndex = newIndex;
        [self displayCurrentCarInfo];
    }
}

- (Car*)carToEdit {
    return arrayOfCars[displayedCarIndex];                   // 1
}

- (NSInteger)carNumber {
    return displayedCarIndex + 1;                            // 2
}

- (void)editedCarUpdated {
    [self displayCurrentCarInfo];                            // 3
    NSLog(@"\neditedCarUpdated called!\n");
}

- (IBAction)newCar:(id)sender {
    
    Car *newCar = [[Car alloc] init];
    
    [arrayOfCars addObject:newCar];
    
    [self updateLabel:self.totalCarsLabel
                withBaseString:@"Total Cars"
                count:[arrayOfCars count]];
}


- (IBAction)previousCar:(id)sender {
    [self changeDisplayedCar:displayedCarIndex - 1];
}

- (IBAction)nextCar:(id)sender {
    [self changeDisplayedCar:displayedCarIndex + 1];
}

- (IBAction)editingDone:(UIStoryboardSegue*)segue {
    [self displayCurrentCarInfo];
}

@end
