//
//  MyCollectionViewController.h
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/20/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface MyCollectionViewController : UICollectionViewController


@property(strong, nonatomic) Album *album;


- (IBAction)cameraButton:(UIBarButtonItem *)sender;

@end
