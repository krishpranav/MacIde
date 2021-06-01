//
//  CETypes.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#ifndef __CE_TYPES_H__
#define __CE_TYPES_H__

typedef enum
{
    CEOptimizationLevelNone             = 0x00,
    CEOptimizationLevelFast             = 0x01,
    CEOptimizationLevelFaster           = 0x02,
    CEOptimizationLevelFastest          = 0x03,
    CEOptimizationLevelFastestSmallest  = 0x04
}
CEOptimizationLevel;

typedef enum
{
    CETokenTypeText                     = 0x00,
    CETokenTypeKeyword                  = 0x01,
    CETokenTypePreprocessor             = 0x02,
    CETokenTypePredefined               = 0x03,
    CETokenTypeProject                  = 0x04,
    CETokenTypeString                   = 0x05,
    CETokenTypeNumber                   = 0x06,
    CETokenTypeComment                  = 0x07
}
CETokenType;

typedef enum
{
    CEVirtualKeyReturn                  = 0x24,
    CEVirtualKeyTab                     = 0x30,
    CEVirtualKeySpace                   = 0x31,
    CEVirtualKeyDelete                  = 0x33,
    CEVirtualKeyEscape                  = 0x35,
    CEVirtualKeyCommand                 = 0x37,
    CEVirtualKeyShift                   = 0x38,
    CEVirtualKeyCapsLock                = 0x39,
    CEVirtualKeyOption                  = 0x3A,
    CEVirtualKeyControl                 = 0x3B,
    CEVirtualKeyRightShift              = 0x3C,
    CEVirtualKeyRightOption             = 0x3D,
    CEVirtualKeyRightControl            = 0x3E,
    CEVirtualKeyFunction                = 0x3F,
    CEVirtualKeyF17                     = 0x40,
    CEVirtualKeyVolumeUp                = 0x48,
    CEVirtualKeyVolumeDown              = 0x49,
    CEVirtualKeyMute                    = 0x4A,
    CEVirtualKeyF18                     = 0x4F,
    CEVirtualKeyF19                     = 0x50,
    CEVirtualKeyF20                     = 0x5A,
    CEVirtualKeyF5                      = 0x60,
    CEVirtualKeyF6                      = 0x61,
    CEVirtualKeyF7                      = 0x62,
    CEVirtualKeyF3                      = 0x63,
    CEVirtualKeyF8                      = 0x64,
    CEVirtualKeyF9                      = 0x65,
    CEVirtualKeyF11                     = 0x67,
    CEVirtualKeyF13                     = 0x69,
    CEVirtualKeyF16                     = 0x6A,
    CEVirtualKeyF14                     = 0x6B,
    CEVirtualKeyF10                     = 0x6D,
    CEVirtualKeyF12                     = 0x6F,
    CEVirtualKeyF15                     = 0x71,
    CEVirtualKeyHelp                    = 0x72,
    CEVirtualKeyHome                    = 0x73,
    CEVirtualKeyPageUp                  = 0x74,
    CEVirtualKeyForwardDelete           = 0x75,
    CEVirtualKeyF4                      = 0x76,
    CEVirtualKeyEnd                     = 0x77,
    CEVirtualKeyF2                      = 0x78,
    CEVirtualKeyPageDown                = 0x79,
    CEVirtualKeyF1                      = 0x7A,
    CEVirtualKeyLeftArrow               = 0x7B,
    CEVirtualKeyRightArrow              = 0x7C,
    CEVirtualKeyDownArrow               = 0x7D,
    CEVirtualKeyUpArrow                 = 0x7E
}
CEVirtualKey;

#endif
