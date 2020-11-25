//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@property Car *car;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO: Disable ARC in settings
    
    NSLog(@"Hi");
    
    NSString *helloWorld = [[NSString alloc] initWithString:@"Hello, world!"];
    [helloWorld retain];
    NSLog(@"%@", helloWorld);
    [helloWorld release];
    
    // --- Autorelease
    
    Car *myCar = [Car carWithMake:@"Tesla"];
    NSLog(@"%@", myCar.make);
    
    self.car = myCar;
    [myCar retain];

    NSString *newMake = [[NSString alloc] initWithString:@"Subaru Forester"];
    
    myCar.make = newMake;
    
    NSLog(@"New makxe: %@", myCar.make);
    
    Person *spencer = [[Person alloc] initWithCar:myCar];
    
    Car *newCar = [[Car alloc] initWithMake:@"Subaru Forester"];
    
    // This will triffer the setCar method
    spencer.car = newCar;
    
    NSLog(@"%@", spencer.car);
    [myCar release];
    
}


@end
