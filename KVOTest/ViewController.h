//
//  ViewController.h
//  KVOTest
//
//  Created by 李文强的Mac on 16/3/11.
//  Copyright © 2016年 李文强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Walker.h"

@class Walker;
@interface ViewController : UIViewController
{
    Walker *_walker;
    UILabel *_ageLabel;
}

@property (nonatomic, strong) Walker *walker;

@end

