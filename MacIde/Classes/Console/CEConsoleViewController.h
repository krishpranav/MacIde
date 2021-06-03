//
//  CEConsoleViewController.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 03/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "CEViewController.h"

@interface CEConsoleViewController: CEViewController
{
@protected
    
    NSTextView * _textView;
    
@private
    
    RESERVED_IVARS(CEConsoleViewController, 5);
}

@property(nonatomic, readwrite, retain) IBOutlet NSTextView * textView;

@end
