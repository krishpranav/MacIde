//
//  IDEAboutWindowController.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEWindowController.h"

@class IDEBackgroundView;

@interface IDEAboutWindowController: IDEWindowController
{
@protected
    
    CEBackgroundView * _backgroundView;
    NSTextField      * _versionTextField;
    NSImageView      * _iconView;
    
@private
    RESERVED_IVARS( IDEAboutWindowController, 5);

@property( nonatomic, readwrite, retain ) IBOutlet CEBackgroundView * backgroundView;
    
}
