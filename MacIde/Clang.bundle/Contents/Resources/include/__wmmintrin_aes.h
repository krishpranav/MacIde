//
//  __wmmintrin_aes.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#ifndef _WMMINTRIN_AES_H
#define _WMMINTRIN_AES_H

#include <emmintrin.h>

#if !defined (__AES__)
#  error "AES instructions not enabled"
#else

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_aesenc_si128(__m128i __V, __m128i __R)
{
    return (__m128i)__builtin_ia32_aesenc128(__V, __R);
}

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_aesenclast_si128(__m128i __V, __m128i __R)
{
    return (__m128i)__builtin_ia32_aesenclast128(__V, __R);
}

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_aesdec_si128(__m128i __V, __m128i __R)
{
    return (__m128i)__builtin_ia32_aesdec128(__V, __R);
}

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_aesdeclast_si128(__m128i __V, __m128i __R)
{
    return (__m128i)__builtin_ia32_aesdeclast128(__V, __R);
}

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_aesimc_si128(__m128i __V)
{
    return (__m128i)__builtin_ia32_aesimc128(__V);
}

#define _mm_aeskeygenassist_si128(C, R) \
__builtin_ia32_aeskeygenassist128((C), (R))

#endif

#endif  /* _WMMINTRIN_AES_H */

