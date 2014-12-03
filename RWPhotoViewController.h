//
//  RWPhotoViewController.h
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 12/1/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;

@interface RWPhotoViewController : UIViewController

@property(strong, nonatomic)Photo *photo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)addFilterBtn:(id)sender;
- (IBAction)deleteBtn:(id)sender;


@end
