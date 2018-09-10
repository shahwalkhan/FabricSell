//
//  EGOfferGridViewController.swift
//  FabricSell
//
//  Created by KiwiTech on 03/09/18.
//

import UIKit

public class EGOfferGridViewController: UIViewController {

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let gridModelView = ECOfferViewModel()

    override open func viewDidLoad() {
        super.viewDidLoad()
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-SemiBold", fontExtension: "ttf")
        headerTitle.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        
        // Register tableView with Cell identifier
        tableView.register(UINib(nibName: "\(EGOfferGridTableViewCell.self)", bundle: Bundle.bundle), forCellReuseIdentifier: "\(EGOfferGridTableViewCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        
        // Get data from ViewModel
        gridModelView.fetchOfferList {
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - close View Button Action
    @IBAction func closeController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension EGOfferGridViewController:UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gridModelView.offerList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EGOfferGridTableViewCell.self)", for: indexPath) as? EGOfferGridTableViewCell else {
            fatalError("Expected `\(EGOfferGridTableViewCell.self)` type for reuseIdentifier \(EGOfferGridTableViewCell.self).")
        }
        cell.bannderImageView.image = nil
        cell.bannderImageView.startAnimating()
        if let baseURL = gridModelView.baseURL, let fileURL = gridModelView.offerList[indexPath.row].fileName, let url = URL(string: "\(baseURL)\(fileURL)")  {
            cell.bannderImageView.startAnimating()
            cell.bannderImageView.sd_setImage(with: url, completed: nil)
        }
        cell.setContent(model: gridModelView.offerList[indexPath.row])
        return cell
    }
}
extension EGOfferGridViewController:UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return EngagingChoiceGridCell.cellHeight.rawValue
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailGridViewController = EGOfferGridDetailViewController(nibName: "\(EGOfferGridDetailViewController.self)", bundle: Bundle.bundle)
//        self.show(detailGridViewController, sender: self)
    }
}
