//
//  GSDAbstractCell.m
//  GSDWeather
//
//  Created by Tomasz Studziński on 23.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import "GSDAbstractCell.h"
#import "GSDForecast.h"

@implementation GSDAbstractCell

-(void)configureWithCityName:(NSString *)city forecast:(GSDForecast *)forecast{
    self.iconImageView.image = [UIImage imageNamed:[forecast iconName]];
    
    
    
    self.cityLabel.text = city;
    self.descriptionLabel.text = forecast.detailDescription;
    self.temperatureLabel.text =  [NSString stringWithFormat:@"%.0f°",forecast.temperature.floatValue];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"dd-MM-yyyy"];
    
    self.dateLabel.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:forecast.time]];
}




@end
