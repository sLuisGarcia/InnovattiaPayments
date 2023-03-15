//
//  PaymentModel.swift
//  InnovattiaPayments
//
//  Created by Luis García on 15/03/23.
//

import Foundation

struct PaymentModel: Codable {
    var name: String
    var phone: String
    var mail: String
    var cardNumber: String
    var expMonth: String
    var expYear: String
    var cvv: String
    var address: String
    var zipCode: String
    var colony: String
    
    init() {
        name = ""
        phone = ""
        mail = ""
        cardNumber = ""
        expMonth = ""
        expYear = ""
        cvv = ""
        address = ""
        zipCode = ""
        colony = ""
    }
}
