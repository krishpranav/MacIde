//
//  NSFileManager+CE.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

@interface NSFileManager( IDE )

- ( NSString * )pathOfDirectory:    ( NSSearchPathDirectory  )directory
                       inDomain:           ( NSSearchPathDomainMask )domain
                byAppendingPath:    ( NSString * )appendPath
              createIfNecessary:  ( BOOL )create;
- ( NSString * )applicationSupportDirectory;

@end
