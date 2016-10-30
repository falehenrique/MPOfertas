//
//  HighlightedCellTableViewCell.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 18/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class HighlightedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemDestaque: UIImageView!
    @IBOutlet weak var viewCinza: UIView!
    
    @IBOutlet var imagemProduto: UIImageView!
    
    @IBOutlet weak var btnVerOferta: UIButton!
    @IBOutlet var link_loja: UIImageView!
    
    @IBOutlet var cupom: UILabel!
    
    @IBOutlet var preco: UILabel!
    
    @IBOutlet var produto: UILabel!
    
    @IBOutlet var desconto: UILabel!
    
    @IBOutlet var valor_final: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
