//
//  ViewController.m
//  SimpleGraph
//
//  Created by yangchao.guo on 2017/11/29.
//  Copyright © 2017年 yangchao.guo. All rights reserved.
//

#import "ViewController.h"

#import "YCConstants.h"
#import "YCQuartzView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(UISegmentedControl *)sender {

    ColorTabIndex index = [sender selectedSegmentIndex];
    YCQuartzView *view = (YCQuartzView *)self.view;
    switch (index) {
        case kRedColorTab:
            view.currentColor = [UIColor redColor];
            view.useRandomColor = NO;
            break;
        case kBlueColorTab:
            view.currentColor = [UIColor blueColor];
            view.useRandomColor = NO;
            break;
        case kGreenColorTab:
            view.currentColor = [UIColor greenColor];
            view.useRandomColor = NO;
            break;
        case kYellowColorTab:
            view.currentColor = [UIColor yellowColor];
            view.useRandomColor = NO;
            break;
        case kRandomColorTab:
            view.useRandomColor = YES;
            break;
        default:
            break;
    }
}

- (IBAction)changeShape:(UISegmentedControl *)sender {
    [(YCQuartzView *)self.view setShapeTypes:[sender selectedSegmentIndex]];
    if ([sender selectedSegmentIndex] == kImageShape) {
        self.colorControl.enabled = NO;
    }
    else {
        self.colorControl.enabled = YES;
    }
}

@end
