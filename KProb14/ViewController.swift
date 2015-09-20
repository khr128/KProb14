//
//  ViewController.swift
//  KProb14
//
//  Created by khr on 9/19/15.
//  Copyright © 2015 khr. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  var probability: Double = 1.23456789
  var simulator:KProb14Simulator!

  override func viewDidLoad() {
    super.viewDidLoad()

    simulator = KProb14Simulator()
  }

  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  @IBAction func startSimulation(sender: AnyObject) {
    simulator.start()
  }

  @IBAction func stopSimulation(sender: AnyObject) {
    simulator.stop()
  }
}

