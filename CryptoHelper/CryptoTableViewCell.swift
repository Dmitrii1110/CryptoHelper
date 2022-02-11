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
    
}

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var SymbolLabel: UILabel!
    
    
    static let identifier = "CryptoTableViewCell"
    
    func configure (with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        SymbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
    }

}
