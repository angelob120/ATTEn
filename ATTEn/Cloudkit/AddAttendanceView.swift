//
//  AddAttendanceView.swift
//  ATTEn
//
//  Created by AB on 11/15/24.
//

//import SwiftUI
//
//struct AddAttendanceView: View {
//    @State private var studentName = ""
//    @State private var attendanceDate = Date()
//    @State private var status = "Present"
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        Form {
//            Section(header: Text("Student Info")) {
//                TextField("Student Name", text: $studentName)
//                DatePicker("Date", selection: $attendanceDate, displayedComponents: .date)
//                Picker("Status", selection: $status) {
//                    Text("Present").tag("Present")
//                    Text("Absent").tag("Absent")
//                }
//            }
//
//            Button(action: saveAttendance) {
//                Text("Save Attendance")
//            }
//        }
//        .navigationTitle("Add Attendance")
//    }
//
//    func saveAttendance() {
//        let record = CKRecord(recordType: AttendanceRecord.recordType)
//        record["studentName"] = studentName as CKRecordValue
//        record["date"] = attendanceDate as CKRecordValue
//        record["status"] = status as CKRecordValue
//
//        CloudKitManager.shared.saveRecord(record: record) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success:
//                    presentationMode.wrappedValue.dismiss()
//                case .failure(let error):
//                    print("Error saving record: \(error)")
//                }
//            }
//        }
//    }
//}
