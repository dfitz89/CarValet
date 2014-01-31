//
//  DJFCarEditViewControllerProtocol.h
//  CarValet
//
//  Created by Daniel Fitzgerald on 1/30/14.
//  Copyright (c) 2014 Learning iOS Development. All rights reserved.
//

//  CarEditViewControllerProtocol.h
//  CarValetScenes

#import <Foundation/Foundation.h>                             // 1

@class Car;

@protocol DJFCarEditViewControllerProtocol <NSObject>            // 2

- (Car*)carToEdit;                                        // 3

- (NSInteger)carNumber;

- (void)editedCarUpdated;

@end