//
//  ViewController.swift
//  TinderForDavids
//
//  Created by David King on 3/31/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    var initialCardPos: CGPoint?
   var newCard: UIImageView?
    var rotation:CGFloat = 0
    @IBOutlet weak var CardView: UIImageView!
    //everytime cardview is paned create a duplicate of the image to move, delete the image in the original cardview or give it another image find another pic maybe
    
    func panCard(sender: UIPanGestureRecognizer) {
        
        var Card = sender.view as! UIImageView
        
        let bounds = UIScreen.main.bounds
        let screenWidth = bounds.width
        
        var translate = sender.translation(in: view)
      
        print("translate x \(translate.x)")
        
        switch sender.state{
        
        case .began:
        newCard = UIImageView(frame: Card.frame)
       newCard!.image = Card.image
        //newCard = UIImageView(image: Card.image!)
        
        initialCardPos = Card.center
        view.addSubview(newCard!)
        newCard!.center = initialCardPos!
        newCard!.image! = newCard!.image!.stretchableImage(withLeftCapWidth: CardView.image!.leftCapWidth, topCapHeight: CardView.image!.topCapHeight)
            
        case .changed:
            rotation = rotation + 0.1
            newCard!.center = CGPoint(x: initialCardPos!.x + translate.x, y: initialCardPos!.y + translate.y - 0.1)
            newCard!.transform = CGAffineTransform(rotationAngle: rotation)
            
            case .ended:
            if (translate.x > 50)
            {
               let offscreen = screenWidth - self.newCard!.center.x
                
                UIView.animate(withDuration: 1) {
                    self.newCard!.center = CGPoint(x: offscreen, y: self.newCard!.center.y)

                }
                
                newCard!.removeFromSuperview()
                
            }
            else if (translate.x < -50){
                UIView.animate(withDuration: 0.5) {
                    self.newCard!.center = CGPoint(x: self.newCard!.center.x - screenWidth, y: self.newCard!.center.y)
                    
                }
                
                newCard!.removeFromSuperview()
            }
            else {
                UIView.animate(withDuration: 0.4) {
                    self.newCard?.transform = CGAffineTransform.identity
                    self.newCard?.center = CGPoint(x: self.initialCardPos!.x, y: self.initialCardPos!.y)
                }
                
                newCard!.removeFromSuperview()
            }
            
        
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCard(sender:)))
            CardView.addGestureRecognizer(panGesture)
            CardView.isUserInteractionEnabled = true
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

