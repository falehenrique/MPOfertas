//
//  FirstViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 12/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit

class ProdutosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    @IBOutlet var tableView: UITableView!
    
    var link_imagens = [String]()

    var link_produtos = [String]()

    var link_lojas = [String]()
    
    var destaques = [String]()

    var produtos = [String]()
    
    var cupons = [String]()
    
    var precos = [Float]()
    
    var valores_finais = [String]()
    
    var descontos = [NSNumber]()
    
    
    func setNavItem() {
        
        let attrs = [
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 20)!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attrs

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setNavItem()
        
        //tableView.setContentOffset(CGPoint.zero, animated: true)
        
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
                            if object["preco"] != nil {
                                 self.precos.append(object["preco"]! as! Float)
                            } else {
                                self.precos.append(0)
                            }
          
                            if object["link_loja"] !=  nil {
                                self.link_lojas.append(object["link_loja"] as! String)
                            } else {
                                self.link_lojas.append("noimage")
                            }
                            
                           
                            if object["link_imagem"] !=  nil {
                                 self.link_imagens.append(object["link_imagem"]! as! String)
                            } else {
                               self.link_imagens.append("noimage")
                            }
                            
                            
                            if object["link_produto"] != nil {
                                self.link_produtos.append(object["link_produto"]! as! String)
                            } else {
                                self.link_produtos.append("http://www.google.com.br")
                            }
                            
                            if object["nickname"] != nil {
                                self.produtos.append(object["nickname"]! as! String)
                            } else {
                                self.produtos.append("")
                            }

                            if object["desconto"] != nil {
                                self.descontos.append(object["desconto"]! as! NSNumber)
                            } else {
                                self.descontos.append(0)
                            }

                            if object["valor_final"] != nil {
                                self.valores_finais.append(object["valor_final"]! as! String)
                            } else {
                                self.valores_finais.append("")
                            }

                            if object["is_destaque"] != nil {
                                self.destaques.append(object["is_destaque"]! as! String)
                            } else {
                                self.destaques.append("")
                            }

                            if object["cupom"] != nil {
                                self.cupons.append(object["cupom"]! as! String)
                            } else {
                                self.cupons.append("")
                            }
                            
                            print(object["link_produto"]!)
                            
                        }
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
        
        return produtos.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDestaque = self.tableView.dequeueReusableCell(withIdentifier: "cellHighlighted", for: indexPath) as! HighlightedCellTableViewCell
        
        if destaques[indexPath.row] == "N" {
            cellDestaque.imagemDestaque.isHidden = true
        }

        cellDestaque.imagemProduto.downloadedFrom(link: link_imagens[indexPath.row])
        
        if cupons[indexPath.row] == "" {
            cellDestaque.cupom.isHidden = true
        } else {
            let coupon = cupons[indexPath.row]
            let textCoupon = "Use o cupom \(coupon)"
            

            let myMutableString = NSMutableAttributedString(
                string: textCoupon,
                attributes: [NSFontAttributeName:UIFont(
                    name: "Helvetica",
                    size: 11.0)!])
            
            myMutableString.addAttribute(NSFontAttributeName,
                                         value: UIFont(
                                            name: "Helvetica-Bold",
                                            size: 15.0)!,
                                         range: NSRange(
                                            location: 12,
                                            length: coupon.characters.count ))

            /*myMutableString.addAttribute(
                NSStrokeColorAttributeName,
                value: UIColor.orange,
                range:  NSRange(
                    location: 12,
                    length: 10))*/

            myMutableString.addAttribute(
                NSStrokeColorAttributeName,
                value: UIColor.black,
                range: NSRange(
                    location: 12,
                    length: coupon.characters.count))
            

            cellDestaque.cupom.attributedText = myMutableString
        }

            
        cellDestaque.produto.text = produtos[indexPath.row]

        print("valor final = " + valores_finais[indexPath.row])
        
        if valores_finais[indexPath.row] == "0.00" {
            cellDestaque.valor_final.isHidden = true
        } else {
            cellDestaque.valor_final.text = "R$ " + String(describing: valores_finais[indexPath.row])
        }
        
        
        cellDestaque.btnVerOferta.layer.cornerRadius = 10.0
    
        cellDestaque.viewCinza.layer.cornerRadius = 10.0
        
        cellDestaque.imagemProduto.layer.cornerRadius = 10.0;
        
        cellDestaque.desconto.text = String(describing: descontos[indexPath.row]) + "%" +  "\n" +
        "OFF"
        
        
        return cellDestaque
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paginaDetalheProduto" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let link_produto = link_produtos[indexPath.row]
                
                let controller = segue.destination as! DetalheProdutoViewController
                
                print("link do produto = \(link_produtos)")
                
                controller.urlProduto = link_produto as String?
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "paginaDetalheProduto", sender: self)
    }
    
}


extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
