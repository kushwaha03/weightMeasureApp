//
//  ViewController.swift
//  weightMeasureApp
//
//  Created by Krishna Kushwaha on 10/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UILabel!
    var currentForce: CGFloat! = 0
    var tareForce: CGFloat! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.isMultipleTouchEnabled = true
        weight.text = "0.00g"
    }


    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        currentForce = touch!.force
        weight.text = "\(currentForce.grams(tare: tareForce))g"
    }
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        currentForce = touch!.force
        weight.text = "\(currentForce.grams(tare: tareForce))g"
    }
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentForce = 0
        weight.text = "\(tareForce > 0 ? "-" : "")\(tareForce.grams(tare: 0))g"
    }
    
    @IBAction func onTare(sender: AnyObject) {
        tareForce = currentForce
        weight.text = "0.00g"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CGFloat {
    func grams(tare: CGFloat) -> String {
        return String(format: "%.2f", (self - tare) / CGFloat(0.020833))
    }
}
