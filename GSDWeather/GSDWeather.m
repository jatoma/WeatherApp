//
//  GSDWeather.m
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import "GSDWeather.h"

@implementation GSDWeather

-(instancetype)initWithCityName:(NSString *)city forecasts:(NSArray *)forecasts{
    self = [super init];
    if (self) {
        _city = city;
        _forecasts = forecasts;
    }
    return self;
}


-(GSDForecast *)currentForecast{
    return [self.forecasts firstObject];
}

@end
