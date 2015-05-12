//
//  ViewController.swift
//  BubbleGame
//
//  Created by Lee-kai Wang on 5/11/15.
//  Copyright (c) 2015 Lee-kai Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var firstContact = false

    var square: UIView!
    var snap: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        collision.collisionDelegate = self
        collision.translatesReferenceBoundsIntoBoundary = true
        // add a boundary that has the same frame as the barrier
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        animator.addBehavior(collision)
        
        var updateCount = 0
        gravity.action = { // or collision.action = { // both get called at every animation frame
//            if (updateCount % 3 == 0) {
//                let outline = UIView(frame: square.bounds)
//        //        outline.transform = square.transform
//                outline.center = square.center
//                
//        //        outline.alpha = 0.5
//                outline.backgroundColor = UIColor.clearColor()
//                outline.layer.borderColor = square.layer.presentationLayer().backgroundColor
//                outline.layer.borderWidth = 1.0
//                self.view.addSubview(outline)
//            }
//            ++updateCount
        }
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        
        println("Boundary contact occurred - \(identifier)")
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.9) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
//        if (!firstContact) {
//            firstContact = true
//            
//            let newSquare = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
//            newSquare.backgroundColor = UIColor.grayColor()
//            view.addSubview(newSquare)
//            
//            collision.addItem(newSquare)
//            gravity.addItem(newSquare)
//            
////            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem:newSquare)
////            animator.addBehavior(attach)
//        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = touches.first as! UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }
}

