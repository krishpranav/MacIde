//
//  IDEApplicationDelegate+Private.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEApplicationDelegate.h"

@interface IDEApplicationDelegate(Private)

- (void)installApplicationSupportFiles;
- (void)firstLaunch;
- (void)windowDidClose: (NSNotification *)notification;
- (void)windowDidBecomeKey: (NSNotification *)notification;

@end
