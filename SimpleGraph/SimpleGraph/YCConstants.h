//
//  YCConstants.h
//  SimpleGraph
//
//  Created by yangchao.guo on 2017/11/29.
//  Copyright © 2017年 yangchao.guo. All rights reserved.
//

#ifndef YCConstants_h
#define YCConstants_h

typedef NS_ENUM(NSInteger,ShapeType) {
    kLineShape = 0,
    kRectShape,
    kEllipeseShape,
    kImageShape
};

typedef NS_ENUM(NSInteger,ColorTabIndex) {
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
};

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#endif /* YCConstants_h */
