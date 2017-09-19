//
//  TestClass.m
//  Swift-C
//
//  Created by Apple on 2017/8/28.
//
//

#import "TestClass.h"


void funcWithCallBack(void *context , CALLBACK callback)
{
    sleep(4);
    
    callback(context);
}

