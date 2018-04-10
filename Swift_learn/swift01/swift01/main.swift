//
//  main.swift
//  swift01
//
//  Created by Mi on 2018/4/1.
//  Copyright © 2018年 Mi. All rights reserved.
//

import Foundation

print("Hello, World!")

//常量
let name = "Mi"
print(name)

//变量
var varName = "Min"
print(varName)

//类型指定
var age:Double = 30
print(age)

var age3 = "2e3"
var newAge:Int? = Int(age3)

print("hello \(newAge)")

typealias mytype = String
let d:mytype = "yell"


//for i in 0...20
//{
//   print (i)
//}
var us = ("hello",123,"min")
print(us.0)

func getName()->(String,Int){
    return("Hello",666)
}

var us2 = getName()





