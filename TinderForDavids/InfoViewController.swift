//
//  InfoViewController.swift
//  TinderForDavids
//
//  Created by David King on 4/1/18.
//  Copyright © 2018 David King. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var CardImage: UIImageView!
    var InfoCardImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = InfoCardImage{
            CardImage.image = card
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
