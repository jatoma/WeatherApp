//
//  GSDAbstractCell.h
//  GSDWeather
//
//  Created by Tomasz Studziński on 23.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSDCell.h"

@interface GSDAbstractCell : UITableViewCell <GSDCell>

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end
