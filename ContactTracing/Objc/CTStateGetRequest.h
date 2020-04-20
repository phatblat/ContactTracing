//
//  CTStateGetRequest.h
//  ContactTracing
//
//  Created by Ben Chatelain on 4/19/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// The type definition for the completion handler.
typedef void ( ^CTErrorHandler )( NSError * _Nullable inError );

/// Requests whether contact tracing is on or off on the device.
@interface CTStateGetRequest : NSObject

/// Holds the completion handler that framework invokes when the request completes.
/// The property is cleared upon completion to break any potential retain cycles.
@property CTErrorHandler completionHandler;

/// Holds the the dispatch queue used to invoke handlers on. If this property isn’t set,
/// the framework uses the main queue.
@property dispatch_queue_t dispatchQueue;


/// Contains the snapshot of the state when the request was performed. It’s valid only
/// after the framework invokes the completion handler.
@property CTManagerState state;

/// Asynchronously performs the request to get the state, and invokes the completion handler when it's done.
- (void)perform;

/// Invalidates a previously initiated request. If there is an outstanding completion handler, the framework
/// will invoke it with an error.
/// Don’t reuse the request after this is called. If you require another request, create a new one.
- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
