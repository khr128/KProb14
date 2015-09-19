//
//  KProb14Random.swift
//  KProb14
//
//  Created by khr on 9/19/15.
//  Copyright © 2015 khr. All rights reserved.
//

import Foundation

class KProb14Random {

  static func shuffle(array:[Int]) -> [Int] {

    var shuffledArray = array

    let count = array.count
    for i in 0..<count {
      let remainingCount = count - i
      let exchangeIndex = i + Int(arc4random_uniform(UInt32(remainingCount)))

      let tmpi = shuffledArray[i]
      shuffledArray[i] = shuffledArray[exchangeIndex]
      shuffledArray[exchangeIndex] = tmpi
    }

    return shuffledArray
  }

  static func randomMultiplet(size size: Int, outOf n: Int) -> [Int] {

    var selectionArray = [Int](count: n, repeatedValue:0)
    for i in 0..<n {
      selectionArray[i] = i
    }

    var multiplet = [Int](count:size, repeatedValue:-1)

    for i in 0..<size {
      let remainingCount = selectionArray.count
      let pickIndex = Int(arc4random_uniform(UInt32(remainingCount)))

      multiplet[i] = selectionArray[pickIndex]

      selectionArray.removeAtIndex(pickIndex)
    }


    return multiplet
  }

}