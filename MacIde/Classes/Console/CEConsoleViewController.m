//
//  CEConsoleViewController.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 03/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "CEConsoleViewController.h"
#import "CEConsoleViewController+Private.h"
#import "CEPreferences.h"

@implementation CEConsoleViewController

@synthesize textView = _textView;

- (void)dealloc
{
    [ NOTIFICATION_CENTER removeObserver: self ];
    
    RELEASE_IVAR(_textView);
    
    [ super dealloc]
}

@end
