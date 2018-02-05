//
//  BlockObject.m
//  MemoryDo
//
//  Created by Mi on 2018/1/18.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "BlockObject.h"

@implementation BlockObject

- (void)makeBlock
{
    void (^blk)(void) = ^{NSLog(@"Block");};
    blk();
}

- (void)makeBlock1
{
    int val = 10;
    const char *fmt = "val = %d\n";
    void (^blk)(void) = ^{printf(fmt, val);};
    
    val = 2;
    fmt = "These values were changed, val = %d\n";
    
    blk();
}
@end
