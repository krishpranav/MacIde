//
//  NSTextView+CE.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "NSTextView+CE.h"

@implementation NSTextView( CE )

- ( NSUInteger )numberOfHardLines
{
    NSString * text;
    NSUInteger textLength;
    NSUInteger numberOfLines;
    NSUInteger i;
    
    text          = self.textStorage.string;
    textLength    = text.length;
    numberOfLines = 0;
    
    for( i = 0; i < textLength; numberOfLines++ )
    {
        i = NSMaxRange( [ text lineRangeForRange: NSMakeRange( i, 0 ) ] );
    }
    
    return numberOfLines;
}

- ( NSUInteger )numberOfSoftLines
{
    NSUInteger numberOfGlyphs;
    NSUInteger numberOfLines;
    NSUInteger i;
    NSRange    range;
    
    numberOfGlyphs = self.layoutManager.numberOfGlyphs;
    numberOfLines  = 0;
    range.location = 0;
    range.length   = 0;
    
    for( i = 0; i < numberOfGlyphs; numberOfLines++ )
    {
        [ self.layoutManager lineFragmentRectForGlyphAtIndex: i effectiveRange: &range ];
        
        i = NSMaxRange( range );
    }
    
    return numberOfLines;
}

- ( void )enableSoftWrap
{}

- ( void )disableSoftWrap
{
    [ self.textContainer setContainerSize:NSMakeSize( CGFLOAT_MAX, CGFLOAT_MAX ) ];
    [ self.textContainer setWidthTracksTextView: NO ];
    [ self setHorizontallyResizable: YES ];
}

- ( NSInteger )currentLine
{
    NSRange    range;
    NSRange    lineRange;
    NSString * text;
    __block BOOL       found;
    __block NSInteger  line;
    
    text  = self.textStorage.string;
    range = self.selectedRange;
    found = NO;
    line  = 0;
    
    if( range.length == 0 )
    {
        lineRange = [ text lineRangeForRange: range ];
        
        [ text  enumerateSubstringsInRange: NSMakeRange( 0, text.length )
                                   options:                    NSStringEnumerationByLines
                                usingBlock:                 ^( NSString * substring, NSRange substringRange, NSRange enclosingRange, BOOL * stop )
         {
             ( void )substring;
             ( void )enclosingRange;
             
             if( substringRange.location == lineRange.location )
             {
                 *( stop ) = YES;
                 found     = YES;
             }
             
             line++;
         }
         ];
    }
    
    return ( found == YES ) ? line : NSNotFound;
}

- ( NSInteger )currentColumn
{
    NSRange      range;
    NSRange      lineRange;
    NSString   * text;
    UniChar      c;
    NSUInteger   length;
    NSUInteger   i;
    NSUInteger   mod;
    NSInteger    column;
    
    text  = self.textStorage.string;
    range = self.selectedRange;
    
    if( range.length == 0 )
    {
        lineRange = [ text lineRangeForRange: range ];
        text      = [ text substringWithRange: NSMakeRange( lineRange.location, range.location - lineRange.location ) ];
        length    = text.length;
        column    = 1;
        
        for( i = 0; i < length; i++ )
        {
            c = [ text characterAtIndex: i ];
            
            if( c == '\t' )
            {
                mod     = column % 4;
                column += ( mod == 0 ) ? 1 : 4 - ( ( column % 4 ) - 1 );
            }
            else
            {
                column++;
            }
        }
        
        return column;
    }
    
    return NSNotFound;
}

@end
