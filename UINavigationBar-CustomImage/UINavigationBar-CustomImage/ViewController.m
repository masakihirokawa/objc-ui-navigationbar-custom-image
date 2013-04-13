//
//  ViewController.m
//  UINavigationBar-CustomImage
//
//  Created by 廣川政樹 on 2013/04/11.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	[self initNavigationBar];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)initNavigationBar
{
  //ナビゲーションバーを初期化
  UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
  //iOSのバージョン取得
  float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
  if (systemVersion >= 5.0) {
    //iOSのバージョンが5.0以上の処理
    UIImage *backgroundImage = [UIImage imageNamed:@"navigationbar-background.png"];
    [navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
  } else {
    //iOSのバージョンが5.0未満の処理
    NSString *backgroundResource = [[NSBundle mainBundle] pathForResource:@"navigationbar-background" ofType:@"png"];
    [navigationBar.layer setContents:(id)[UIImage imageWithContentsOfFile: backgroundResource].CGImage];
  }
  //ナビゲーションバーをステージに追加
  [self.view addSubview:navigationBar];
}

@end
