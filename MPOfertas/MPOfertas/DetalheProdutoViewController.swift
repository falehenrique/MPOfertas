//
//  DetalheProdutoViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 29/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class DetalheProdutoViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {

        let requestURL = URL(string: self.urlProduto!)
        if let urlTeste = requestURL {
            let request = URLRequest(url: urlTeste)
            webView.loadRequest(request)
        } else {
            let alertController = UIAlertController.init(title: "Validação", message: "Não foi possível carregar o endereço.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    var urlProduto: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
}
