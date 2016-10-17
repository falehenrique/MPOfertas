//
//  SecondViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 12/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet var buttonCadastre: UIButton!
    @IBOutlet var buttonSobreMercadoPago: UIButton!
    var valuesID = Array<NSNumber>()
    var names = Array<String>()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://mpblackfriday.herokuapp.com/app_categorias")!
        
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
                            self.valuesID.append(object["id_categoria"]! as! NSNumber)
                            self.names.append(object["nome_categoria"]! as! String)
                        }
                        print(self.valuesID)
                        print(self.names)
                    }
                    
                    self.loadTable()
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
            }
            
        })
        task.resume()
        formatView()
    }

    func formatView() {
        buttonSobreMercadoPago.layer.cornerRadius = 5
        buttonSobreMercadoPago.layer.borderWidth = 1
        buttonSobreMercadoPago.layer.borderColor  = UIColor.white.cgColor
        
        buttonCadastre.layer.cornerRadius = 5
        buttonCadastre.layer.borderWidth = 1
        buttonCadastre.layer.borderColor  = UIColor.white.cgColor
        //buttonSobreMercadoPago.layer.borderColor = UIColor.black.cgColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return valuesID.count
    }
    
    
    func loadTable() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryViewCell
        
        cell.cellCategoryID.text = String(describing: valuesID[indexPath.row])
        
        
        // create attributed string
        let myString = names[indexPath.row]
        let myAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        
        cell.cellCategoryText.attributedText = myAttrString
        
        
        return cell
        
    }


}

