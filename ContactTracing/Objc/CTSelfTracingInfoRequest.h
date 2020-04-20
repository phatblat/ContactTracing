//
//  CTSelfTracingInfoRequest.h
//  ContactTracing
//
//  Created by Ben Chatelain on 4/19/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

#import "CTSelfTracingInfo.h"
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/// Requests the daily tracing keys used by this device to share with a server.
///
/// This request is intended to be called when a user has a positive diagnosis.
/// Once the keys are shared with a server, other users can use the keys to check
/// if their device has been in contact with any positive diagnosis users. Each request
/// will require the user to authorize access.
///
/// Keys will be reported for the previous 14 days of contact tracing. The app will
/// also be launched every day after the daily tracing key changes to allow it to
/// request again to get the key for each previous day for the next 14 days.
@interface CTSelfTracingInfoRequest : NSObject

/// The type definition for the completion handler.
typedef void ( ^CTSelfTracingInfoGetCompletion )
( CTSelfTracingInfo * _Nullable inInfo, NSError * _Nullable inError );

/// Invokes this completion handler when the request completes and clears the property to break any potential retain cycles.
@property CTSelfTracingInfoGetCompletion completionHandler;

/// Holds the the dispatch queue used to invoke handlers on. If this property isn’t set,
/// the framework uses the main queue.
@property dispatch_queue_t dispatchQueue;

/// Asynchronously performs the request to get the state, and invokes the completion handler when it's done.
- (void)perform;

/// Invalidates a previously initiated request. If there is an outstanding completion handler,
/// the framework will invoke it with an error.
/// Don’t reuse the request after this is called. If you require another request, create a new one.
- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
