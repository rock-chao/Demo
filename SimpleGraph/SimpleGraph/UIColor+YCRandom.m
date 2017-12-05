//
//  UIColor+YCRandom.m
//  SimpleGraph
//
//  Created by yangchao.guo on 2017/11/29.
//  Copyright © 2017年 yangchao.guo. All rights reserved.
//

#import "UIColor+YCRandom.h"

#define ARC4RANDOM_MAX 0x100000000LL

@implementation UIColor (YCRandom)
+(UIColor *)randomColor {
    CGFloat red = (CGFloat)arc4random() / (CGFloat)ARC4RANDOM_MAX;
    CGFloat green =(CGFloat)arc4random() / (CGFloat)ARC4RANDOM_MAX;
    CGFloat blue = (CGFloat)arc4random() / (CGFloat)ARC4RANDOM_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];;
}

@end
