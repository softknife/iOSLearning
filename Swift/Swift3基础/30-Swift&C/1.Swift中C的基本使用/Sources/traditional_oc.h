//
//  traditional_oc.h
//  1.Swift中C的基本使用
//
//  Created by 黄继平 on 2017/9/19.
//

#import <Foundation/Foundation.h>

// 常量定义!
const int global_ten ;


//////////////////////////////////////////////////
// 字符枚举的定义
typedef NSString * TrafficColor NS_STRING_ENUM;

TrafficColor const TrafficColorRed ;
TrafficColor const TrafficColorGreen;
TrafficColor const TrafficColorYellow ;


// 定义一组可扩展的枚举
typedef int Shape NS_EXTENSIBLE_STRING_ENUM;

Shape const ShapeCircle;
Shape const ShapeTriangle;
Shape const ShapeSquare;



////////////////////////////////////////////////////////
// 函数使用
int add(int m , int n);

// 可变参数函数
int vsum(int count , va_list numbers);
int sum(int count , ...);



////////////////////////////////////////////////////////////////
// 结构体
typedef struct {
    double x,y;
} Location;

Location  moveX(Location,double) CF_SWIFT_NAME(Location.moveX(self:delta:)); // 设定对应的函数签名,或者说selector
Location moveY(Location,double) CF_SWIFT_NAME(Location.moveY(self:delta:));

Location createWithXY(double ) CF_SWIFT_NAME(Location.init(xy:));

Location getOrigin(void) CF_SWIFT_NAME(getter:Location.origin());
Location setOrigin(Location) CF_SWIFT_NAME(setter:Location.origin(newOrigin:));


////////////////////////////////////////////////////////////////
// union转换
typedef union  {
    char character; // 表示生成字符类型的ASCII
    long code ; // 表示生成整型类型的ASCII
    
}ASCII;

typedef struct {
    
    // 匿名的union成员
    union{
        char model;
        int series;
    };
    
    // unnamed 结构成员
    struct{
        double price;
        bool isAvailable;
    } info;
    
}Car;





////////////////////////////////////////////////////////////////
// C中的默认枚举
typedef enum {
    
    Red,Yellow,Blue
    
} Color;

// OC中的枚举
typedef NS_ENUM(NSInteger,ColorOC) {
    red,yellow,orange
};




