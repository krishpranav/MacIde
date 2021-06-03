//
//  NSTextView+CE.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

@interface NSTextView( CE )

- ( NSUInteger )numberOfHardLines;
- ( NSUInteger )numberOfSoftLines;
- ( void )enableSoftWrap;
- ( void )disableSoftWrap;
- ( NSInteger )currentLine;
- ( NSInteger )currentColumn;

@end
