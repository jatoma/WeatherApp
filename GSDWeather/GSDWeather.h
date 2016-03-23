//
//  GSDWeather.h
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GSDForecast;
@interface GSDWeather : NSObject

@property (nonatomic, readonly) NSString *city;
@property (nonatomic, readonly) NSArray *forecasts;

-(instancetype)initWithCityName:(NSString *)city forecasts:(NSArray *)forecasts;

-(GSDForecast *)currentForecast;

@end
