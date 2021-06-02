//
//  IDEMutableOrderedDictionary.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEMutableOrderedDictionary.h"

@implementation IDEMutableOrderedDictionary

- ( id )initWithObjects: ( const id[] )objects forKeys: ( const id< NSCopying >[] )keys count: ( NSUInteger )count
{
    if( ( self = [ super init ] ) )
    {
        _keys    = [ [ NSMutableArray alloc ] initWithObjects: keys    count: count ];
        _objects = [ [ NSMutableArray alloc ] initWithObjects: objects count: count ];
    }
    
    return self;
}

- ( id )initWithCapacity: ( NSUInteger )capacity
{
    if( ( self = [ super init ] ) )
    {
        _keys    = [ [ NSMutableArray alloc ] initWithCapacity: capacity ];
        _objects = [ [ NSMutableArray alloc ] initWithCapacity: capacity ];
    }
    
    return self;
}

- ( NSUInteger )count
{
    return _keys.count;
}

- ( id )objectForKey: ( id )key
{
    NSUInteger i;
    
    i = [ _keys indexOfObject: key ];
    
    if( i == NSNotFound )
    {
        return nil;
    }
    
    return [ _objects objectAtIndex: i ];
}

- ( NSEnumerator * )keyEnumerator
{
    return [ _keys objectEnumerator ];
}

- ( void )setObject: ( id )object forKey: ( id< NSCopying > )key
{
    [ _keys    addObject: key ];
    [ _objects addObject: object ];
}

- ( void )removeObjectForKey: ( id )key
{
    NSUInteger i;
    
    i = [ _keys indexOfObject: key ];
    
    if( i == NSNotFound )
    {
        return;
    }
    
    [ _keys    removeObjectAtIndex: i ];
    [ _objects removeObjectAtIndex: i ];
}

- ( NSString * )descriptionWithLocale: ( id )locale
{
    NSString * description;
    NSUInteger i;
    
    description = [ NSString stringWithFormat: @"%@ <%p> {\n", NSStringFromClass( [ self class ] ), self ];
    
    ( void )locale;
    
    for( i = 0; i < _keys.count; i++ )
    {
        description = [ description stringByAppendingFormat: @"\t%@ = %@;\n", [ _keys objectAtIndex: i ], [ _objects objectAtIndex: i ] ];
    }
    
    return [ description stringByAppendingString: @"}" ];
}

- ( id )keyAtIndex: ( NSUInteger )index
{
    if( index >= _keys.count )
    {
        return nil;
    }
    
    return [ _keys objectAtIndex: index ];
}

- ( id )objectAtIndex: ( NSUInteger )index
{
    if( index >= _keys.count )
    {
        return nil;
    }
    
    return [ _objects objectAtIndex: index ];
}

@end
