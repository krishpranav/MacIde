//
//  IDEWindowController+Private.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEWindowController+Private.h"

@implementation IDEWindowController(Private)

- (void)windowWillClose: (NSNotification *)notification
{
    NSWindow * window;
    
    window = notification.object;
    
        if( window == self.window && _releaseOnWindowClose == YES )
        {
            [self autorelease];
        }
}

@end
