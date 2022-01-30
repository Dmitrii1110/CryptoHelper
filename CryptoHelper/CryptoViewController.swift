//
//  ViewController.swift
//  CryptoHelper
//
//  Created by admin1 on 29.01.2022.
//

import UIKit

class CryptoViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModels = [CryptoTableViewCellViewModel] ()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Loaded")
        tableView.dataSource = self
        tableView.delegate = self
        
        NomicsAPICaller.shared.getAllCryptoData { [weak self] result in
        switch result {
        case .success(let models):
            print (models.count)
            

            print (models[0].name! + " - " + models[0].price!)
//            print (models[0].name)
            
            
            self?.viewModels = models.compactMap({
                CryptoTableViewCellViewModel(
                    name: $0.name ?? "", symbol: $0.symbol ?? "", price: $0.price ?? "")
            })
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        case .failure(_):
            print("no good")
        }
    }

}
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell
        else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }

}

