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
@property (strong, nonatomic) RACCommand *loginCommand;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^(id sender) {
        return [self loginIn];
    }];
    
    [self.loginCommand.executionSignals subscribeNext:^(RACSignal *loginSignal) {
        [loginSignal subscribeCompleted:^{
            NSLog(@"done");
        }];
    }];
    
    self.okBtn.rac_command = self.loginCommand;
    
//    self.okBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//        NSLog(@"sdafgas");
//        return [RACSignal empty];
//    }];
    
//    RAC(self.okBtn, hidden) = [RACSignal combineLatest:@[RACObserve(self, uname.text), RACObserve(self, psd.text)] reduce:^(NSString *uname, NSString *psd){
//        return @([uname isEqualToString:psd]);
//    }];
    
//    self.window = @"w2r";
//    [[RACObserve(self, window) filter:^BOOL(NSString *value) {
//        return [value hasPrefix:@"b"];
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@",x);
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (RACSignal *)loginIn {
    return [RACSignal empty];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.window = @"asdf";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
