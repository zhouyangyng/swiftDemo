//
//  ViewController.swift
//  swiftDemo
//
//  Created by zhouyang on 2018/8/20.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var string1: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        // 实例化
        let rect1 = CGRect(x: 100, y: 100, width: 100, height: 100)
        let myView = UIView(frame: rect1)
        myView.backgroundColor = UIColor(displayP3Red: 0.5, green: 0.6, blue: 0.4, alpha: 1)
        view.addSubview(myView)
        
        
        basicGrammar()
        stringAndCollectionType()
        functionalTest()
        testStructAndClass()
        testGenerics()
        
        
    }
    
}

// 语法
extension ViewController {
    
    func basicGrammar() {
        
        // let:常量，不可修改
        let intA = 1
        let str1 = "字符串1"
        
        // 打印结果
        print("= = = = = = = = = = = = = =")
        print(intA, str1)
        print("= = = = = = = = = = = = = =")
        
        // var:变量，可以修改
        var intB = 2
        intB = 10
        print("= = = = = = = = = = = = = =")
        print(intB)
        print("= = = = = = = = = = = = = =")
        
        // 调用函数
        let intC = multiply(num1: 5, num2: 6)
        print(intC)
        
        // Bool类型,必须 true/false，没有“非0即真”的概念
        let str3: String = ""
        if str3.isEmpty {
            print("yes")
        }else {
            print("no")
        }
        
        /**
         *  Optional，可选类型
         *  非optional类型，不可以为 nil
         *  使用optional类型的变量，需要强制解包，或者给默认值
         */
        var optionalStr: String?
        optionalStr = nil
        print(optionalStr ?? "default")
        
        let int1: Int?
        int1 = nil
        let res = int1 ?? 2 * 10
        print("= = = = = = = = = = = = = =")
        print(res)
        print("= = = = = = = = = = = = = =")
        
        /**
         *  范围 range
         *  1...5   1到5
         *  1..<5  1到4
         */
        for index in 1..<5 {
            print(index)
        }
        
        /**
         *  closure，闭包
         */
        let closure: ((Int) -> Int) = {num1 in
            return num1 * 2
        }
        
        let res1 = closure(10)
        print(res1)
        
        functionWithClosure { (intA, intB) -> Int in
            
            return intA * intB
        }
    }
    
    // 参数num1、num2，返回值 Int类型
    func multiply(num1: Int, num2: Int) -> Int {
        
        return num1 * num2
    }
    
    // 闭包作为函数的参数
    func functionWithClosure(closure: (Int, Int) -> Int) {
        
        let num1 = 5, num2 = 8
        let res = closure(num1, num2)
        print(res)
    }
    
    
}

// String、Array、Dictionary
extension ViewController {
    
    func stringAndCollectionType() {
        
        // String
        let str1 = "hello "
        var str2 = "world"
        str2.append("!!!")
        print("= = = = = = = = = = = = = =")
        print(str1 + str2)
        
        print("= = = = = = = = = = = = = =")
        
        let int1 = 2
        print("= = = = = = = = = = = = = =")
        print("\(int1) 乘以5等于：\(int1 * 5)")
        print("= = = = = = = = = = = = = =")
        
        let unusualStr = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualStr has \(unusualStr.count) characters")
        for character in unusualStr {
            print(character)
        }
        
        // Array
        var someInts = [Int]()
        someInts.append(1)
        
        var someStrings: [String] = ["milk", "bread"]
        someStrings.append(contentsOf: ["egg", "rice"])
        print("= = = = = = = = = = = = = =")
        print(someStrings)
        print("= = = = = = = = = = = = = =")
        
        
        // Dictionary
        let dic: [String: String] = ["name": "小张", "country": "China", "city": "南京"]
        let res = dic.values
        print(res)
        
    }
    
}

// functional Programming
extension ViewController {
    
    func functionalTest() {
        
        let array1 = [3, 6, 1, 10, 7]
        // 排序 sorted
        let res1 = array1.sorted { (num1, num2) -> Bool in
            return num1 > num2
        }
        print(res1)
        
        let res2 = array1.sorted {$0 > $1}
        print(res2)
        
        // 过滤 filter
        let res3 = array1.filter { (num1) -> Bool in
            return num1 % 2 == 1
        }
        print(res3)
        
        let res4 = array1.filter{$0 > 5}
        print(res4)
        
        // 遍历 map
        let res5 = array1.map{$0 * 10}
        print(res5)
        
        // Dictionary
        let dic = [5: "😁", 10: "🍉", 1: "⚽️", 8: "🎱", 2: "🐼"]
        let res6 = dic.sorted { (keyValue1, keyValue2) -> Bool in
            return keyValue1.key < keyValue2.key
        }
        let res7 = dic.sorted{$0.key < $1.key}
        print(res6, res7)
    }
}

// 💗 struct和class
extension ViewController {
    
    func testStructAndClass() {
        
        let dog1 = Dog(name: "小花", height: 80.0)
        var dog2 = Dog(name: "大黄", height: 33.5)
        
        let person1 = Person(dog: dog1)
        let person2 = person1
        // 给 person1 赋值 dog2
        person1.dog = dog2
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        print(person2)
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        
        // 修改 dog2
        dog2.name = "小白"
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        print(person1)
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        
        
        // String、Array、Dictionary
        var array1 = [1, 2, 3]
        let array2 = array1
        array1.append(contentsOf: [7, 8, 9])
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        print("array1=>\(array1),,,array2=>\(array2)")
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        
    }
}

// 泛型
extension ViewController {
    
    func testGenerics() {
        
        
    }
    
    /*
    func swap(a: Int, b: Int) {
        
        let temp = a
        a = b
        b = temp
    }
    */
    
    
}

protocol Food {
    
}

protocol Animal {
    func eat(food:Food)
}

struct Fish: Food {
    
}

struct Grass {
    
}

struct Cat: Animal {
    
    func eat(food: Food) {
        if food is Fish {
            print("猫吃🐟")
        }else {
            return
        }
    }
}













