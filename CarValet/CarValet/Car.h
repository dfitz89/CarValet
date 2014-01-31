//
//  Car.h
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/27/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic) int year;
@property (nonatomic) NSString *make;
@property (nonatomic) NSString *model;
@property (nonatomic, setter = setTheFuelAmountTo:) float fuelAmount;
@property (readonly) NSString *carInfo;
@property (nonatomic, getter = isShowingLiters) BOOL showLiters;

- (id)initWithMake: (NSString *)make
             model:(NSString *)model
              year: (int)year
        fuelAmount: (float)fuelAmount;

- (void)printCarInfo;

- (void)shoutMake;
@end
