//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  DingTalkDylib.m
//  DingTalkDylib
//
//  Created by TozyZuo on 2018/2/11.
//  Copyright (c) 2018年 TozyZuo. All rights reserved.
//

#import "DingTalkDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
//#import "FAMethodUtility.h"

static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");

    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {

#ifndef __OPTIMIZE__
        CYListenServer(6666);
#endif

    }];
}


CHDeclareClass(NSBundle)
CHOptimizedMethod(0, self, NSString *, NSBundle, bundleIdentifier)
{
    NSLog(@"@@@ %@", self);
    NSString *result = CHSuper(0, NSBundle, bundleIdentifier);
    //    result = @"com.laiwang.DingTalk";
    return result;
}

CHOptimizedMethod(0, self, NSDictionary *, NSBundle, infoDictionary)
{
    NSMutableDictionary *dic = CHSuper(0, NSBundle, infoDictionary).mutableCopy;
    if ([self.description hasSuffix:@".app"]) {
        NSLog(@"@@@ replace");
        dic[@"CFBundleIdentifier"] = @"com.laiwang.DingTalk";
    }

    return dic;
}

CHConstructor{
    CHLoadLateClass(NSBundle);
    //    CHClassHook(0, NSBundle, bundleIdentifier);
//    CHClassHook(0, NSBundle, infoDictionary);
}


