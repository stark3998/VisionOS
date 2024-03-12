//
//  AssignmentNew.swift
//  Trial
//
//  Created by Jatin Madan on 3/11/24.
//

import SwiftUI

struct AssignmentN: Identifiable, Codable, Hashable {
    var id: Int
    var name: String?
    var created_at: String?
    var due_at: String?
    var url: String?
    var description: String?
    var sunmmary: String?
    var one_line_summary: String?
    var submission_url: String?
    var points_possible: Int?
}

struct AssignmentsN: Codable, Hashable {
    var pending: [AssignmentN]
    var completed: [AssignmentN]
}

struct CourseN: Identifiable, Codable, Hashable {
    var id: Int
    var name: String?
    var assignments: AssignmentsN
}

struct CourseObj: Codable, Hashable {
    var courses: [CourseN]
}


struct CourseView: View {
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
                    Button(action: {
                        // Handle text tap here
                        //                    List(litems.assigns) { item in
//                                openWindow(id: "Detail")
//                        openWindow(value: course)
                        print("Text tapped for \(course.id)")
                    }) {
                            Text(String(course.id) + " - " + String(course.name!))
                                .font(.headline)
                                .foregroundColor(.primary)
                    }
                }
            }.onAppear(perform: loadData)
        }
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
    CourseView()
}
