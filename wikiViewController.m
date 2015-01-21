//
//  webViewController.m
//  CityAssessment
//
//  Created by Mary Jenel Myers on 1/16/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import "wikiViewController.h"

@interface wikiViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property UIBarButtonItem *backButton;

@end

@implementation wikiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *addressURL = [NSURL URLWithString:self.cityWeb];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    [self.webView loadRequest:addressRequest];
  

}


@end
