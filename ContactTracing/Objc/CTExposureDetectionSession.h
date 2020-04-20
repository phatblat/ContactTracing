//
//  CTExposureDetectionSession.h
//  ContactTracing
//
//  Created by Ben Chatelain on 4/19/20.
//  Copyright © 2020 Log Dash G. All rights reserved.
//

#import "CTContactInfo.h"
#import "CTDailyTracingKey.h"
#import "CTErrorHandler.h"
#import "CTExposureDetectionSummary.h"

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/// Performs exposure detection bad on previously collected proximity data and keys.
@interface CTExposureDetectionSession : NSObject

/// Holds the the dispatch queue used to invoke handlers on. If this property isn’t set,
/// the framework uses the main queue.
@property dispatch_queue_t dispatchQueue;

/// Contains the maximum number of keys to provide to this API at once. This property’s
/// value updates after each operation complete and before the completion handler is invoked.
/// Use this property to throttle key downloads to avoid excessive buffering of keys in memory.
@property NSInteger maxKeyCount;

/// Activates the session and requests authorization for the app with the user. Properties
/// and methods cannot be used until this completes successfully.
/// @param inCompletion Completion handler.
- (void)activateWithCompletion:(CTErrorHandler)inCompletion;

/// Invalidates the session. Any outstanding completion handlers will be invoked with an error.
/// The session cannot be used after this is called. A new session must be created if another detection is needed.
- (void)invalidate;

/// Asynchronously adds the specified keys to the session to allow them to be checked for exposure.
/// Each call to this method must include more keys than specified by the current value of <maxKeyCount>.
/// @param inKeys Array of keys
/// @param inCompletion Completion handler.
- (void)addPositiveDiagnosisKeys:(NSArray <CTDailyTracingKey *> *) inKeys completion:(CTErrorHandler)inCompletion;

/// The type definition for the completion handler.
typedef void ( ^CTExposureDetectionFinishHandler )
( CTExposureDetectionSummary * _Nullable inSummary, NSError * _Nullable inError );

/// Indicates all of the available keys have been provided. Any remaining detection will be performed
/// and the completion handler will be invoked with the results.
/// @param inFinishHandler Completion handler.
- (void)finishedPositiveDiagnosisKeysWithCompletion:(CTExposureDetectionFinishHandler)inFinishHandler;

/// The type definition for the completion handler.
typedef void ( ^CTExposureDetectionContactHandler )( NSArray <CTContactInfo *> * _Nullable inContacts, NSError * _Nullable inError );

/// Obtains information on each incident. This can only be called once the detector finishes.
/// The handler may be invoked multiple times. An empty array indicates the final invocation of the hander.
/// @param inHandler Completion handler.
- (void)getContactInfoWithHandler:(CTExposureDetectionContactHandler)inHandler;

@end

NS_ASSUME_NONNULL_END
