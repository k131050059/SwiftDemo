//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


func dosomething(site:String) -> String{
    return (site+"1");
}

print(dosomething(site: "6666"))

func name(canshu1:String, canshu2:String, canshu3:String) ->String{
    
    return canshu1+canshu2+canshu3
    
}

print(name(canshu1: "1", canshu2: "2", canshu3: "3"))

func nocanshu() ->String{
    return "zifuchuan"
}

print(nocanshu())


func minMax(array:[Int]) -> (min:Int ,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value<currentMin{
            currentMin=value;
        }else if(value > currentMax){
            currentMax=value;
        }
        
    }
    
    return  (currentMin,currentMax);
}
let minandMax = minMax(array: [4,2,5,8,4,9,332,6,1])
print("最小值为\(minandMax.min),最大值为 \(minandMax.max)")
//: [Next](@next)
