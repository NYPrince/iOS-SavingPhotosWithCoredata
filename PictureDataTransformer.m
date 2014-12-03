//
//  PictureDataTransformer.m
//  CoredataSortingPhotos
//
//  Created by Rick Williams on 11/30/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "PictureDataTransformer.h"

@implementation PictureDataTransformer

+(Class)transformedValueClass{
    
    
    return [NSData class];
}

+(BOOL)allowsReverseTransformation{
    
    return YES;
}

-(id)transformedValue:(id)value{
    
    return UIImagePNGRepresentation(value);
}

-(id)reverseTransformedValue:(id)value{
    
    UIImage *image = [UIImage imageWithData:value];
    return image;
}


@end
