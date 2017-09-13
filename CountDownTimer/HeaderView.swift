//
//  HeaderView.swift
//  
//
//  Created by Kamal Sampath Upasena on 8/21/17.
//  Copyright © 2017 bhasha. All rights reserved.
//

import UIKit
import CircleProgressView

class HeaderView: UIView {

    @IBOutlet var view: UIView!
    
    @IBOutlet var DaysProgress: CircleProgressView!
    @IBOutlet var hoursProgress: CircleProgressView!
    @IBOutlet var minitesProgress: CircleProgressView!
    @IBOutlet var secondesProgress: CircleProgressView!
    
    
    @IBOutlet var valueDay: UILabel!
    @IBOutlet var valueHour: UILabel!
    @IBOutlet var valueMinites: UILabel!
    @IBOutlet var valueSeconds: UILabel!
   
    @IBOutlet var clockView: UIView!
   

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        _ = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)![0] as! UIView
        view.frame = self.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _ = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)![0] as! UIView
        view.frame = frame
        self.addSubview(view)
    }

}
