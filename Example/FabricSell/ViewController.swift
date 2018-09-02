//
//  ViewController.swift
//  FabricSell
//
//  Created by shahwalkhan@gmail.com on 09/01/2018.
//  Copyright (c) 2018 shahwalkhan@gmail.com. All rights reserved.
//

import UIKit
import FabricSell
class ViewController: UIViewController {

    @IBOutlet weak var firstGridView: EGGridView!
    @IBOutlet weak var secondGridView: EGGridView!
    @IBOutlet weak var thirdGridView: EGGridView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstGridView.setImage(with: URL(string: "https://media.wmagazine.com/photos/584b0d43db73e24512ebf4ff/4:3/w_1536/GettyImages-628353490.jpg")!)
        
        
        secondGridView.setImage(with: URL(string: "https://media.wmagazine.com/photos/584b0d43db73e24512ebf4ff/4:3/w_1536/GettyImages-628353490.jpg")!, success: { (data) in
            
        }) { (error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

