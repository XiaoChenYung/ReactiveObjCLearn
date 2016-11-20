//
//  ViewController.m
//  ReactiveObjCLearnt
//
//  Created by tm on 2016/11/18.
//  Copyright © 2016年 tm. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "TwoViewController.h"
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
//    [self signal];
}
- (IBAction)pop:(UIButton *)sender {
    TwoViewController *two = [[TwoViewController alloc] init];
    two.subject = [RACSubject subject];
    [two.subject subscribeNext:^(id  _Nullable x) {
        self.uname.text = x;
    }];
    [self.navigationController pushViewController:two animated:true];
}

- (void)subject {
    
}

- (void)signal {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"sss"];
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"done");
        }];
    }];
    
    
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [disposable dispose];
    
    
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
