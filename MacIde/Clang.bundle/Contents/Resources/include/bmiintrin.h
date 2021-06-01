//
//  bmiintrin.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#if !defined __X86INTRIN_H && !defined __IMMINTRIN_H
#error "Never use <bmiintrin.h> directly; include <x86intrin.h> instead."
#endif

#ifndef __BMI__
# error "BMI instruction set not enabled"
#endif /* __BMI__ */

#ifndef __BMIINTRIN_H
#define __BMIINTRIN_H

static __inline__ unsigned short __attribute__((__always_inline__, __nodebug__))
__tzcnt_u16(unsigned short __X)
{
    return __builtin_ctzs(__X);
}

static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__andn_u32(unsigned int __X, unsigned int __Y)
{
    return ~__X & __Y;
}

static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__bextr_u32(unsigned int __X, unsigned int __Y)
{
    return __builtin_ia32_bextr_u32(__X, __Y);
}

static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__blsi_u32(unsigned int __X)
{
    return __X & -__X;
}

static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__blsmsk_u32(unsigned int __X)
{
    return __X ^ (__X - 1);
}

static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__blsr_u32(unsigned int __X)
{
    return __X & (__X - 1);
}

static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__tzcnt_u32(unsigned int __X)
{
    return __builtin_ctz(__X);
}

#ifdef __x86_64__
static __inline__ unsigned long long __attribute__((__always_inline__, __nodebug__))
__andn_u64 (unsigned long long __X, unsigned long long __Y)
{
    return ~__X & __Y;
}

static __inline__ unsigned long long __attribute__((__always_inline__, __nodebug__))
__bextr_u64(unsigned long long __X, unsigned long long __Y)
{
    return __builtin_ia32_bextr_u64(__X, __Y);
}

static __inline__ unsigned long long __attribute__((__always_inline__, __nodebug__))
__blsi_u64(unsigned long long __X)
{
    return __X & -__X;
}

static __inline__ unsigned long long __attribute__((__always_inline__, __nodebug__))
__blsmsk_u64(unsigned long long __X)
{
    return __X ^ (__X - 1);
}

static __inline__ unsigned long long __attribute__((__always_inline__, __nodebug__))
__blsr_u64(unsigned long long __X)
{
    return __X & (__X - 1);
}

static __inline__ unsigned long long __attribute__((__always_inline__, __nodebug__))
__tzcnt_u64(unsigned long long __X)
{
    return __builtin_ctzll(__X);
}
#endif

#endif /* __BMIINTRIN_H */
