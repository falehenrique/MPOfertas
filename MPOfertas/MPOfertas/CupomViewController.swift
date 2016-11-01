//
//  CupomViewController.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 30/10/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import UIKit
import Social


class CupomViewController: UIViewController {

    @IBOutlet weak var labelCoupon: UILabel!
    @IBOutlet weak var labelCodigoAtivacao: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnGetShare: UIButton!
    @IBOutlet weak var btnActiveCode: UIButton!
    
    let codeActivate: String? = "TESTE123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnShare.layer.cornerRadius = 10.0
        btnGetShare.layer.cornerRadius = 10.0
        btnActiveCode.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
        
        if codeActivate != nil {
            labelCodigoAtivacao.text = codeActivate
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func shareSocial(_ sender: AnyObject) {

        if let labelCodigoAtivacaoCompartilhar = labelCodigoAtivacao.text {
            
            let objectsToShare = [labelCodigoAtivacaoCompartilhar]
            
            let activityController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.message, UIActivityType.mail, UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
            
            //activityController.excludedActivityTypes = excludedActivities
            present(activityController, animated: true, completion: nil)
        }
        
        
    }

    @IBAction func getShare(_ sender: AnyObject) {
        
    }
    
    @IBAction func activeCode(_ sender: AnyObject) {
        
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
