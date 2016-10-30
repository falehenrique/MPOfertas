//
//  CadastroViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 18/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    var URLPath = "https://registration.mercadopago.com.br/registration-mp?mode=mp"
    
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
