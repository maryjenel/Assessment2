//
//  DetailViewController.h
//  CityAssessment
//
//  Created by Mary Jenel Myers on 1/16/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol DetailViewControllerDelegate <NSObject> // put the protocol on the boss

-(void)changeCity: (NSString *)newCityName;
@end

@interface DetailViewController : UIViewController
//@property NSString *cityName;
@property City *city;
//@property UIImage *cityImage;
//@property NSString *cityWeb;
@property (nonatomic, weak) id<DetailViewControllerDelegate> delegate;




@end
