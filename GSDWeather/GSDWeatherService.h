//
//  GSDWeatherService.h
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GSDWeather;
@interface GSDWeatherService : NSObject

-(void)fetchWeeklyWeatherForecats:(void (^)(GSDWeather* weather, NSError* completionError)) completion;

@end
