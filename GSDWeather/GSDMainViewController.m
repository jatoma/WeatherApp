//
//  ViewController.m
//  GSDWeather
//
//  Created by Tomasz Studziński on 22.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import "GSDMainViewController.h"
#import "GSDWeather.h"
#import "GSDForecast.h"
#import "GSDWeatherView.h"
#import "GSDWeatherService.h"
#import "AppMacro.h"
#import "GSDCell.h"


@implementation GSDMainViewController
{
    NSArray *_cellIdentifiers;
    GSDWeatherService *_weatherService;
    GSDWeather *_weather;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _cellIdentifiers = @[@"mainPageCellIdentifier",@"detailPageCellIdentifier"];
    _weatherService = [GSDWeatherService new];
    [self reloadData];
}

-(void)reloadData{
    BlockWeakSelf weakSelf = self;
    [_weatherService fetchWeeklyWeatherForecats:^(GSDWeather *weather, NSError *completionError) {
        if (completionError || !weather) {
            [weakSelf presentErrorAlertWithMessage:@"Błąd podczas pobierania danych z sewera"];
        }
        _weather = weather;
        runOnMainThread(^{
            [[(GSDWeatherView*) weakSelf.view tableView] reloadData];
        });
    }];
}

-(void)presentErrorAlertWithMessage:(NSString *)message{
    runOnMainThread(^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Błąd"
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:true completion:nil];
    });
   
}

//Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_cellIdentifiers count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? (_weather.currentForecast ? 1 : 0)  : _weather.forecasts.count -1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell<GSDCell> *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifiers[indexPath.section]];
    [cell configureWithCityName:[_weather city] forecast:[self forecastForIndexPath:indexPath]];
    
    return cell;
}

-(GSDForecast*)forecastForIndexPath:(NSIndexPath*)indexPath{
    if (indexPath.section==0) {
        return [_weather currentForecast];
    }else{
        return _weather.forecasts[indexPath.row+1];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (indexPath.section == 0) ? self.view.bounds.size.height : 64.0;
}




@end
