//
//  PhoneContact.swift
//  Contaxe
//
//  Created by Michael Neas on 12/4/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import Foundation
import ContactsUI

class PhoneContact: NSObject {
    let contact: CNContact
    
    var name: String {
        contact.givenName + " " + contact.familyName
    }

    var avatarData: Data? {
        contact.thumbnailImageData
    }
    
    var phoneNumber: [String] = [String]()
    var email: [String] = [String]()
    
    var location: String {
        (contact.postalAddresses.first?.value.city ?? "Boston")
        + ", " +
        (contact.postalAddresses.first?.value.state ?? "MA")
    }
    
    var initials: String {
        "\(contact.givenName.first ?? Character(""))" + "\(contact.familyName.first ?? Character(""))"
    }
    
    init(contact: CNContact) {
        self.contact = contact
        
        for phone in contact.phoneNumbers {
            phoneNumber.append(phone.value.stringValue)
        }
        for mail in contact.emailAddresses {
            email.append(mail.value as String)
        }
        
        
    }
    
    override init() {
        self.contact = CNContact()
        super.init()
    }
}
