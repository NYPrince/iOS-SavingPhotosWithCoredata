//
//  RWAppDelegate.h
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/19/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
