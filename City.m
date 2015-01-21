//
//  City.m
//  CityAssessment
//
//  Created by Mary Jenel Myers on 1/16/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//

#import "City.h"

@implementation City


-(instancetype)initWithFullNameCity:(NSString *)cityName countryName: (NSString *)countryName cityImage:(UIImage *)cityImage cityWeb:(NSString *)cityWeb
{
    self = [super init];
    if(self)
    {
        self.cityName = cityName;
        self.countryName = countryName;
        self.cityImage = cityImage;
     self.cityWeb =cityWeb;
    }
    return self;
}

@end
