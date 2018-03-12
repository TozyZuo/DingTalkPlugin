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

static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");

    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {

#ifndef __OPTIMIZE__
        CYListenServer(6666);
#endif

    }];
}