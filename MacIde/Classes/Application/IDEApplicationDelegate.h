//
//  IDEApplicationDelegate.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

@class IDEPreferencesWindowController;
@class IDEAboutWindowController;
@class IDEAlternateAboutWindowController;
@class IDERegistrationWindowController;
@class IDEMainWindowController;

@interface IDEApplicationDelegate: NSObject < NSApplicationDelegate >
{
@protected
    
    NSMutableArray                   * _mainWindowControllers;
    CEPreferencesWindowController    * _preferencesWindowController;
    CEAboutWindowController          * _aboutWindowController;
    CEAlternateAboutWindowController * _alternateAboutWindowController;
    CERegistrationWindowController   * _registrationWindowController;
    CEMainWindowController           * _activeMainWindowController;
    
@private
    
    RESERVED_IVARS( CEApplicationDelegate , 5 );
}


@property(atomic, readonly) IDEMainWindowController * activeMainWindowController;


+ ( CEApplicationDelegate * )sharedInstance;
- ( IBAction )showPreferencesWindow: ( id )sender;
- ( IBAction )showAboutWindow: ( id )sender;
- ( IBAction )showAlternateAboutWindow: ( id )sender;
- ( IBAction )showRegistrationWindow: ( id )sender;
- ( IBAction )newWindow: ( id )sender;
- ( IBAction )resetColorThemes: ( id )sender;

@end
