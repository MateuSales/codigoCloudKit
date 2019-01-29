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
    
    func toCKRecord(with zone: CKRecordZone?) -> CKRecord {
        var recordID: CKRecord.ID
        if self.recordName == nil {
            self.recordName = UUID().uuidString
        }
        if zone == nil {
            recordID = CKRecord.ID(recordName: self.recordName!)
        } else {
            recordID = CKRecord.ID(recordName: self.recordName!, zoneID: zone!.zoneID)
        }
        let record: CKRecord = CKRecord(recordType: "Phrase", recordID: recordID)
        record["content"] = self.content as? CKRecordValue
        return record
    }
}
