//
//  IDEMutableOrderedDictionary.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

@interface IDEMutableOrderedDictionary: NSMutableDictionary
{
@protected
    
    NSMutableArray * _keys;
    NSMutableArray * _objects;
    
@private
    
    RESERVED_IVARS(IDEMutableOrderedDictionary, 5);
}
