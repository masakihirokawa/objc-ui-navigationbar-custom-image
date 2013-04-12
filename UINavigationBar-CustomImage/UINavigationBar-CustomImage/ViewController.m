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
  UIViewController *vc = [[UIViewController alloc] initWithNibName:@"ExampleView" bundle:nil];
  UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
  nc.navigationBar.tintColor = [UIColor blackColor];
  
  NSString *currentVersion = [[UIDevice currentDevice] systemVersion];
  if ([currentVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedAscending) {
    // iOS5.0以前の場合
    UIImageView *navBg = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"bg-nav.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:1]];
    navBg.layer.zPosition = -FLT_MAX;
    [nc.navigationBar insertSubView:navBg atIndex:0];
  } else if (([currentVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedSame) || ([currentVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedDescending)) {
    // iOS5.0以降の場合
    nc.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-nav.png"] forBarMetrics:UIBarMetricsDefault];
  }
  /*
  UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
  UIImage *image = [UIImage imageNamed:@"navigationbar_background.png"];
  //UIImage *image = [[UIImage imageNamed:@"navigationbar_background.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:1];
  //UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
  imageView.frame = navigationBar.bounds;
  imageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
  imageView.layer.zPosition = -FLT_MAX;
  [navigationBar insertSubview:imageView atIndex:0];
  [self.view addSubview:navigationBar];
  */
}

@end
