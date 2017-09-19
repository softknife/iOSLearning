//
//  traditional_oc.m
//  1.Swift中C的基本使用
//
//  Created by 黄继平 on 2017/9/19.
//

#import "traditional_oc.h"

const int global_ten = 10;


TrafficColor const TrafficColorRed = @"Red";
TrafficColor const TrafficColorGreen = @"Green";
TrafficColor const TrafficColorYellow = @"Yellow";



Shape const ShapeCircle = 1 ;
Shape const ShapeTriangle = 2;
Shape const ShapeSquare = 3;


int add(int m , int n){
    return  m + n;
}

int vsum(int count , va_list numbers){
    
    int r = 0 ,i = 0;
    while (i < count) {
        r += va_arg(numbers, int);
        i++;
    }
    
    return r;
}

int sum(int count , ...){
    int r = 0;
    va_list ap;
    
    va_start(ap, count);
    r = vsum(count, ap);
    va_end(ap);
    
    return r;
    
}






Location  moveX(Location loc,double delta){
    loc.x += delta;
    return loc;
}
Location moveY(Location loc,double delta){
    
    loc.y += delta;
    return loc ;
}

Location createWithXY(double xy) {
    Location loc = {.x = xy ,.y = xy};
    return loc;
}

Location origin = {.x = 0,.y = 0};
Location getOrigin(void) {
    
    return origin ;
}
Location setOrigin(Location newOrigin){
    origin = newOrigin ;
    return  origin;
}

