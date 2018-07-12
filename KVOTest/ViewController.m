//
//  ViewController.m
//  KVOTest
//
//  Created by 李文强的Mac on 16/3/11.
//  Copyright © 2016年 李文强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize walker = _walker;

- (void)viewDidLoad {
    [super viewDidLoad];
    _walker = [[Walker alloc] initWithName:@"老翁" Age:10];
    /* 
     * 关键步骤
     * 给Walker的age属性 加上 观察者监听
     */
    [_walker addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];

    //UI initialization
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setFrame:CGRectMake(60, 200, 100, 35)];
    [addBtn setBackgroundColor:[UIColor lightGrayColor]];
    [addBtn setTitle:@"增加5岁" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnPressed) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:addBtn];
    
    UIButton *reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [reduceBtn setFrame:CGRectMake(180, 200, 100, 35)];
    [reduceBtn setBackgroundColor:[UIColor lightGrayColor]];
    [reduceBtn setTitle:@"减少5岁" forState:UIControlStateNormal];
    [reduceBtn addTarget:self action:@selector(reduceBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reduceBtn];

    _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, 240, 35)];
    _ageLabel.text = [NSString stringWithFormat:@"%@现在的年龄是: %ld", _walker.name, _walker.age];
    _ageLabel.backgroundColor = [UIColor clearColor];
    _ageLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_ageLabel];
    
    //
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 100)];
    lable.numberOfLines = 0;
    lable.lineBreakMode = NSLineBreakByCharWrapping;
    lable.text = @"历时四个半月，锈迹斑斑的汽车、摩托车废旧零件、报废灭火器和钢材……这些平日躺在收购站里的破铜烂铁，被甘肃张掖哈寨村小伙张嵩组装成了高6.8米、重2吨的变型金刚“大黄蜂”。张嵩介绍，他的“大黄蜂”是通过弯曲、集合、焊接废车零部件组装而成的，汽车钢管、刹车碟、汽缸、排烟管、避震器、传动轴、轮胎钢骨、螺丝等零件均运用其中。";
    CGSize size = [lable sizeThatFits:CGSizeMake(lable.frame.size.width, MAXFLOAT)];
    lable.frame = CGRectMake(10, 300, 300, size.height);
    lable.backgroundColor = [UIColor redColor];
//    lable.font = [UIFont systemFontOfSize:14];
    lable.minimumScaleFactor = 15.f;
    [self.view addSubview:lable];
    
    [self test];
}

- (void)test{
    
    //结果答案
    int total = 0;
    for (int i= 0; i<=99999; i++) {
        if (total%1 == 0 && total%2 == 1 && total%3 == 0 && total%4 == 1 && total%5 == 4 && total%6 == 3 && total%7 == 0 && total%8 == 1 && total%9 == 0) {
            NSLog(@"满足条件的结果是：%d",total);
            break;
        }
        total ++;
    }
}

- (void)addBtnPressed
{
    _walker.age += 5;
}

- (void)reduceBtnPressed
{
    _walker.age -= 5;
}

 /* KVO function， 只要object的keyPath属性发生变化，就会调用此函数*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"] && object == _walker) {
        _ageLabel.text = [NSString stringWithFormat:@"%@现在的年龄是: %ld", _walker.name, _walker.age];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
