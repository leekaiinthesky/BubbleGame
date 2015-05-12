//
//  ViewController.swift
//  BubbleGame
//
//  Created by Lee-kai Wang on 5/11/15.
//  Copyright (c) 2015 Lee-kai Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bubbles = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createSquare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSquare() {
        let square = UIView(frame: CGRect(x: Int(arc4random_uniform(320)), y: 0, width: 100, height: 100))
        square.backgroundColor = randomColor()
        
//        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        
//        button.backgroundColor = UIColor.greenColor()
//        button.setTitle("Test Button", forState: UIControlState.Normal)
//        square.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(square)
        //square.addSubview(button)
        bubbles.append(square)
        
        UIView.animateWithDuration(3.0, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
            square.frame = CGRect(x: Int(arc4random_uniform(320)), y: 650, width: 100, height: 100)
            //square.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        }, completion: { finished in
            square.removeFromSuperview()
            self.createSquare()
            self.bubbles.removeAtIndex(find(self.bubbles, square)!)
        })
    }
    
    func randomColor() -> UIColor {
        var randomRed = CGFloat(arc4random_uniform(256))/255.0
        var randomGreen = CGFloat(arc4random_uniform(256))/255.0
        var randomBlue = CGFloat(arc4random_uniform(256))/255.0
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }

    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
    }
    
    func buttonAction(sender:UIButton!)
    {
        println("Button tapped")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let location = touch.locationInView(view)
        println("location")
        for button in bubbles {
            println("bubble found")
            if (button.layer.presentationLayer().hitTest(location) != nil) {
                println("hit")
            }
        }
        
    }
    
}

