//
//  IDEWindowController.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

FOUNDATION_EXPORT NSString * const IDEWindowControllerException;


@interface IDEWindowController: NSWindowController
{
@protected
    
    BOOL _releaseOnWindowClose;
    
@private
    RESERVED_IVARS(IDEWindowController, 5);
}

@property(atomic, readwrite, assign)BOOL releaseOnWindowClose;

@end
