//
//  ammintrin.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#ifndef __AMMINTRIN_H
#define __AMMINTRIN_H

#ifndef __SSE4A__
#error "SSE4A instruction set not enabled"
#else

#include <pmmintrin.h>

#define _mm_extracti_si64(x, len, idx) \
((__m128i)__builtin_ia32_extrqi((__v2di)(__m128i)(x), \
(char)(len), (char)(idx)))

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_extract_si64(__m128i __x, __m128i __y)
{
    return (__m128i)__builtin_ia32_extrq((__v2di)__x, (__v16qi)__y);
}

#define _mm_inserti_si64(x, y, len, idx) \
((__m128i)__builtin_ia32_insertqi((__v2di)(__m128i)(x), \
(__v2di)(__m128i)(y), \
(char)(len), (char)(idx)))

static __inline__ __m128i __attribute__((__always_inline__, __nodebug__))
_mm_insert_si64(__m128i __x, __m128i __y)
{
    return (__m128i)__builtin_ia32_insertq((__v2di)__x, (__v2di)__y);
}

static __inline__ void __attribute__((__always_inline__, __nodebug__))
_mm_stream_sd(double *__p, __m128d __a)
{
    __builtin_ia32_movntsd(__p, (__v2df)__a);
}

static __inline__ void __attribute__((__always_inline__, __nodebug__))
_mm_stream_ss(float *__p, __m128 __a)
{
    __builtin_ia32_movntss(__p, (__v4sf)__a);
}

#endif /* __SSE4A__ */

#endif /* __AMMINTRIN_H */
