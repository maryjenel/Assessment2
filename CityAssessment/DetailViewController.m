//
//  DetailViewController.m
//  CityAssessment
//
//  Created by Mary Jenel Myers on 1/16/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import "DetailViewController.h"
#import "City.h"
#import "wikiViewController.h"

@interface DetailViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *cityImg;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.countryTextField setHidden:YES];
    [self.cityTextField setHidden:YES];
    self.cityLabel.text = self.city.cityName;
    self.countryLabel.text = self.city.countryName;
    self.cityImg.image = self.city.cityImage;
    self.cityLabel.text =[NSString stringWithFormat:@"City Name:%@", self.city.cityName];
    self.countryLabel.text =[NSString stringWithFormat:@"Country Name: %@", self.city.countryName];
    

}

- (IBAction)onEditButtonClicked:(UIBarButtonItem *)sender
{
    {
        if ([sender.title isEqual:@"✏️"]) {
            [self.cityTextField becomeFirstResponder];
            [self.cityTextField setHidden:NO];
            [self.cityLabel setHidden:YES];
            [self.countryLabel setHidden:YES];
            [self.countryTextField setHidden:NO];
            self.countryTextField.text =@"";
            self.cityTextField.text =@"";


            sender.title = @"✅" ;
        }
        else
        {


            [self.cityTextField setHidden:YES];
            [self.cityLabel setHidden:NO];
            [self.countryLabel setHidden:NO];
            [self.countryTextField setHidden:YES];
            sender.title = @"✏️";
            if (!([self.countryTextField.text isEqualToString:@"" ]&& [self.cityTextField.text isEqualToString:@""]))
            {
                self.city.cityName = self.cityTextField.text;
                self.cityLabel.text = self.city.cityName;
                self.city.countryName = self.countryTextField.text;
                self.countryLabel.text = self.city.countryName;
            }
        }
        
    }
    [self.cityTextField resignFirstResponder];
    [self.countryTextField resignFirstResponder];
    

}

//- (IBAction)onLabelPressed:(id)tapGesture
//{
//    CGPoint point = [tapGesture locationInView:self.view];
//    if (CGRectContainsPoint(self.wikiLabel.frame, point))
//    {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        wikiViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
//        [(DetailViewController*)self presentViewController:webViewController animated:YES completion:nil];
//    }
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    wikiViewController *vc = segue.destinationViewController;
    vc.cityWeb = self.city.cityWeb;
    
}
- (IBAction)onChangeTitlePressed:(UIButton *)sender
{

    [self.delegate changeCity:self.city.cityName];
}



@end
