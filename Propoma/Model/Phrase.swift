//
//  Phrase.swift
//  Propoma
//
//  Created by Martônio Júnior on 29/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit
import CloudKit

class Phrase {
    var content: String?
    var recordName: String?
    
    init(content: String) {
        self.content = content
    }
    
    init(from record: CKRecord) {
        self.content = record["content"] as? String
        self.recordName = record["recordName"] as? String
    }
    
    func toCKRecord() -> CKRecord {
        if self.recordName == nil {
            self.recordName = UUID().uuidString
        }
        let record: CKRecord = CKRecord(recordType: "Phrase", recordID: CKRecord.ID(recordName: self.recordName!))
        record["content"] = self.content as? CKRecordValue
        return record
    }
    
    func favorite(at zone: CKRecordZone, on container: CKContainer) {
        saveAsRecord(at: zone, on: container.database(with: .private), completion: nil)
    }
    
    func create(at zone: CKRecordZone, on container: CKContainer) {
        saveAsRecord(at: zone, on: container.database(with: .public)) {
            self.favorite(at: zone, on: container)
        }
    }
    
    func removeFromFavorite(at zone: CKRecordZone, on container: CKContainer) {
        guard let recordName = self.recordName else { return }
        container.database(with: .private).delete(withRecordID: CKRecord.ID(recordName: recordName, zoneID: zone.zoneID)) { (recordID, error) in
            guard error == nil, let recordID = recordID else {
                print(error)
                return
            }
        }
    }
    
    func saveAsRecord(at zone: CKRecordZone, on database: CKDatabase, completion: (()->Void)?) {
        let record = self.toCKRecord()
        database.save(record) { (record, error) in
            guard error == nil, let record = record else {
                print(error)
                return
            }
        }
    }
}
