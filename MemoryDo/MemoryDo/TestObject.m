//
//  TestObject.m
//  MemoryDo
//
//  Created by Mi on 2018/1/3.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject


- (id)test
{
    NSLog(@"id test");
    return @"abc";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
     
        self.weakString = @"123";
        
       __block int val = 0;
        void (^blk)(void) = ^{
            
            printf("in block val = %d\n",val);
            val = 2;
        };
        
        val = 1;
        blk();
        printf("af block val = %d\n",val);

        

    }
    return self;
}

//+(void)load
//{
//    NSLog(@"%s",__func__);
//
//}


//+(void)initialize
//{
//    NSLog(@"%s",__func__);
//}

- (void)dealloc
{
    NSLog(@"%@",self.weakString);

    
}

@end
