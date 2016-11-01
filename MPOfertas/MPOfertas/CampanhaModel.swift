//
//  CampanhaModel.swift
//  MPOfertas
//
//  Created by Henrique Goncalves Leite on 01/11/16.
//  Copyright © 2016 Mercado Pago. All rights reserved.
//

import Foundation

class CampanhaModel {
    var email:String
    var firebaseID:String
    var friendCode:String
    var promotion:String

    /*
     
     "email": "salgado10@mercadolivre.com",
     "firebaseID": "CODIGO0018",
     "friendCode": "EEEFGF",
     "promotion": 1
     
     */
    init(email:String, firebaseID:String, friendCode:String, promotion:String) {
        self.email = email
        self.firebaseID = firebaseID
        self.friendCode = friendCode
        self.promotion = promotion
    }


}
