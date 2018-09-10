//
//  EGOfferGridDetailViewController.swift
//  FabricSell
//
//  Created by KiwiTech on 05/09/18.
//

import UIKit

class EGOfferGridDetailViewController: UIViewController {

    @IBOutlet weak var overlayView: OverlayView!
    @IBOutlet weak var coverImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Bold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Regular", fontExtension: "ttf")
        coverImageView.sd_setImage(with: URL(string:"https://i2.wp.com/beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg?resize=640%2C426"), completed: nil)
    }

     // MARK: - Skip Action
    @IBAction func skip(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
