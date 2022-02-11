//
//  MyTableViewCell.swift
//  CryptoHelper
//
//  Created by admin1 on 29.01.2022.
//

import UIKit

struct CryptoTableViewCellViewModel {
    
    let name: String
    let symbol: String
    let price: String
    let logo_url: String
    
}

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var SymbolLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        nameLabel.text
//    }
    
    static let identifier = "CryptoTableViewCell"
    
    func configure (with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        SymbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        if let url = URL(string: "https://cryptoicon-api.vercel.app/api/icon/\(viewModel.symbol.lowercased())") {
                    DispatchQueue.main.async {
                        if let data = try? Data(contentsOf: url)
                        {
                        self.logoImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    
}
