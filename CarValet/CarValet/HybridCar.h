//
//  HybridCar.h
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/27/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import "Car.h"

@interface HybridCar : Car

@property (nonatomic) float milesPerGallon;

- (float) milesUntilEmpty;

- (id)initWithMake:(NSString *)make
             model:(NSString *)model
              year:(int)year
        fuelAmount:(float)fuelAmount
               MPG:(float)MPG;

@end
