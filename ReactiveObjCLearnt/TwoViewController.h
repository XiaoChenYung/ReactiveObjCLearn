//
//  TwoViewController.h
//  ReactiveObjCLearnt
//
//  Created by 杨晓晨 on 2016/11/20.
//  Copyright © 2016年 tm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
@interface TwoViewController : UIViewController
@property (nonatomic, strong) RACSubject *subject;
@end
