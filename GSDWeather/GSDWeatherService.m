//
//  GSDWeatherService.m
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import "GSDWeatherService.h"
#import "GSDWeather.h"
#import "GSDForecast.h"
#import "GSDWeatherView.h"
#import "AppMacro.h"

//CONFIG
static  NSString * const API_KEY = @"a162ad0b26751c120769aceb3e02ce5c";
static  NSString * const CITY = @"Lodz";
static  int const DAY_UNITS = 7;

@implementation GSDWeatherService

//PUBLIC

-(void)fetchWeeklyWeatherForecats:(void (^)(GSDWeather* weather, NSError* completionError)) completion{
    
    NSString *requestString = [self buildRequestStringForCity:CITY dayUnits:DAY_UNITS];
    [self fetchWeatherWithRequestString:requestString
                             completion:completion];
}


//PRIVATE

-(NSString *)buildRequestStringForCity:(NSString *)city dayUnits:(int) days{
    return [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&units=metric&lang=pl&cnt=%d&APPID=%@",city,days,API_KEY];
}

-(void)fetchWeatherWithRequestString:(NSString *)requestString completion:(void (^)(GSDWeather* weather, NSError* completionError)) completion{
    
    
    NSURL *url = [NSURL URLWithString:requestString];
    
    BlockWeakSelf weakSelf = self;
    NSURLSessionDataTask  * task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                   if (error) {
                                                                       completion(nil, error);
                                                                   }else{
                                                                       NSError *parseError = nil;
                                                                       GSDWeather *weather = [weakSelf parseResponse:data error:&parseError];
                                                                       completion(weather, parseError);
                                                                   }
                                                               }];
    [task resume];
}


-(GSDWeather *)parseResponse:(NSData *)data error:(NSError **)error{
    
    NSDictionary *responseDict =  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
    if (*error) { return nil; }
    
    NSArray *forecastRawList = [responseDict objectForKey:@"list"];
    NSMutableArray *forecastObjects= [NSMutableArray new];
    
    for (NSDictionary *forecastRaw in forecastRawList) {
        
        NSDictionary *forecastWeatherRaw = [forecastRaw[@"weather"] firstObject];
        GSDForecast *forecast =  [[GSDForecast alloc] initWithTime:[forecastRaw[@"dt"] doubleValue]
                                                       temperature:@([forecastRaw[@"temp"][@"day"] doubleValue])
                                                   mainDescription:forecastWeatherRaw[@"main"]
                                                 detailDescription:forecastWeatherRaw[@"description"]
                                                            iconId:forecastWeatherRaw[@"icon"]];
        
        [forecastObjects addObject:forecast];
    }
    return [[GSDWeather alloc] initWithCityName:responseDict[@"city"][@"name"]
                                      forecasts:[forecastObjects copy]];
    
}

@end
