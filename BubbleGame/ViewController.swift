//
//  ViewController.swift
//  BubbleGame
//
//  Created by Lee-kai Wang on 5/11/15.
//  Copyright (c) 2015 Lee-kai Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var bubbles = [UIView]()
    
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
        let square = UIView(frame: CGRect(x: Int(arc4random_uniform(320)), y: 0, width: 10, height: 10))
//        bubbles.append(square)
        square.backgroundColor = randomColor()
        view.addSubview(square)
        
        UIView.animateWithDuration(5.0, animations: {
            square.frame = CGRect(x: Int(arc4random_uniform(320)), y: 700, width: 100, height: 100)
        }, completion: { finished in
            square.removeFromSuperview()
//            self.bubbles.removeAtIndex(find(self.bubbles, square)!)
            self.createSquare()
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

}

