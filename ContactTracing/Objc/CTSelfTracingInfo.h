//
//  CTSelfTracingInfo.h
//  ContactTracing
//
//  Created by Ben Chatelain on 4/19/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

#import "CTDailyTracingKey.h"
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/// Contains the Daily Tracing Keys.
@interface CTSelfTracingInfo : NSObject

/// Daily tracing keys available at the time of the request.
@property NSArray <CTDailyTracingKey *> * dailyTracingKeys;

@end

NS_ASSUME_NONNULL_END
