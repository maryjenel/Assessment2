//
//  City.h
//  CityAssessment
//
//  Created by Mary Jenel Myers on 1/16/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CityWebDelegate <NSObject>

@optional
- (void) getCityURL;

@end

@interface City : NSObject
@property NSString *cityName;
@property NSString *countryName;
@property UIImage *cityImage;
@property NSString *cityWeb;



-(instancetype)initWithFullNameCity:(NSString *)cityName countryName: (NSString *)countryName cityImage:(UIImage *)cityImage cityWeb:(NSString *)cityWeb;


@end
