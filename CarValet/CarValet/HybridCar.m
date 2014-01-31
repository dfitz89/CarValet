//
//  HybridCar.m
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/27/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import "HybridCar.h"

@implementation HybridCar

- (id)init
{
    self = [super init] ;
    
    if (self != nil) {
        _milesPerGallon = 0.0f;
    }
    
    return self;
}

- (id)initWithMake:(NSString *)make
             model:(NSString *)model
              year:(int)year
        fuelAmount:(float)fuelAmount
               MPG:(float)MPG {
    self = [super initWithMake:make model:model year:year fuelAmount:fuelAmount];
    
    if (self != nil) {
        _milesPerGallon = MPG;
    }
    
    return self;
}

- (void)printCarInfo {
    [super printCarInfo];
    
    if (self.isShowingLiters) {
        NSLog(@"Miles Per Liter: %0.2f", self.milesPerGallon);
    } else {
        NSLog(@"Miles Per Gallon: %0.2f", self.milesPerGallon);
    }
    
    if (self.milesPerGallon > 0.0f) {
        NSLog(@"Miles until empty: %0.2f",
              [self milesUntilEmpty]);
    }
}

- (float)milesUntilEmpty {
    return (self.fuelAmount * self.milesPerGallon);
}

@end
