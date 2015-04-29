//
//  ViewController.swift
//  AngleMeasurement
//
//  Created by 落合隆行 on 2015/04/26.
//  Copyright (c) 2015年 落合隆行. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {
    
    @IBOutlet weak var attitudeRoll: UILabel!
    let motionManager: CMMotionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize MotionManager
        motionManager.deviceMotionUpdateInterval = 0.05 // 20Hz
        // Start motion data acquisition
        motionManager.startDeviceMotionUpdatesToQueue( NSOperationQueue.currentQueue(), withHandler:{
            deviceManager, error in

            var attitude: CMAttitude = deviceManager.attitude
            self.attitudeRoll.text = String(format: "%.2f", attitude.roll)
        })
        
        //attitudeRoll.text = "hoge"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

