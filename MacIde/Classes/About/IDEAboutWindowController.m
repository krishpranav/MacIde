//
//  IDEAboutWindowController.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEAboutWindowController.h"
#import "IDEBackgroundView.h"

@implementation IDEAboutWindowController

@synthesize versionTextField = _versionTextField;
@synthesize backgroundView   = _backgroundView;
@synthesize iconView         = _iconView;

- ( void )dealloc
{
    RELEASE_IVAR(_versionTextField);
    RELEASE_IVAR(_backgroundView);
    RELEASE_IVAR(_iconView);
    
    [super dealloc];
}

@end
