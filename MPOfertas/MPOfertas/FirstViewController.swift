//
//  FirstViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 12/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var photos = [UIImage(named: "mercado_pago_logo"), UIImage(named: "mercado_pago_logo"), UIImage(named: "mercado_pago_logo")]
    
    var coupons = ["1234", "5677", "55435"]
    
    var products = ["teste 1", "teste 2", "teste 3"]
    
    var values = ["999,99", "888,99", "123,32"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasicTableViewCell
        
        cell.photo.image = photos[indexPath.row]
        cell.coupon.text = coupons[indexPath.row]
        cell.product.text = products[indexPath.row]
        cell.value.text = values[indexPath.row]
        
        return cell
        
    }
}

