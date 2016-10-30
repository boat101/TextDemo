//
//  ViewController.m
//  TextDemo
//
//  Created by lx on 2016/10/30.
//  Copyright © 2016年 lx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)test{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"以梦为马,诗酒趁年华";
    [label sizeToFit];
    label.center = CGPointMake(100, 100);
    [self.view addSubview:label];
    
    //创建渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = label.frame;
    self.gradientLayer = gradientLayer;
    
    //设置渐变层的颜色,随机颜色渐变
    gradientLayer.colors = @[(id)[self getRandomColor].CGColor,(id)[self getRandomColor].CGColor,(id)[self getRandomColor].CGColor];
    
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.mask = label.layer;
    
    label.frame = gradientLayer.bounds;
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(textChangecolor)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    
}


//获取随机颜色的方法

- (UIColor *)getRandomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


//改变文字颜色

- (void) textChangecolor {
    _gradientLayer.colors = @[(id)[self getRandomColor].CGColor,(id)[self getRandomColor].CGColor,(id)[self getRandomColor].CGColor,(id)[self getRandomColor].CGColor];
}

@end
