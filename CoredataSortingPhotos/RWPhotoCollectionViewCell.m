//
//  RWPhotoCollectionViewCell.m
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/20/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "RWPhotoCollectionViewCell.h"
#define IMAGAGEVIEW_BORDER_LENGTH 5


@implementation RWPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}


-(void)setup
{
    self.imageView =[[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGAGEVIEW_BORDER_LENGTH, IMAGAGEVIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];


}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
