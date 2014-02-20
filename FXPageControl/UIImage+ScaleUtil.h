//
//  UIImage+ScaleUtil.h
//  FXPageControlExample
//
//  Created by Chihyu Chang on 2/20/14.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleUtil)

+ (UIImage *)imageWithImage:(UIImage *)image scaleToFit:(CGSize)size;
+ (UIImage *)imageWithImage:(UIImage *)image scaleToSize:(CGSize)size;

@end
