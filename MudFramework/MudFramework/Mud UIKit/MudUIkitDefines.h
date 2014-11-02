//
//  TimUIMacro.h
//  CRM
//
//  Created by TimTiger on 5/21/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#ifndef MudUIMacro_h
#define MudUIMacro_h


#import <Availability.h>

#ifdef __cplusplus
#define MUDUIKIT_EXTERN		extern "C" __attribute__((visibility ("default")))
#else
#define MUDUIKIT_EXTERN	    extern __attribute__((visibility ("default")))
#endif

#define MUDUIKIT_STATIC_INLINE	static inline

#endif
