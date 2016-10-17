//
//  CategoryViewCell.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 14/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    @IBOutlet var cellCategoryText: UILabel!
    @IBOutlet var cellCategoryID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
