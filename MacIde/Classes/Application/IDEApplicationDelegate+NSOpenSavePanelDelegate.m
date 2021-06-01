//
//  IDEApplicationDelegate+NSOpenSavePanelDelegate.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEApplicationDelegate+NSOpenSavePanelDelegate.h"
#import "IDEDocument.h"


@implementation CEApplicationDelegate( NSOpenSavePanelDelegate )

- ( BOOL )panel: ( id )sender validateURL: ( NSURL * )url error: ( NSError ** )outError
{
    CEDocument * document;
    
    ( void )sender;
    ( void )outError;
    
    document = [ CEDocument documentWithPath: [ url path ] ];
    
    if( document.sourceFile.text == nil )
    {
        NSBeep();
        
        return NO;
    }
    
    return YES;
}

@end
