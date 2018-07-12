//
//  Walker.m
//  KVOTest
//
//  Created by 李文强的Mac on 16/3/11.
//  Copyright © 2016年 李文强. All rights reserved.
//

#import "Walker.h"

@implementation Walker
@synthesize age = _age;
@synthesize name = _name;

- (instancetype)initWithName:(NSString *)name Age:(NSInteger)age
{
    if (self = [super init]) {
        _name = name;
        _age = age;
    }
    
    return self;
}

@end
