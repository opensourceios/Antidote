//
//  LifecyclePhaseProtocol.h
//  Antidote
//
//  Created by Dmytro Vorobiov on 07/09/15.
//  Copyright (c) 2015 dvor. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, LifecyclePhaseIncomingFileOption) {
    LifecyclePhaseIncomingFileOptionNone = 0,
    LifecyclePhaseIncomingFileOptionImportProfile = 1 << 0,
};

/**
 * Phases are used to represent some big logical app state. For example
 * - login phase is used for all startup flow (login, registration screens, etc.)
 * - running phase is used for normal application (running tox, communicating with friends, etc.)
 *
 * See concrete phases classes for detail description of each phase.
 */
@protocol LifecyclePhaseDelegate;
@protocol LifecyclePhaseProtocol <NSObject>

@property (weak, nonatomic, nullable) id<LifecyclePhaseDelegate> delegate;

- (nonnull NSString *)name;

#pragma mark -  Methods for LifecycleManager
/**
 * Following methods should be called only by LifecycleManager.
 */

- (void)start;

- (void)handleIncomingFileURL:(nonnull NSURL *)url
                      options:(LifecyclePhaseIncomingFileOption)options
                   completion:(nonnull void (^)(BOOL didHandle, LifecyclePhaseIncomingFileOption options))completionBlock;

@end


@protocol LifecyclePhaseDelegate <NSObject>

/**
 * This method is called when phase did finish running.
 *
 * @param phase The phase that did finish running.
 * @param nextPhase Phase to run next.
 */
- (void)phaseDidFinish:(nonnull id<LifecyclePhaseProtocol>)phase withNextPhase:(nonnull id<LifecyclePhaseProtocol>)nextPhase;

@end