//
//  ViewController.swift
//  Project 3
//
//  Created by Bernard JIANG on 8/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blueVC = ShapeViewController()
    var aColor: UIColor?
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    @IBAction func presentBlueModal(sender: UIButton) {
        navigationController?.pushViewController(blueVC, animated: true)
        blueVC.color = UIColor.blueColor()
    }
    */
    @IBAction func pressBlue(sender: UIButton) {
        aColor = UIColor.blueColor()
        performSegueWithIdentifier("blueScreen", sender: sender)
    }
    
    @IBAction func unwindToVC(sender: UIStoryboardSegue) {
    }
    
    @IBAction func pressRed(sender: UIButton) {
    }

    @IBAction func pressRandom(sender: UIButton) {
    }
    
    @IBAction func pressTriangle(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "redScreen" {
            if let ShapeViewController = segue.destinationViewController as? ShapeViewController {
                ShapeViewController.color = UIColor.redColor()
            }
        }
        
        if segue.identifier == "blueScreen" {
            if let ShapeViewController = segue.destinationViewController as? ShapeViewController {
                ShapeViewController.color = UIColor.blueColor()
            }
        }
        
        if segue.identifier == "randomScreen" {
            if let ShapeViewController = segue.destinationViewController as? ShapeViewController {
                ShapeViewController.color = nil
            }
        }
        
        if segue.identifier == "triangleScreen" {
            if let ShapeViewController = segue.destinationViewController as? ShapeViewController {
                ShapeViewController.shape = "Triangle"
            }
        }
    }
}

