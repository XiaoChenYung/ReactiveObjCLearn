//
//  ViewController.m
//  ReactiveObjCLearnt
//
//  Created by tm on 2016/11/18.
//  Copyright © 2016年 tm. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *uname;
@property (weak, nonatomic) IBOutlet UITextField *psd;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (copy, nonatomic) NSString *window;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.okBtn, hidden) = [RACSignal combineLatest:@[RACObserve(self, uname.text), RACObserve(self, psd.text)] reduce:^(NSString *uname, NSString *psd){
        return @([uname isEqualToString:psd]);
    }];
    
//    self.window = @"w2r";
//    [[RACObserve(self, window) filter:^BOOL(NSString *value) {
//        return [value hasPrefix:@"b"];
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.window = @"asdf";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
