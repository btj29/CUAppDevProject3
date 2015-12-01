//
//  BlueViewController.swift
//  Project 3
//
//  Created by Bernard JIANG on 8/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first!.locationInView(view)
        
        let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        blueView.center = location
        
        blueView.backgroundColor = UIColor.blueColor()
        
        view.addSubview(blueView)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
