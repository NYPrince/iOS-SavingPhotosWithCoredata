//
//  RWFiltersCollectionViewController.m
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 12/4/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "RWFiltersCollectionViewController.h"
#import "RWPhotoCollectionViewCell.h"
#import "Photo.h"



@interface RWFiltersCollectionViewController ()

@property(nonatomic, strong)NSMutableArray *filters;
@property(strong, nonatomic)CIContext *context;

@end

@implementation RWFiltersCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


-(NSMutableArray *)filters{
    
    if(!_filters)_filters = [[NSMutableArray alloc]init];
    
    return _filters;
}


-(CIContext *)context{
    
    if(!_context )_context = [CIContext contextWithOptions:nil];
    
    return _context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filters = [[[self class] photofilters] mutableCopy];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -helpers
+ (NSArray *)photofilters{
    
    CIFilter *sepia = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:nil];
    
    CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues: nil];
    
    
    CIFilter *colorClamp = [CIFilter filterWithName:@"CIColorClamp" keysAndValues:@"inputMaxComponents",[CIVector vectorWithX:0.9 Y:0.9 Z:0.9 W:0.9],@"inputMinComponents",[CIVector vectorWithX:0.2 Y:0.2 Z:0.2 W:0.2], nil];
    
    CIFilter *instants = [CIFilter filterWithName:@"CIPhotoEffectInstant" keysAndValues: nil];
    
    CIFilter *noir = [CIFilter filterWithName:@"CIPhotoEffectNoir" keysAndValues: nil];
    
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignetteEffect" keysAndValues: nil];
    
    CIFilter *colorControls = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputSaturationKey,@0.5, nil];
    
    CIFilter *transfer = [CIFilter filterWithName:@"CIPhotoEffectTransfer" keysAndValues: nil];
    
    CIFilter *unsharpen = [CIFilter filterWithName:@"CIUnsharpMask" keysAndValues: nil];
    
    CIFilter *monochrome = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues: nil];
    
    NSArray *allFilters = @[sepia, blur, colorClamp, instants, noir, vignette, transfer, unsharpen, monochrome, colorControls];
    
    return allFilters;
    
}

-(UIImage *)filteredImageFromImage:(UIImage *)image andFilter:(CIFilter *)filter{
    
    CIImage *unfilteredImage = [[CIImage alloc]initWithCGImage:image.CGImage];
    
    [filter setValue:unfilteredImage forKey:kCIInputImageKey];
    CIImage *filteredImage = [filter outputImage];
    
    CGRect extent = [filteredImage extent];
    CGImageRef cgImage = [self.context createCGImage:unfilteredImage fromRect:extent];
    
    UIImage *finalImage = [UIImage imageWithCGImage:cgImage];
    //NSLog(@"Check out all the data%@", UIImagePNGRepresentation(finalImage));
    
    return finalImage;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UICollectionViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Photo Cell";
    
    RWPhotoCollectionViewCell *cell = [ collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t filterQueue = dispatch_queue_create("filter queue", NULL);
    
    dispatch_async(filterQueue, ^{
        
        UIImage *filterImage = [self filteredImageFromImage:self.photo.image andFilter:self.filters[indexPath.row]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            cell.imageView.image = filterImage;
        });
    });
    
    
    return cell;
}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.filters count];
}


#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RWPhotoCollectionViewCell * selectedCell = (RWPhotoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    self.photo.image = selectedCell.imageView.image;
    
    NSError *error = nil;
    
    if (![[self.photo managedObjectContext]save:&error] ){
        NSLog(@"%@", error);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
