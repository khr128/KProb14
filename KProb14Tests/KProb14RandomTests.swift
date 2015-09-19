//
//  KProb14RandomTests.swift
//  KProb14RandomTests
//
//  Created by khr on 9/19/15.
//  Copyright © 2015 khr. All rights reserved.
//

import XCTest
@testable import KProb14

class KProb14RandomTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testShuffle() {
    let testArray = [0,0,0,0,1,1,1,1,1,1]

    let shuffledArray1 = KProb14Random.shuffle(testArray)
    XCTAssertNotEqual(shuffledArray1, testArray, "Test array was not shuffled")

    let shuffledArray2 = KProb14Random.shuffle(testArray)
    XCTAssertNotEqual(shuffledArray2, testArray, "Test array was not shuffled")
    XCTAssertNotEqual(shuffledArray2, shuffledArray1, "The shuffle is always the same")
  }

  func testPickRandomMultiplet() {
    let multipletSize = 3
    let randomMultiplet = KProb14Random.randomMultiplet(size:multipletSize, outOf:10)

    debugPrint(randomMultiplet)

    XCTAssertEqual(randomMultiplet.count, multipletSize, "Incorrect multipletSize")
    for i in randomMultiplet {
      XCTAssertNotEqual(i, -1, "Unexpected index in a random mUltiplet")
    }
  }

  func testRemoveByIndexArray() {
    let testArray = [0,1,2,3,4,5,6,7,8,9]
    let removeIndices1 = [1,3,5]
    let expectedArrayAfterRemoval = [0,2,4,6,7,8,9]

    let arrayAfterRemoval1 = KProb14Random.removeByIndexArray(array: testArray, indicesToRemove: removeIndices1)
    XCTAssertEqual(arrayAfterRemoval1, expectedArrayAfterRemoval, "Unexpected array after removal by indices")

    let removeIndices2 = [5,3,1]
    let arrayAfterRemoval2 = KProb14Random.removeByIndexArray(array: testArray, indicesToRemove: removeIndices2)
    XCTAssertEqual(arrayAfterRemoval2, expectedArrayAfterRemoval, "Unexpected array after removal by indices")

    let removeIndices3 = [5,3,1,1]
    let arrayAfterRemoval3 = KProb14Random.removeByIndexArray(array: testArray, indicesToRemove: removeIndices3)
    XCTAssertEqual(arrayAfterRemoval3, expectedArrayAfterRemoval, "Unexpected array after removal by indices")
  }

//  func testPerformanceExample() {
//    // This is an example of a performance test case.
//    self.measureBlock {
//      // Put the code you want to measure the time of here.
//    }
//  }

}
