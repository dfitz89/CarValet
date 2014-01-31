//
//  Car.m
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/27/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import "Car.h"

@implementation Car

- (id)init {
    return [self initWithMake:nil model:nil year:1900 fuelAmount:0.0f];
}

- (id)initWithMake:(NSString *)make                              // 1
             model:(NSString *)model
              year:(int)year
        fuelAmount:(float)fuelAmount {
    
    self = [super init];                                         // 2
    if (self != nil) {                                           // 3
        _make = [make copy];                                     // 4
        _model = [model copy];
        _year = year;
        _fuelAmount = fuelAmount;
    }
    
    return self;                                                 // 5
}

- (void)printCarInfo {
    if (self.make || self.model) {                                   // 1
        if (self.make) {
            if (self.model != nil) {
                NSLog(@"Car Make: %@", self.make);                           // 2
                NSLog(@"Car Model: %@", self.model);
                NSLog(@"Car Year: %d", self.year);
                if (self.isShowingLiters) {
                    NSLog(@"Number of Liters in Tank: %0.2f", self.fuelAmount);
                } else {
                    NSLog(@"Number of Gallons in Tank: %0.2f", self.fuelAmount);
                }
            } else {                                                         // 3
                NSLog(@"Car undefined: no model specified.");
            }
        } else {
            NSLog(@"Car undefined: no make specified.");
        }
    } else {                                                         // 3
        NSLog(@"Car undefined: no make or model specified.");
    }
}

- (float)fuelAmount {
    if (self.isShowingLiters) {
        return (_fuelAmount * 3.7854) ;
    }
    return _fuelAmount;
}

- (void)shoutMake {
    self.make = [self.make uppercaseString];
}

- (NSString *)carInfo {
    return [NSString stringWithFormat:@"Car Info\n   Make: %@\n   Model: %@\n   Year: %d",
            self.make ? self.make : @"Unknown Make",
            self.model ? self.model : @"Unknown Model",
            self.year];
}

@end
