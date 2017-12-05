//
//  YCQuartzView.h
//  SimpleGraph
//
//  Created by yangchao.guo on 2017/11/29.
//  Copyright © 2017年 yangchao.guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCConstants.h"

@interface YCQuartzView : UIView
/// description
@property (nonatomic,assign) CGPoint firstTouchLocation;

/// description
@property (nonatomic,assign) CGPoint lastTouchLocation;

/// description
@property (nonatomic,assign) ShapeType shapeTypes;

/// description
@property (nonatomic,assign) BOOL useRandomColor;

/// description
@property (nonatomic,strong) UIColor *currentColor;

/// description
@property (nonatomic,strong) UIImage *drawImage;


/// description
@property (nonatomic,assign) CGRect redRect;

/// description
@property (nonatomic,assign) CGRect currentRect;



@end
