//
//  EGOfferGridDetailViewController.swift
//  FabricSell
//
//  Created by KiwiTech on 05/09/18.
//

import UIKit
import AVKit

class EGOfferGridDetailViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    @IBOutlet weak var overlayView: OverlayView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var offerTitle: UILabel!
    @IBOutlet weak var offerDescription: UILabel!
    @IBOutlet weak var offerPercentage: UILabel!
    @IBOutlet weak var offerOff: UILabel!
    var offerModel:Offers!
    var baseURL:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFont()
        if let baseURL = baseURL, let fileURL = offerModel.fileName, let url = URL(string: "\(baseURL)\(fileURL)")  {
            if !fileURL.contains("mp4") {
                coverImageView.sd_setImage(with: url, completed: nil)
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
                    print("its video")
                    // Create an AVPlayer, passing it the HTTP Live Streaming URL.
                    let player = AVPlayer(url: url)
                    // Create a new AVPlayerViewController and pass it a reference to the player.
                    let controller = AVPlayerViewController()
                    if #available(iOS 9.0, *) {
                        controller.allowsPictureInPicturePlayback = true
                    } else {
                        // Fallback on earlier versions
                    }
                    if #available(iOS 9.0, *) {
                        controller.delegate = self
                    } else {
                        // Fallback on earlier versions
                    }
                    if #available(iOS 9.0, *) {
                        controller.allowsPictureInPicturePlayback = true
                    } else {
                        // Fallback on earlier versions
                    }
                    controller.player = player
                    // Modally present the player and call the player's play() method when complete.
                    self?.present(controller, animated: true) {
                        player.play()
                    }
                }
            }
        }
        
        self.setContent()
    }
    
    
    
    // MARK: - Set details
    func setContent() {
        offerTitle.text = offerModel.offerTitle
        offerPercentage.text = offerModel.discount
        if offerModel.discountType == 1 {
            offerOff.isHidden = true
        } else {
            offerOff.isHidden = false
        }
        offerDescription.text = "Uber is offering up to 45% off on New York rides. Offer valid upto a max value of $35, and applicable only on rides greater than 2km. Valid for Uber rides in New York. No promo code required. Book a ride now."//offerModel.offerDescription
    }
    
    // MARK: - Load Fonts
    private func loadFont() {
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-SemiBold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Bold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Regular", fontExtension: "ttf")
        offerTitle.font = UIFont(name: "OpenSans-SemiBold", size: 19)
        offerPercentage.font = UIFont(name: "OpenSans-Bold", size: 22)
        offerOff.font = UIFont(name: "OpenSans-Regular", size: 13)
    }
    // MARK: - Later Action
    @IBAction func later(_ sender: Any) {
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
