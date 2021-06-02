//
//  NSApplication+CE.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "NSApplication+CE.h"
#import "IDEQuickLookItem.h"

static id < QLPreviewItem > __quickLookPreviewItem = nil;

static void __exit(void) __attribute__((destructor));
static void __exit(void)
{
    RELEASE_IVAR(__quickLookPreviewItem);
}
