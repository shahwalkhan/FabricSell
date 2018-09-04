//
//  EGOfferGridViewController.swift
//  FabricSell
//
//  Created by KiwiTech on 03/09/18.
//

import UIKit

public class EGOfferGridViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "\(EGOfferGridTableViewCell.self)", bundle: Bundle.bundle), forCellReuseIdentifier: "\(EGOfferGridTableViewCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    @IBAction func closeController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private var topViewController:UIViewController? {
        let controller = UIApplication.shared.keyWindow?.rootViewController
        if let presentedVC = controller?.presentedViewController {
            return presentedVC
        }
        return controller
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Bundle {
    static var bundle:Bundle {
        let podBundle = Bundle(for: EGOfferGridViewController.self)
        let bundleURL = podBundle.url(forResource: "FabricSell", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
}

extension EGOfferGridViewController:UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EGOfferGridTableViewCell.self)", for: indexPath) as? EGOfferGridTableViewCell else {
            fatalError("Expected `\(EGOfferGridTableViewCell.self)` type for reuseIdentifier \(EGOfferGridTableViewCell.self).")
        }
        cell.bannderImageView.image = nil
        cell.bannderImageView.startAnimating()
        cell.bannderImageView.sd_setImage(with: URL(string: "https://media.wmagazine.com/photos/584b0d43db73e24512ebf4ff/4:3/w_1536/GettyImages-628353490.jpg")!, completed: nil)
        return cell
    }
}
extension EGOfferGridViewController:UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
