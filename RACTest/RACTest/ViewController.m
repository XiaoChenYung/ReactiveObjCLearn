//
//  ViewController.m
//  RACTest
//
//  Created by tm on 2016/12/15.
//  Copyright © 2016年 tm. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@1,@2,@3];
    RACSequence *stream = [array rac_sequence];
    [[stream map:^NSString *(NSNumber *num) {
        return [num stringValue];
    }] foldLeftWithStart:@"" reduce:^id _Nullable(id  _Nullable accumulator, id  _Nullable value) {
        return [accumulator stringByAppendingString:value];
    }];
    
    NSLog(@"%@",[stream array]);
    
    RACSequence *stream2 = [[array rac_sequence] filter:^BOOL(id  _Nullable value) {
        return [value integerValue] % 2 == 0;
    }];
    
    NSLog(@"%@",[stream2 array]);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
