//
//  CloudKitManager.swift
//  ATTEn
//
//  Created by AB on 11/15/24.
//

import CloudKit

class CloudKitManager {
    static let shared = CloudKitManager()
    private let container = CKContainer.default()
    private let publicDatabase = CKContainer.default().publicCloudDatabase

    func saveRecord(record: CKRecord, completion: @escaping (Result<CKRecord, Error>) -> Void) {
        publicDatabase.save(record) { savedRecord, error in
            if let error = error {
                completion(.failure(error))
            } else if let savedRecord = savedRecord {
                completion(.success(savedRecord))
            }
        }
    }

    func fetchRecords(recordType: String, completion: @escaping (Result<[CKRecord], Error>) -> Void) {
        let query = CKQuery(recordType: recordType, predicate: NSPredicate(value: true))
        publicDatabase.perform(query, inZoneWith: nil) { records, error in
            if let error = error {
                completion(.failure(error))
            } else if let records = records {
                completion(.success(records))
            }
        }
    }

    func deleteRecord(recordID: CKRecord.ID, completion: @escaping (Result<Void, Error>) -> Void) {
        publicDatabase.delete(withRecordID: recordID) { _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
