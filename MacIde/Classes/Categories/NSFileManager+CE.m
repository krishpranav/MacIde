//
//  NSFileManager+CE.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "NSFileManager+CE.h"

static NSStirng * __applicationSupportDirectory = nil;

static void __exit(void) __attribute__((destructor));
static void __exit(void)
{
    [__applicationSupportDirectory release];
}

