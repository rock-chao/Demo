//
//  YCQuartzView.m
//  SimpleGraph
//
//  Created by yangchao.guo on 2017/11/29.
//  Copyright © 2017年 yangchao.guo. All rights reserved.
//

#import "YCQuartzView.h"

#import "UIColor+YCRandom.h"

@interface YCQuartzView ()


@end

@implementation YCQuartzView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"6.png"];
    
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.useRandomColor) {
        self.currentColor = [UIColor randomColor];
    }

    UITouch * touch = [touches anyObject];
    self.firstTouchLocation = [touch locationInView:self];
    self.lastTouchLocation = [touch locationInView:self];
    [self setNeedsDisplay];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self];
    if (self.shapeTypes == kImageShape) {
        CGFloat horizontalOffset = self.drawImage.size.width / 2;
        CGFloat verticalOffset = self.drawImage.size.height / 2;
        self.redRect = CGRectUnion(self.redRect, CGRectMake(self.lastTouchLocation.x - horizontalOffset, self.lastTouchLocation.y - verticalOffset, self.drawImage.size.width, self.drawImage.size.height));
    }
    else {
        self.redRect = CGRectUnion(self.currentRect, self.redRect);
    }
    self.redRect = CGRectInset(self.redRect, -2.0, -2.0);

    [self setNeedsDisplayInRect:self.redRect];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.lastTouchLocation = [touch locationInView:self];
    if (self.shapeTypes == kImageShape) {
        CGFloat horizontalOffset = self.drawImage.size.width / 2;
        CGFloat verticalOffset = self.drawImage.size.height / 2;
        self.redRect = CGRectUnion(self.redRect, CGRectMake(self.lastTouchLocation.x - horizontalOffset, self.lastTouchLocation.y - verticalOffset, self.drawImage.size.width, self.drawImage.size.height));
    }
    else {
        self.redRect = CGRectUnion(self.currentRect, self.redRect);
    }
    
    [self setNeedsDisplayInRect:self.redRect];
}

- (CGRect)currentRect {
    return CGRectMake(self.firstTouchLocation.x, self.firstTouchLocation.y, self.lastTouchLocation.x - self.firstTouchLocation.x, self.lastTouchLocation.y - self.firstTouchLocation.y);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, self.firstTouchLocation.x, self.firstTouchLocation.y);
    CGContextSetStrokeColorWithColor(context, self.currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, self.currentColor.CGColor);
    switch (self.shapeTypes) {
        case kLineShape:
            CGContextMoveToPoint(context, self.firstTouchLocation.x, self.firstTouchLocation.y);
            CGContextAddLineToPoint(context, self.lastTouchLocation.x, self.lastTouchLocation.y);
            CGContextStrokePath(context);
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
        case kEllipeseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape: {
            CGFloat horizontalOffset = self.drawImage.size.width / 2;
            CGFloat verticalOffset = self.drawImage.size.height / 2;
            CGPoint drawPoint = CGPointMake(self.lastTouchLocation.x - horizontalOffset,self.lastTouchLocation.y - verticalOffset);
            [self.drawImage drawAtPoint:drawPoint];
            break;
        }
        default:
            break;
    }

}


@end
