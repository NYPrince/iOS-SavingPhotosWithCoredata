//
//  CoredataHelper.m
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/20/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "CoredataHelper.h"

@implementation CoredataHelper

+(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    
    return context;
}




@end
