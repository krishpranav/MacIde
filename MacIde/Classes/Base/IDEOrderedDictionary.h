//
//  IDEOrderedDictionary.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

@interface IDEOrderedDictionary: NSDictionary
{
@protected
    
    NSArray * _keys;
    NSArray * _objects;
    
@private
    RESERVED_IVARS(IDEOrderedDictionary, 5);
}
