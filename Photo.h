//
//  Photo.h
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/30/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) Album *albumBook;

@end
