//
//  TestC.c
//  Swift-C
//
//  Created by Apple on 2017/8/28.
//
//

#include "TestC.h"

typedef struct{

    char name[5];
    int value;
    int anotherValue;
    
} MyStruct;


void printAddress(const int *p){
    printf("%016lX\n",(unsigned long)p);
}

int doubler(int *p){
    
    *p = (*p) * 2;
    
    return *p;
}





