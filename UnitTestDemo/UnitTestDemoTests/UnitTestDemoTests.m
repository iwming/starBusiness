//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by Mi on 2018/1/15.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestDemoTests : XCTestCase

@end

@implementation UnitTestDemoTests

//每个测试方法调用前执行
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//每个测试方法调用后执行
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"custom test");
    int a = 3;
    NSLog(@"out a");
//    XCTAssertTrue(a == 0, "a 不等于0");
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
