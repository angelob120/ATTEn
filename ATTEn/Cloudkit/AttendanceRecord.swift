//
//  AttendanceRecord.swift
//  ATTEn
//
//  Created by AB on 11/15/24.
//

import CloudKit

struct AttendanceRecord {
    static let recordType = "AttendanceRecord"

    let id: CKRecord.ID
    let studentName: String
    let date: Date
    let status: String

    init(record: CKRecord) {
        self.id = record.recordID
        self.studentName = record["studentName"] as? String ?? ""
        self.date = record["date"] as? Date ?? Date()
        self.status = record["status"] as? String ?? "Absent"
    }

    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: AttendanceRecord.recordType)
        record["studentName"] = studentName as CKRecordValue
        record["date"] = date as CKRecordValue
        record["status"] = status as CKRecordValue
        return record
    }
}
