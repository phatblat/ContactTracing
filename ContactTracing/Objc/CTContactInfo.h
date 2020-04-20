//
//  CTContactInfo.h
//  ContactTracing
//
//  Created by Ben Chatelain on 4/19/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/// Contains information about a single contact incident.
@interface CTContactInfo : NSObject

/// How long the contact was in proximity. Minimum duration is 5 minutes and increments
/// by 5 minutes: 5, 10, 15, etc.
@property NSTimeInterval duration;

/// This property contains the time when the contact occurred. This may have reduced
/// precision, such as within one day of the actual time.
@property CFAbsoluteTime timestamp;

@end

NS_ASSUME_NONNULL_END
