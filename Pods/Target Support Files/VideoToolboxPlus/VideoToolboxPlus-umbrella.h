#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DeRecordtestViewController.h"
#import "NSError+VTPError.h"
#import "VideoToolboxPlus.h"
#import "VTPCompressionSession+Properties.h"
#import "VTPCompressionSession+PropertiesFromDictionary.h"
#import "VTPCompressionSession.h"

FOUNDATION_EXPORT double VideoToolboxPlusVersionNumber;
FOUNDATION_EXPORT const unsigned char VideoToolboxPlusVersionString[];

