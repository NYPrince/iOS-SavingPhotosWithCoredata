//
//  RWPhotoViewController.m
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 12/1/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "RWPhotoViewController.h"
#import "Photo.h"

@interface RWPhotoViewController ()

@end

@implementation RWPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    self.imageView.image = self.photo.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFilterBtn:(id)sender {
}

- (IBAction)deleteBtn:(id)sender
{
    [[self.photo managedObjectContext] deleteObject:self.photo];
    
    NSError *error = nil;
    
    [[self.photo managedObjectContext] save:&error];
    if(error){
        NSLog(@"error");
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
