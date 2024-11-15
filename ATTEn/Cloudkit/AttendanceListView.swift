//
//  AttendanceListView.swift
//  ATTEn
//
//  Created by AB on 11/15/24.
//

import SwiftUI

struct AttendanceListView: View {
    @State private var attendanceRecords: [AttendanceRecord] = []
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            List(attendanceRecords, id: \.id) { record in
                VStack(alignment: .leading) {
                    Text(record.studentName)
                        .font(.headline)
                    Text(record.date, style: .date)
                        .font(.subheadline)
                    Text("Status: \(record.status)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Attendance Records")
            .onAppear(perform: loadAttendanceRecords)
        }
    }

    func loadAttendanceRecords() {
        isLoading = true
        CloudKitManager.shared.fetchRecords(recordType: AttendanceRecord.recordType) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let records):
                    attendanceRecords = records.map { AttendanceRecord(record: $0) }
                case .failure(let error):
                    print("Error fetching records: \(error)")
                }
            }
        }
    }
}
