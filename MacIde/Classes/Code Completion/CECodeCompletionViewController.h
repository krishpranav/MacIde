//
//  CECodeCompletionViewController.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 03/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "CEViewController.h"

@interface CECodeCompletionViewController: CEViewController
{
@protected
    
    NSArray     * _results;
    BOOL          _cancel;
    BOOL          _isOpening;
    NSTableView * _tableView;
    
@private
    
    RESERVED_IVARS( CECodeCompletionViewController, 5 );
}

@property(    atomic, readonly          )          BOOL          isOpening;
@property( nonatomic, readwrite, retain ) IBOutlet NSTableView * tableView;



