//
//  KProb14Simulator.swift
//  KProb14
//
//  Created by khr on 9/20/15.
//  Copyright © 2015 khr. All rights reserved.
//

import Foundation

enum SimulatorState {
  case Running
  case Idle
}

class KProb14Simulator {

  static let removeSize = 3

  var state: SimulatorState = SimulatorState.Idle
  var nWhite = 0
  var nTotal = 0

  var simulatorQueue: dispatch_queue_t?

  let balls = [1,1,1,1,0,0,0,0,0,0] //1:white ball, 0:black ball

  var probabilityWhite:Double {

    get {
      if nTotal > 0 {
        return Double(nWhite)/Double(nTotal)
      } else {
        return 0.0
      }
    }
  }

  func pickBall() {

    let shuffledBalls = KProb14Random.shuffle(balls)
    let removeIndices = KProb14Random.randomMultiplet(size:KProb14Simulator.removeSize, outOf:balls.count)
    let ballsAfterRemoval = KProb14Random.removeByIndexArray(array: shuffledBalls, indicesToRemove: removeIndices)

    let pickIndex = Int(arc4random_uniform(UInt32(balls.count - KProb14Simulator.removeSize)))

    ++nTotal;
    if ballsAfterRemoval[pickIndex] == 1 {
      ++nWhite;
    }

    dispatch_async(dispatch_get_main_queue()) {
      let nc = NSNotificationCenter.defaultCenter()
      nc.postNotificationName("KPROB14_PROBABILITY_CHANGED", object:nil)
    }
  }



  func start() {

    state = SimulatorState.Running

    simulatorQueue = dispatch_queue_create("com.khr.KProb14.simulatorThread", DISPATCH_QUEUE_CONCURRENT)
    dispatch_async(simulatorQueue!) {
      while self.state == SimulatorState.Running {
        self.pickBall()
//        print("p: \(self.probabilityWhite)")
      }
    }

  }

  func stop() {

    state = SimulatorState.Idle

  }

}