//
//  GSDForecast.m
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import "GSDForecast.h"

@implementation GSDForecast

-(instancetype)initWithTime:(NSTimeInterval) time
                temperature:(NSNumber*)temperature
            mainDescription:(NSString *)mainDescription
          detailDescription:(NSString *)detailDescription
                     iconId:(NSString *)iconId{
    
    self = [super init];
    if (self) {
        _time = time;
        _temperature = temperature;
        _mainDescription = mainDescription;
        _detailDescription = detailDescription;
        _iconId = iconId;
    }
    return self;
}


+ (NSDictionary *)iconMap {
    static NSDictionary *_iconMap = nil;
    if (! _iconMap) {
        _iconMap = @{
                      @"01d" : @"weather-clear",
                      @"02d" : @"weather-few",
                      @"03d" : @"weather-few",
                      @"04d" : @"weather-broken",
                      @"09d" : @"weather-shower",
                      @"10d" : @"weather-rain",
                      @"11d" : @"weather-tstorm",
                      @"13d" : @"weather-snow",
                      @"50d" : @"weather-mist",
                      @"01n" : @"weather-moon",
                      @"02n" : @"weather-few-night",
                      @"03n" : @"weather-few-night",
                      @"04n" : @"weather-broken",
                      @"09n" : @"weather-shower",
                      @"10n" : @"weather-rain-night",
                      @"11n" : @"weather-tstorm",
                      @"13n" : @"weather-snow",
                      @"50n" : @"weather-mist",
                      };
    }
    return _iconMap;
}

- (NSString *)iconName {
    NSString *name = [GSDForecast iconMap][self.iconId];
    if (!name) {
       NSLog(@"Warn: No image found for icon id: %@",self.iconId);
    }
    return name;
}

@end
