//
//  ViewController.swift
//  CountDownTimer
//
//  Created by Kamal Sampath Upasena on 9/13/17.
//  Copyright © 2017 Kamal Sampath Upasena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timeEnd : Date?
    var header : HeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add your End Time here
        timeEnd = Date(timeInterval: "2019-01-01 10:00:00".toDate(format: "yyyy-MM-dd HH:mm:ss").timeIntervalSince(Date()), since: Date())
        
        addTimerView()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addTimerView(){
        
        let height = (self.view.frame.width * 9)/16
        
        header = HeaderView(frame: CGRect(x:0, y: 0,width : self.view.frame.width, height : height))
        
        self.view.addSubview(header!)
        
        updateView()
    
    }
    
    func updateView() {
        // Initialize the label
        setTimeLeft()
        
        // Start timer
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.setTimeLeft), userInfo: nil, repeats: true)
    }
    
    
    func setTimeLeft() {
        let timeNow = Date()
        
       
        if timeEnd?.compare(timeNow) == ComparisonResult.orderedDescending {
            
            let interval = timeEnd?.timeIntervalSince(timeNow)
            
            let days =  (interval! / (60*60*24)).rounded(.down)
            
            let daysRemainder = interval?.truncatingRemainder(dividingBy: 60*60*24)
            
            let hours = (daysRemainder! / (60 * 60)).rounded(.down)
            
            let hoursRemainder = daysRemainder?.truncatingRemainder(dividingBy: 60 * 60).rounded(.down)
            
            let minites  = (hoursRemainder! / 60).rounded(.down)
            
            let minitesRemainder = hoursRemainder?.truncatingRemainder(dividingBy: 60).rounded(.down)
            
            let scondes = minitesRemainder?.truncatingRemainder(dividingBy: 60).rounded(.down)
            
            
            header?.DaysProgress.setProgress(days/360, animated: false)
            header?.hoursProgress.setProgress(hours/24, animated: false)
            header?.minitesProgress.setProgress(minites/60, animated: false)
            header?.secondesProgress.setProgress(scondes!/60, animated: false)
            
            let formatter = NumberFormatter()
            formatter.minimumIntegerDigits = 2
            
            header?.valueDay.text = formatter.string(from: NSNumber(value:days))
            header?.valueHour.text = formatter.string(from: NSNumber(value:hours))
            header?.valueMinites.text = formatter.string(from: NSNumber(value:minites))
            header?.valueSeconds.text = formatter.string(from: NSNumber(value:scondes!))
            
            
            
        } else {
            header?.fadeOut()
        }
    }
    
    

}

extension String{
    func toDate(format : String) -> Date{
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
}

extension UIView {
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
}

