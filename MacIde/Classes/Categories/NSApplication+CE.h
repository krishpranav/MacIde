//
//  NSApplication+CE.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import <Quartz/Quartz.h>

@interface NSApplication(CE) <QLPreviewPanelDataSource>

- ( void )showQuickLookPanelForItemAtPath: ( NSString * )path sender: ( id )sender;

@end
