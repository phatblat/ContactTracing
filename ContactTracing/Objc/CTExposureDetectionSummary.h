//
//  CTExposureDetectionSummary.h
//  ContactTracing
//
//  Created by Ben Chatelain on 4/19/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/// Provides a summary on exposures.
@interface CTExposureDetectionSummary : NSObject

/// Holds the number of keys that matched for an exposure detection.
@property NSInteger matchedKeyCount;

@end

NS_ASSUME_NONNULL_END
