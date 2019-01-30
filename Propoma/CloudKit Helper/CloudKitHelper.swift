//
//  CloudKitHelper.swift
//  Bilhetes
//
//  Created by Alysson Moreira on 27/01/19.
//  Copyright © 2019 Alysson Moreira. All rights reserved.
//

import CloudKit

class CloudKitHelper {
    
    private var container: CKContainer!
    private var publicDB: CKDatabase!
    private var privateDB: CKDatabase!
    private var sharedDB: CKDatabase!
    private let customZone: CKRecordZone
    
    init(for identifier: String? = nil) {
        if let id = identifier {
            self.container = CKContainer(identifier: id)
            
        } else {
            
            self.container = CKContainer.default()
                        
        }
        
        self.publicDB = self.container.publicCloudDatabase
        self.privateDB = self.container.privateCloudDatabase
        self.sharedDB = self.container.sharedCloudDatabase
        self.customZone = CKRecordZone(zoneName: "Phrases")
        self.privateDB.save(self.customZone) { (zone, error) in
            guard error == nil, let zone = zone else {
                print(error?.localizedDescription)
                return
            }
        }
        self.sharedDB.save(self.customZone) { (zone, error) in
            guard error == nil, let zone = zone else {
                print(error?.localizedDescription)
                return
            }
        }
    }
    
    private func getDatabase(of type: DBType) -> CKDatabase {
    
        switch type {
            case .publicDB:
                return self.publicDB
            case .privateDB:
                return self.privateDB
            case .sharedDB:
                return self.sharedDB
        }
    
    }
    
    func create(new model: Phrase) {
        save(model, in: .privateDB) { (record, error) in
            guard error == nil, let record = record else {
                print(error?.localizedDescription)
                return
            }
        }
    }
    
    func favorite(_ phrase: Phrase) {
        
    }
    
    func unfavorite(_ phrase: Phrase) {
        
    }
    
    func save(_ model: Phrase, in type: DBType, completionHandler: @escaping (CKRecord?, Error?) -> Void) {
        switch type {
        case .publicDB:
            save(model.toCKRecord(), in: type, completionHandler: completionHandler)
            break
        case .sharedDB:
            save(model.toCKRecord(with: self.customZone), in: type, completionHandler: completionHandler)
            break
        default:
            save(model.toCKRecord(with: self.customZone), in: type, completionHandler: completionHandler)
            break
        }
    }
    
    func save(_ record: CKRecord, in type: DBType, completionHandler: @escaping (CKRecord?, Error?) -> Void) {
        getDatabase(of: type).save(record, completionHandler: completionHandler)
    }
    
    func perform(_ query: CKQuery, inZoneWith zoneId: CKRecordZone.ID? = nil, in type: DBType, completionHandler: @escaping ([CKRecord]?, Error?) -> Void) {
        getDatabase(of: type).perform(query, inZoneWith: zoneId, completionHandler: completionHandler)
    }
    
    func fetch(with id: CKRecord.ID, in type: DBType, completionHandler: @escaping (CKRecord?, Error?) -> Void) {
        getDatabase(of: type).fetch(withRecordID: id, completionHandler: completionHandler)
    }
    
    func delete(with id: CKRecord.ID, in type: DBType, completionHandler: @escaping (CKRecord.ID?, Error?) -> Void) {
        getDatabase(of: type).delete(withRecordID: id, completionHandler: completionHandler)
    }
    
}


enum DBType {
    
    case publicDB
    case privateDB
    case sharedDB
    
}
