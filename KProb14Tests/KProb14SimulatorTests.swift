//
//  KProb14SimulatorTests.swift
//  KProb14
//
//  Created by khr on 9/26/15.
//  Copyright © 2015 khr. All rights reserved.
//

import XCTest
@testable import KProb14

class KProb14SimulatorTests: XCTestCase {

  var simulator:KProb14Simulator?

  override func setUp() {
    super.setUp()

    simulator = KProb14Simulator()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testPickBall() {

    for _ in 1...100 {
      simulator!.pickBall()
    }

    print("p: \(simulator!.probabilityWhite)")
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      // Put the code you want to measure the time of here.
    }
  }

}
