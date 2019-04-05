//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


str.isEmpty
str.hasPrefix("hello")
str.hasSuffix("nd")

let mystring:String = "666"
let myInt:Int? = Int(mystring)

var strings = [String]()

strings.append("apple")
strings.append("bbbbb")
strings.append("ccccc")
strings += ["ddddd"]

for item in strings{
    print(item)
}

var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

var someVar = someDict[1]


var dict:[Int:String] = [1:"noe",2:"333",3:"564"]

var oldval = dict.updateValue("9999", forKey: 1)

var firstStr = dict[1]

print(firstStr ?? 8)





//: [Next](@next)

