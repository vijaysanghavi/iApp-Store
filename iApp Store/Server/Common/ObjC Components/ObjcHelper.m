//
//  Objective_C_Helper.m
//  Tagon
//
//  Created by Cogitate/Girish on 03/01/16.
//  Copyright © 2016 Cogitate. All rights reserved.
//

#import "ObjcHelper.h"
#import <UIKit/UIApplication.h>

@implementation ObjcHelper

+ (NSObject *)objectForClass:(Class)clazz{
    return [[clazz alloc] init];
}

@end
