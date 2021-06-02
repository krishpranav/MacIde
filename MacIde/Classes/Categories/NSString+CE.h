//
//  NSString+CE.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

typedef enum
{
    CEStringDataSizeTypeAuto        = 0x000,
    CEStringDataSizeTypeBytes       = 0x001,
    
    CEStringDataSizeTypeKiloBytes   = 0x101,
    CEStringDataSizeTypeMegaBytes   = 0x102,
    CEStringDataSizeTypeGigaBytes   = 0x103,
    CEStringDataSizeTypeTeraBytes   = 0x104,
    CEStringDataSizeTypePetaBytes   = 0x105,
    CEStringDataSizeTypeExaBytes    = 0x106,
    CEStringDataSizeTypeZettaBytes  = 0x107,
    CEStringDataSizeTypeYottaBytes  = 0x108,
    
    CEStringDataSizeTypeKibiBytes   = 0x201,
    CEStringDataSizeTypeMebiBytes   = 0x202,
    CEStringDataSizeTypeGibiBytes   = 0x203,
    CEStringDataSizeTypeTebiBytes   = 0x204,
    CEStringDataSizeTypePebiBytes   = 0x205,
    CEStringDataSizeTypeExbiBytes   = 0x206,
    CEStringDataSizeTypeZebiBytes   = 0x207,
    CEStringDataSizeTypeYobiBytes   = 0x208
}
CEStringDataSizeType;

@interface NSString( CE )

+ ( NSString * )stringForDataSizeWithBytes: ( uint64_t )bytes;
+ ( NSString * )stringForDataSizeWithBytes: ( uint64_t )bytes numberOfDecimals: ( NSUInteger )decimals;
+ ( NSString * )stringForDataSizeWithBytes: ( uint64_t )bytes unit: ( CEStringDataSizeType )unit;
+ ( NSString * )stringForDataSizeWithBytes: ( uint64_t )bytes unit: ( CEStringDataSizeType )unit numberOfDecimals: ( NSUInteger )decimals;

@end
