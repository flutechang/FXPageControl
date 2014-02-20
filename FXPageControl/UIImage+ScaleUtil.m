//
//  UIImage+ScaleUtil.m
//  FXPageControlExample
//
//  Created by Chihyu Chang on 2/20/14.
//
//

#import "UIImage+ScaleUtil.h"

@implementation UIImage (ScaleUtil)

+ (UIImage *)imageWithImage:(UIImage *)image scaleToFit:(CGSize)size {
    if (image.size.width <= size.width && image.size.height <= size.height) {
        // the image fits in original size, no need to scale
        return image;
    } else {
        CGSize imageSize = image.size;
        if (imageSize.width > size.width) {
            CGFloat scaleFactor = size.width / imageSize.width;
            imageSize.width = size.width;
            imageSize.height *= scaleFactor;
        }
        if (imageSize.height > size.height) {
            CGFloat scaleFactor = size.height / imageSize.height;
            imageSize.height = size.height;
            imageSize.width *= scaleFactor;
        }
        return [UIImage imageWithImage:image scaleToSize:imageSize];
    }
}

+ (UIImage *)imageWithImage:(UIImage *)image scaleToSize:(CGSize)size {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
