//
//  CEConsoleViewController+Private.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 03/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "CEConsoleViewController+Private.h"
#import "CEPreferences.h"

@implementation CEConsoleViewController( Private )



- ( void )updateView
{
    NSFont                  * font;
    NSDictionary            * selectionAttributes;
    NSMutableParagraphStyle * paragraphStyle;
    
    font = [ NSFont fontWithName: [ [ CEPreferences sharedInstance ] fontName ] size: [ [ CEPreferences sharedInstance ] fontSize ] ];
    
    _textView.font                = font;
    _textView.backgroundColor     = [ [ CEPreferences sharedInstance ] backgroundColor ];
    _textView.textColor           = [ [ CEPreferences sharedInstance ] foregroundColor ];
    _textView.insertionPointColor = [ [ CEPreferences sharedInstance ] foregroundColor ];
    
    selectionAttributes = [ NSDictionary dictionaryWithObjectsAndKeys:  [ [ CEPreferences sharedInstance ] selectionColor ],  NSBackgroundColorAttributeName,
                           [ [ CEPreferences sharedInstance ] foregroundColor ], NSForegroundColorAttributeName,
                           nil
                           ];
    
    [ _textView setSelectedTextAttributes: selectionAttributes ];
    
    paragraphStyle = [ [ [ NSParagraphStyle defaultParagraphStyle ] mutableCopy ] autorelease ];
    
    [ _textView setDefaultParagraphStyle: paragraphStyle ];
    [ _textView.textStorage enumerateAttributesInRange: NSMakeRange( 0, _textView.string.length )
                                               options:                    NSAttributedStringEnumerationReverse
                                            usingBlock:                 ^( NSDictionary * attributes, NSRange range, BOOL * stop )
     {
         NSMutableDictionary * newAttributes;
         
         ( void )stop;
         
         newAttributes = [ NSMutableDictionary dictionaryWithDictionary: attributes ];
         
         [ newAttributes setObject: paragraphStyle forKey: NSParagraphStyleAttributeName ];
         [ _textView.textStorage setAttributes: newAttributes range: range ];
     }
     ];
}

@end
