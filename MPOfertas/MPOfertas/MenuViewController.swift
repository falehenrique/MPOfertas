//
//  MenuViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 30/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var btnSobre: UIButton!
    @IBOutlet weak var btnCadastro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Altera contorno das imagens
        btnSobre.layer.cornerRadius = 10.0
        btnCadastro.layer.cornerRadius = 10.0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
