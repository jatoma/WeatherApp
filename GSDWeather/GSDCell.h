//
//  GSDCell.h
//  GSDWeather
//
//  Created by Tomasz Studziński on 23.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GSDForecast;
@protocol GSDCell <NSObject>

-(void)configureWithCityName:(NSString *)city forecast:(GSDForecast *)forecast;

@end
