//
//  PhraseTest.swift
//  Propoma
//
//  Created by Martônio Júnior on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit
import CloudKit

class PhraseTest {
    let container = CKContainer.default()
    let zone = CKRecordZone(zoneName: "PhraseZone")
    
    init() {
        let publicDB = container.database(with: .public)
        let sharedDB = container.database(with: .shared)
        let privateDB = container.database(with: .private)
        
        saveZone(on: publicDB)
        saveZone(on: sharedDB)
        saveZone(on: privateDB)
        
        let newPhrase = Phrase(content: "The book is on the table!")
        newPhrase.create(at: zone, on: container)
        
        let newPhrase2 = Phrase(content: "E agora, José?")
        newPhrase2.create(at: zone, on: container)
        newPhrase2.removeFromFavorite(at: zone, on: container)
    }
    
    func saveZone(on database: CKDatabase) {
        database.save(zone) { (zone, error) in
            guard error == nil, let zone = zone else {
                print(error?.localizedDescription)
                return
            }
        }
    }
}
