//
//  ShapeViewController.swift
//  Project 3
//
//  Created by Bernard JIANG on 9/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    var color: UIColor?
    var colorViews = [UIView]()
    var shape = "Square"
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var eraserSwitch: UISwitch!
    @IBOutlet weak var alphaValue: UISlider!
    @IBOutlet weak var squareOutlet: UISwitch!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var hideShowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func squareSwitch(sender: UISwitch) {
        if squareOutlet.on {
            heightLabel.text = "Square:"
            widthLabel.hidden = true
            widthSlider.hidden = true
        } else {
            heightLabel.text = "Height:"
            widthLabel.hidden = false
            widthSlider.hidden = false
        }
    }
    
    @IBAction func hideShowViews(sender: UIButton) {

        if hideShowButton.titleLabel?.text == "Hide Views" {
            for aView in colorViews {
                aView.hidden = true
            }
            
            hideShowButton.setTitle("Show Views", forState: UIControlState .Normal)
        } else {
            for aView in colorViews {
                aView.hidden = false
            }
            
            hideShowButton.setTitle("Hide Views", forState: UIControlState .Normal)
        }
        
    }
    
    @IBAction func changeColor(sender: UISlider) {
        for aView in colorViews {
            aView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaValue.value))
        }
    }
    @IBAction func changeAlphaValue(sender: UISlider) {
        for aView in colorViews {
            aView.alpha = CGFloat(alphaValue.value)
        }
    }
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first!.locationInView(view)
        
        if eraserSwitch.on {
            for aView in colorViews {
                if CGRectContainsPoint(aView.frame, location) {
                    aView.removeFromSuperview()
                }
            }
        } else {
            if shape == "Triangle" {
                
                let colorView = TriangleView(frame: CGRect(x: 0, y: 0, width: Int(widthSlider.value), height: Int(heightSlider.value)))
                
                colorView.center = location
                colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaValue.value))
                
                colorViews.append(colorView)
                
                view.addSubview(colorView)
                
                
            } else {
                var colorView = UIView(frame: CGRect(x: 0, y: 0, width: Int(widthSlider.value), height: Int(heightSlider.value)))
                
                if squareOutlet.on {
                    colorView = UIView(frame: CGRect(x: 0, y: 0, width: Int(heightSlider.value), height: Int(heightSlider.value)))
                }
                
                colorView.center = location
                
                if color == nil {
                    
                    let r = randomCGFloat()
                    let g = randomCGFloat()
                    let b = randomCGFloat()
                    
                    redSlider.value = Float(r)
                    greenSlider.value = Float(g)
                    blueSlider.value = Float(b)
                    
                    colorView.backgroundColor = UIColor(red: r, green: b, blue: g, alpha: 1.0)
                } else {
                    colorView.backgroundColor = color
                }
                
                colorViews.append(colorView)
                view.addSubview(colorView)
            }
        }
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
