//
//  ViewController.swift
//  KProb14
//
//  Created by khr on 9/19/15.
//  Copyright © 2015 khr. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  dynamic var probability: Double = 0.0
  dynamic var nTests: Int = 0
  var simulator:KProb14Simulator!

  override func viewDidLoad() {

    super.viewDidLoad()
    simulator = KProb14Simulator()

    let nc = NSNotificationCenter.defaultCenter()
    nc.addObserverForName("KPROB14_PROBABILITY_CHANGED",
      object: nil,
      queue: nil,
      usingBlock: { (NSNotification note) -> Void in
//        print("notified: \(self.simulator!.probabilityWhite)")
        self.probability = self.simulator!.probabilityWhite
        self.nTests = self.simulator!.nTotal
    })
   }

  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  @IBAction func startSimulation(sender: AnyObject) {

    if simulator.state == SimulatorState.Idle {
      simulator.start()
    }

  }

  @IBAction func stopSimulation(sender: AnyObject) {

    if simulator.state == SimulatorState.Running {
      simulator.stop()
    }
    
  }
}

