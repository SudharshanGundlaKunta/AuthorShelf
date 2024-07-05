//
//  ViewController.swift
//  AuthorShelf
//
//  Created by Sudharshan on 26/06/24.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var photos: [Photo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AuthorTableViewCell", bundle: nil), forCellReuseIdentifier: "AuthorTableViewCell")
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        fetchDataFromServer()
    }
    
    @objc func refresh() {
        fetchDataFromServer()
    }
    
    func fetchDataFromServer() {
        
        NetworkHandler.shared.fetchData { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    self.photos = photos
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Failed to fetch photos: \(error)")
                }
                
                self.tableView.refreshControl?.endRefreshing()
            }
        }
        
    }
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorTableViewCell", for: indexPath) as? AuthorTableViewCell {
            cell.checkMarkButton.tag = indexPath.row
            cell.checkMarkButton.addTarget(self, action: #selector(addToFav(_ :)), for: .touchUpInside)
            cell.updateCell(photos?[indexPath.row] ?? nil)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if self.photos?[indexPath.row].isFav == true {
            displayDialog()
        }else {
            displayError()
        }
    }
    
    func displayDialog() {
        let alert = UIAlertController(title: "Successful", message: "Description", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
    
    func displayError() {
        let alert = UIAlertController(title: "Alert", message: "Please check the box", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(actionOK)
        present(alert, animated: true)
        
//    }
    
    @objc func addToFav(_ sender: UIButton) {
        let tag = sender.tag
        let isFav = self.photos?[tag].isFav
        self.photos?[tag].isFav = !(isFav ?? false)
        self.tableView.reloadData()
    }
}
