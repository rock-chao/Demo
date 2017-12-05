//
//  ViewController.m
//  MotionMonitor
//
//  Created by yangchao.guo on 2017/11/29.
//  Copyright © 2017年 yangchao.guo. All rights reserved.
//

#import "ViewController.h"

#import <CoreMotion/CoreMotion.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *accelerometerLabel;
@property (weak, nonatomic) IBOutlet UILabel *gyroscopeLabel;


///
@property (nonatomic,strong) CMMotionManager *motionManager;

///
@property (nonatomic,strong) NSOperationQueue *queue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.motionManager = [[CMMotionManager alloc] init];
    // 创建队列，系统队列不建议使用，可能会被事件填满无法处理其他重要操作
    self.queue = [[NSOperationQueue alloc] init];
    // 检查是否支持加速计
    if (self.motionManager.accelerometerAvailable) {
        self.motionManager.accelerometerUpdateInterval = 1.0 / 10.0;
        [self.motionManager startAccelerometerUpdatesToQueue:self.queue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            // 显示的文本
            NSString *labelText;
            if (error) {
                [self.motionManager stopAccelerometerUpdates];
                labelText = [NSString stringWithFormat:@"设备出错，Error：%@",error];
            }
            else {
                labelText = [NSString stringWithFormat:@"Accelerometer\n ----\n x:%+.2f\ny:%+.2f\nz:%+.2f",accelerometerData.acceleration.x,accelerometerData.acceleration.y,accelerometerData.acceleration.z];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.accelerometerLabel.text = labelText;
            });
        }];
    }
    else {
        self.accelerometerLabel.text = @"不支持加速计";
    }

    // 陀螺仪
    if (self.motionManager.gyroAvailable) {
        [self.motionManager startGyroUpdatesToQueue:self.queue withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
            NSString *labelText;
            if (error) {
                // 停止
                [self.motionManager stopGyroUpdates];
                labelText = [NSString stringWithFormat:@"陀螺仪运行出错"];
            }
            else {
                labelText = [NSString stringWithFormat:@"gyroscop\n --- \nX:%+.2f\nY:%+.2f\nZ:%+.2f\n",gyroData.rotationRate.x,gyroData.rotationRate.y,gyroData.rotationRate.z];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.gyroscopeLabel.text = labelText;
            });
        }];
    } else {
        self.gyroscopeLabel.text = @"不支持陀螺仪";
    }
    
}

// 设备支持方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


@end
