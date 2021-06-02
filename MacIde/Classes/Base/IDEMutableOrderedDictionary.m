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
