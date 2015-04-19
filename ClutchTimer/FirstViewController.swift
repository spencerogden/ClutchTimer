//
//  FirstViewController.swift
//  ClutchTimer
//
//  Created by Spencer Ogden on 4/19/15.
//  Copyright (c) 2015 Spencer Ogden. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    var startTime = NSTimeInterval()
    var timer = NSTimer()
    
    @IBOutlet var displayTimeLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
    }
    
    func updateTime(){
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        var elapsedTime : NSTimeInterval = currentTime - startTime
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        let fraction = UInt8(elapsedTime * 100)
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        displayTimeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

