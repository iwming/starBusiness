//
//  SonObject.m
//  MemoryDo
//
//  Created by Mi on 2018/1/4.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "SonObject.h"

@implementation SonObject

+(void)load
{
    NSLog(@"%s",__func__);

}

- (void)doStrong
{
    SonObject *objnew = [SonObject new];\
    self.obj = objnew;
}

//+(void)initialize
//{
//    NSLog(@"%s",__func__);
//}
@end
