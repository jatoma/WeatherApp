//
//  GSDForecast.h
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GSDForecast : NSObject

@property (nonatomic, readonly) NSTimeInterval time;
@property (nonatomic, readonly) NSNumber *temperature;
@property (nonatomic, readonly) NSString *mainDescription;
@property (nonatomic, readonly) NSString *detailDescription;
@property (nonatomic, readonly) NSString *iconId;

-(instancetype)initWithTime:(NSTimeInterval) time
                temperature:(NSNumber*) temperature
            mainDescription:(NSString *)mainDescription
          detailDescription:(NSString *)detailDescription
                     iconId:(NSString *)iconId;

- (NSString *)iconName;

@end
