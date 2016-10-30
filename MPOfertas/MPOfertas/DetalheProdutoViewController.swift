//
//  DetalheProdutoViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 29/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class DetalheProdutoViewController: UIViewController {
    
    var URLPath = "http://www.casaamerica.com.br/moveis/sala-de-estar/poltrona/"
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAdressURL()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAdressURL() {
        
        print("entrou aqui")
        
        let requestURL = URL(string: URLPath)
        if let urlTeste = requestURL {
            let request = URLRequest(url: urlTeste)
            webView.loadRequest(request)
        } else {
            let alertController = UIAlertController.init(title: "Validação", message: "Não foi possível carregar o endereço.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Fechar", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}
