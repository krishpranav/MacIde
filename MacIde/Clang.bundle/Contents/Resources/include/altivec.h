//
//  altivec.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#ifndef __ALTIVEC_H
#define __ALTIVEC_H

#ifndef __ALTIVEC__
#error "AltiVec support not enabled"
#endif


#define __CR6_EQ     0
#define __CR6_EQ_REV 1
#define __CR6_LT     2
#define __CR6_LT_REV 3

#define __ATTRS_o_ai __attribute__((__overloadable__, __always_inline__))

static vector signed char __ATTRS_o_ai
vec_perm(vector signed char __a, vector signed char __b, vector unsigned char __c);
