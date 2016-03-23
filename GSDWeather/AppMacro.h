//
//  AppMacro.h
//  GSDWeather
//
//  Created by Tomasz Studziński on 23.03.2016.
//  Copyright © 2016 Tomasz Studziński. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppMacro : NSObject

#define runOnMainThread( ... )  dispatch_async(dispatch_get_main_queue(), ##__VA_ARGS__)

#define BlockWeakObject(o) __typeof(o) __weak
#define BlockWeakSelf BlockWeakObject(self)

#define BlockStrongObject(o) __typeof(o) __strong
#define BlockStrongSelf BlockStrongObject(self)



@end
