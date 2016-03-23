//
//  GSDDetailPageCell.m
//  GSDWeather
//
//  Created by Tomasz Studziński on 23.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import "GSDDetailPageCell.h"

#import <QuartzCore/QuartzCore.h>

@implementation GSDDetailPageCell



-(void)layoutSubviews{
    [super layoutSubviews];
    [self roundCorners];
}

-(void)roundCorners{
    CGRect insetFrame = UIEdgeInsetsInsetRect(self.contentView.frame,
                                              UIEdgeInsetsMake(5, 10, 5, 10));
    self.contentView.frame = insetFrame;
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
}

@end
