//
//  Walker.h
//  KVOTest
//
//  Created by 李文强的Mac on 16/3/11.
//  Copyright © 2016年 李文强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Walker : NSObject
{
    NSInteger _age;
    NSString *_name;
}

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name Age:(NSInteger)age;

@end
