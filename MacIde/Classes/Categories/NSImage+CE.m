//
//  NSImage+CE.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "NSImage+CE.h"

typedef struct __RGBPixel
{
    uint8_t alpha;
    uint8_t blue;
    uint8_t green;
    uint8_t red;
}
__RGBPixel;

@implementation NSImage( IDE )

- ( NSImage * )imageWithSize: ( CGFloat )size
{
    NSSize         s;
    NSEnumerator * e;
    NSImage      * image;
    NSImageRep   * rep;
    
    s = NSMakeSize( size, size );
    e = [ [ self representations ] objectEnumerator ];
    
    while( ( rep = [ e nextObject ] ) )
    {
        if( NSEqualSizes( [ rep size ], s ) )
        {
            image = [ [ NSImage alloc ] initWithSize: s ];
            
            [ image addRepresentation: rep ];
            
            return [ image autorelease ];
        }
    }
    
    image = [ [ NSImage alloc ] initWithSize: s ];
    
    [ image lockFocus ];
    [ [ NSGraphicsContext currentContext ] setImageInterpolation: NSImageInterpolationHigh ];
    [ self drawInRect: NSMakeRect( ( CGFloat )0, ( CGFloat )0, size , size ) fromRect: NSMakeRect( ( CGFloat )0, ( CGFloat )0, self.size.width, self.size.height ) operation: NSCompositeCopy fraction: ( CGFloat )1 ];
    [ image unlockFocus ];
    
    return [ image autorelease ];
}

- ( NSImage * )grayscaleImage
{
    CGSize          size;
    NSUInteger      width;
    NSUInteger      height;
    __RGBPixel    * pixels;
    __RGBPixel    * pixel;
    NSUInteger      row;
    NSUInteger      column;
    CGFloat         gray;
    CGColorSpaceRef colorSpace;
    CGContextRef    context;
    CGImageRef      cgImage;
    NSImage       * image;
    
    size        = self.size;
    width       = ( NSUInteger )size.width;
    height      = ( NSUInteger )size.height;
    pixels      = ( __RGBPixel * )calloc( width * height, sizeof( __RGBPixel ) );
    
    if( pixels == NULL )
    {
        return nil;
    }
    
    colorSpace  = CGColorSpaceCreateDeviceRGB();
    context     = CGBitmapContextCreate
    (
     pixels,
     width,
     height,
     8,
     width * sizeof( __RGBPixel ),
     colorSpace,
     kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast
     );
    
    CGContextDrawImage
    (
     context,
     CGRectMake( ( CGFloat )0, ( CGFloat )0, ( CGFloat )width, ( CGFloat )height ),
     [ self CGImageForProposedRect: NULL context: [ NSGraphicsContext currentContext ] hints: nil ]
     );
    
    for( row = 0; row < height; row++ )
    {
        for( column = 0; column < width; column++ )
        {
            pixel = &( pixels[ row * width + column ] );
            gray  = ( CGFloat )0.299 * ( CGFloat )pixel->red;
            gray += ( CGFloat )0.587 * ( CGFloat )pixel->green;
            gray += ( CGFloat )0.114 * ( CGFloat )pixel->blue;
            
            pixel->red   = ( uint8_t )gray;
            pixel->green = ( uint8_t )gray;
            pixel->blue  = ( uint8_t )gray;
        }
    }
    
    cgImage = CGBitmapContextCreateImage( context );
    
    CGContextRelease( context );
    CGColorSpaceRelease( colorSpace );
    free( pixels );
    
    if( cgImage == NULL )
    {
        return nil;
    }
    
    image = [ [ NSImage alloc ] initWithCGImage: cgImage size: self.size ];
    
    CGImageRelease( cgImage );
    
    return [ image autorelease ];
}

@end
