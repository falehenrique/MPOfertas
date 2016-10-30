//
//  SecondViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 12/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var btnSobre: UIButton!
    @IBOutlet weak var btnCadastro: UIButton!
    var valuesID = Array<String>()
    var names = Array<String>()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Altera contorno das imagens
        btnSobre.layer.cornerRadius = 10.0
        btnCadastro.layer.cornerRadius = 10.0
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://api.mp-ofertas.melifrontends.com/app_categorias")!
        
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
                            print(object["id_categoria"])
                            print(object["nome_categoria"])
                            
                            self.valuesID.append(object["id_categoria"]! as! String)
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
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath)
        
        if cell == nil {
            return
        }
        
        cell!.accessoryType = UITableViewCellAccessoryType.checkmark
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
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        
        return cell
        
    }


}

