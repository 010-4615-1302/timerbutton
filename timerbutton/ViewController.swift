//
//  ViewController.swift
//  timerbutton
//
//  Created by D7703_28 on 2018. 4. 9..
//  Copyright © 2018년 YDuChoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mytimer = Timer()
    var count = 0
    var min = 0
    var sec = 0
    var msec = 0
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var stop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        stop.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func updateTime() {
            count = count + 1
             min = count / 60 / 100
             sec = (count - (min * 60 * 100)) / 100
             msec = count - (min * 60 * 100) - (sec * 100)
            timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        }
        
    @IBAction func start(_ sender: Any) {
        mytimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()})
        start.isEnabled = false
        stop.isEnabled = true
    }
    
    @IBAction func Stop(_ sender: Any) {
        
        mytimer.invalidate()
        start.isEnabled = true
        stop.isEnabled = false
    }
    
    @IBAction func Reset(_ sender: Any) {
        mytimer.invalidate()
        count = 0
        min = 0
        sec = 0
        msec = 0
        timeLabel.text = "00:00:00"
    }
    
        
        
    }




