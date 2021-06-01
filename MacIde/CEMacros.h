//
//  CEMacros.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#ifndef __CE_MACROS_H__
#define __CE_MACROS_H__

#define L10N( __label__ )                       NSLocalizedString( [ NSString stringWithCString: __label__ encoding: NSUTF8StringEncoding ], nil )

#define RELEASE_IVAR( __ivar__ )                [ __ivar__ release ]; __ivar__ = nil

#define RESERVED_IVARS( __cls__, __num__ )     id _ ## __cls__ ## _Reserved[ __num__ ] __attribute__( ( unused ) )

#define NOTIFICATION_CENTER                     ( ( NSNotificationCenter * )[ NSNotificationCenter  defaultCenter ] )
#define FILE_MANAGER                            ( ( NSFileManager        * )[ NSFileManager         defaultManager ] )
#define APPLICATION                             ( ( NSApplication        * )[ NSApplication         sharedApplication ] )
#define DEFAULTS                                ( ( NSUserDefaults       * )[ NSUserDefaults        standardUserDefaults ] )
#define BUNDLE                                  ( ( NSBundle             * )[ NSBundle              mainBundle ] )
#define WORKSPACE                               ( ( NSWorkspace          * )[ NSWorkspace           sharedWorkspace ] )

#define Log( object )                                                           \
NSLog                                                                       \
(                                                                           \
@"\n"                                                                   \
@"\n"                                                                   \
@"\tFile:           %@\n"                                               \
@"\tLine:           %u\n"                                               \
@"\tSymbol:         %s\n"                                               \
@"\tAddress:        %p\n"                                               \
@"\tRetain count:   %lu\n"                                              \
@"\tClass:          %@\n"                                               \
@"\tSuper class:    %@\n"                                               \
@"\n"                                                                   \
@"\tDescription:"                                                       \
@"\n"                                                                   \
@"\t%@\n"                                                               \
@"\n",                                                                  \
[ [ NSString stringWithFormat: @"%s", __FILE__ ] lastPathComponent ],   \
__LINE__,                                                               \
#object,                                                                \
( void * )object,                                                       \
[ object retainCount ],                                                 \
NSStringFromClass( [ object class ] ),                                  \
NSStringFromClass( [ object superclass ] ),                             \
object                                                                  \
)

#define LogPoint( point )                       \
NSLog                                       \
(                                           \
@"NSPoint:\n"                           \
@"    X: %f\n"                          \
@"    Y: %f",                           \
point.x,                                \
point.y                                 \
)

#define LogSize( size )                         \
NSLog                                       \
(                                           \
@"NSSize:\n"                            \
@"    Width:  %f\n"                     \
@"    Height: %f",                      \
size.width,                             \
size.height                             \
)

#define LogRect( rect )                         \
NSLog                                       \
(                                           \
@"NSRect:\n"                            \
@"    X:      %f\n"                     \
@"    Y:      %f\n"                     \
@"    Width:  %f\n"                     \
@"    Height: %f",                      \
( rect ).origin.x,                      \
( rect ).origin.y,                      \
( rect ).size.width,                    \
( rect ).size.height                    \
)

#define LogRange( range )                       \
NSLog                                       \
(                                           \
@"NSRange:\n"                           \
@"    Location: %lu\n"                  \
@"    Length:   %lu\n",                 \
( unsigned long )range.location,        \
( unsigned long )range.length           \
)

#define FLOAT_EQUAL( __a__, __b__ )     ( bool )( fabsf( ( float )__a__ - ( float )__b__ ) < FLT_EPSILON )
#define FLOAT_ZERO( __a__ )             ( bool )( fabsf( ( float )__a__ ) < FLT_EPSILON )
#define DOUBLE_EQUAL( __a__, __b__ )    ( bool )( fabs( ( double )__a__ - ( double )__b__ ) < DBL_EPSILON )
#define DOUBLE_ZERO( __a__ )            ( bool )( fabs( ( double )__a__ ) < DBL_EPSILON )
#define LDOUBLE_EQUAL( __a__, __b__ )   ( bool )( fabsl( ( long double )__a__ - ( long double )__b__ ) < LDBL_EPSILON )
#define LDOUBLE_ZERO( __a__ )           ( bool )( fabsl( ( long double )__a__ ) < LDBL_EPSILON )
#define CGFLOAT_EQUAL( __a__, __b__ )   ( bool )( fabs( ( CGFloat )__a__ - ( CGFloat )__b__ ) < DBL_EPSILON )
#define CGFLOAT_ZERO( __a__ )           ( bool )( fabs( ( CGFloat )__a__ ) < DBL_EPSILON )

#endif /* __CE_MACROS_H__ */

