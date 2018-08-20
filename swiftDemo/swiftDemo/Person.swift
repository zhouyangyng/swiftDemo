//
//  Person.swift
//  swiftDemo
//
//  Created by 周洋 on 2018/8/20.
//  Copyright © 2018年 zhouyang. All rights reserved.
//

import UIKit

class Person {

    var dog: Dog?
    
    init(dog: Dog) {
        self.dog = dog
    }
}

struct Dog {
    
    var name: String
    var height: CGFloat
}

