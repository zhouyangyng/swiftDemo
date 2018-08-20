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
        
        view.backgroundColor = UIColor.lightGray
        basicGrammar()
        stringAndCollectionType()
        functionalTest()
        
        view.backgroundColor = UIColor.black
        
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
        let res1 = array1.sorted { (num1, num2) -> Bool in
            return num1 > num2
        }
        print(res1)
        
        
        
    }
    
    
    
}













