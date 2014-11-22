//
//  AlbumTableViewController.h
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/19/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewController : UITableViewController

@property(strong, nonatomic)NSMutableArray *albums;
- (IBAction)AddAlbumButton:(UIBarButtonItem *)sender;

@end
