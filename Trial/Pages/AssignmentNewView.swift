//
//  AssignmentNewView.swift
//  Trial
//
//  Created by Jatin Madan on 3/11/24.
//

import SwiftUI

struct AssignmentNewView: View {
    @State private var courses = CourseObj(courses: [])
    @State var showSidebar: NavigationSplitViewVisibility = .doubleColumn
    @Environment(\.openWindow) var openWindow
    var body: some View {
        VStack {
            Spacer(minLength: 10)
            Text("Hello, Jatin!")
            Spacer(minLength: 20)
            HStack {
                List(courses.courses) { course in
                    DisclosureGroup {
                        if(course.assignments.pending.count > 0) {
                            getTable(assignment: course.assignments.pending, ass_type: "Pending")
                            
                        }
                        if(course.assignments.completed.count > 0) {
                            getTable(assignment: course.assignments.completed, ass_type: "Completed")
                        }
                        
                    } label: {
                        Text(String(course.id) + " - " + String(course.name!)).font(.headline).foregroundColor(.primary)
                    }
                }
            }.onAppear(perform: loadData)
        }
    }
    
    @ViewBuilder func getTable(assignment: [AssignmentN], ass_type: String) -> some View {
        Text("\(ass_type) Assignments")
//        VStack {
//            Table(assignment) {
//                TableColumn("Name", value: \.name!)
//                TableColumn("Due Date", value: \.due_at!)
//            }
//        }.frame(
//            minWidth: 0,
//            maxWidth: .infinity,
//            minHeight: 500,
//            maxHeight: .infinity,
//            alignment: .topLeading
//          )
        VStack {
            List(assignment) { assn in
                Button(action: {
                    print("Text tapped for \(assn.id)")
                }) {
                    Text(String(assn.id) + " - " + String(assn.name!))
                        .font(.headline)
                        .foregroundColor(.primary).onTapGesture {
                            openWindow(value: assn)
                            print("Text tapped for \(assn.id)")
                        }
                }
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 500,
            maxHeight: .infinity
          )
    }
    
    func loadData() {
            if let fileURL = Bundle.main.url(forResource: "assn", withExtension: "json") {
                print(fileURL)
                do {
                    let data = try Data(contentsOf: fileURL)
                    let decodedData = try JSONDecoder().decode(CourseObj.self, from: data)
                    self.courses = decodedData
                } catch {
                    print("Error loading JSON data: \(error)")
                    print("Error loading JSON data: \(error.localizedDescription)")
                }
            } else {
                print("Couldn't find assignments.json in the bundle.")
            }
        }
}

#Preview {
    AssignmentNewView()
}
