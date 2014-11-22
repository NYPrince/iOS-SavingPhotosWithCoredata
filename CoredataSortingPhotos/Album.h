//
//  Album.h
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/19/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
