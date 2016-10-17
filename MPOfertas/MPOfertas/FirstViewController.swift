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
    
    var photos = [String: UIImage]()
    
    var coupons = ["1234", "5677"]
    
    var products = [String]()
    
    var values = [Float]()
    
    var totalValues = [Float]()
    
    var discounts = [NSNumber]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://mpblackfriday.herokuapp.com/app_produtos")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        //Implement your logic
                        print(json)
                        
                        let field = json["results"] as! [[String:Any]]
                        
                        for object in field {
                            self.values.append(object["preco"]! as! Float)
                            self.products.append(object["nickname"]! as! String)
                            self.discounts.append(object["desconto"]! as! NSNumber)
                            self.totalValues.append(object["preco"]! as! Float)
                            
                            print(object["link_produto"]!)
                            //                        } else {
                            //                            let image = UIImage()
                            //                            self.photos.append(image)
                            //                        }
                            
                            
                        }
                        print(self.products)
                        print(self.discounts)
                    }
                    
                    self.loadTable()
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
            }
            
        })
        task.resume()
    }
    
    
    
    func loadTable() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
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
        
        //cell.photo.image = photos[indexPath.row]
        cell.coupon.text = coupons[indexPath.row]
        
        
        cell.product.text = products[indexPath.row]
        //cell.value.text = String(values[indexPath.row])
        
        // create attributed string
        let myString = "R$ " + String(values[indexPath.row])
        let myAttribute = [ NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        
        cell.value.attributedText = myAttrString
    
        cell.totalValue.text = "R$ " + String(describing: totalValues[indexPath.row])
        
        cell.discount.text = String(describing: discounts[indexPath.row]) + "%" +  "\n" +
            "OFF"
    
        return cell
        
    }
}

