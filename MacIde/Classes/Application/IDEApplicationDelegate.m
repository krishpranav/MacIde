//
//  IDEApplicationDelegate.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

// imports
#import "IDEApplicationDelegate.h"
#import "IDEApplicationDelegate+Private.h"
#import "IDEApplicationDelegate+NSOpenSavePanelDelegate.h"
#import "IDEMainWindowController.h"
#import "IDEPreferencesWindowController.h"
#import "IDEAboutWindowController.h"
#import "IDEAlternateAboutWindowController.h"
#import "IDEPreferences.h"
#import "IDEDocument.h"
#import "IDERegistrationWindowController.h"


@implementation IDEApplicationDelegate

@synthesize activeMainWindowController = _activeMainWindowController;

+ ( IDEApplicationDelegate *) sharedInstance
{
    return (IDEApplicationDelegate *)(APPLICATION.delegate);
}

@end
