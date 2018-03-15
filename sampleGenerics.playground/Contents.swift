//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

//関数での使用
func samplefunc<T:Numeric>(num1:T, num2:T) -> T {
    return num1 + num2
}

print(samplefunc(num1:100, num2:200)) // 300
print(samplefunc(num1:100.5, num2:200.3)) // 300.8

//クラスでの使用
class SampleClass<T> {
    
    var item: T
    
    init(item: T) {
        self.item = item
    }
    
}

let cl1 = SampleClass(item: 100)
print(cl1.item)

let cl2 = SampleClass(item: "apple")
print(cl2.item)

//プロトコルでの使用もできるよ＾＾

