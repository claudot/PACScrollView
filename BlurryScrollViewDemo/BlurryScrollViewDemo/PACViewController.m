//
//  PACViewController.m
//  BlurryScrollViewDemo
//
//  Created by Famille CLAUDOT on 30/01/14.
//  Copyright (c) 2014 Paul-Anatole CLAUDOT. All rights reserved.
//

#import "PACViewController.h"

@interface PACViewController ()

@property (weak, nonatomic) IBOutlet PACBlurryScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
    
@end

@implementation PACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_scrollView setBackgroundImage:[UIImage imageNamed:@"bg.jpg"]];
    [_scrollView addSubview:_contentView];
    [_scrollView setContentSize:_contentView.frame.size];
}

@end
