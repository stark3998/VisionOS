//
//  AssignDetailView.swift
//  Trial
//
//  Created by Jatin Madan on 3/11/24.
//

import SwiftUI

class AssignmentObject: ObservableObject {
    @Published var assignment_one_line = ""
    @Published var sunmmary = ""
    func updateVal(x: String, y: String) {
        self.assignment_one_line = x
        self.sunmmary = y
    }
}

struct AssignDetailView: View {
    let assignment: AssignmentN
    @Environment(\.openWindow) var openWindow
    @EnvironmentObject var ass_detail1: AssignmentObject
    
    
    var body: some View {        VStack {
            Spacer(minLength: 10)
            Text("Hello, Jatin!")
            Spacer(minLength: 20)
            HStack {
                Spacer()
                VStack {
                    Text("Detail view for \(assignment.id)")
                    Text("Name : \(assignment.name!)")
                        .font(.title)
                    HStack {
                        Spacer(minLength: 100)
                        if assignment.description != nil {
                            HTMLStringView(htmlContent: assignment.description!)
                        }
                        else {
                            HTMLStringView(htmlContent: "assignment.description!").background(Color.gray.opacity(0.5))
                        }
                        Spacer()
                    }
                    Spacer()
                    Text("Due At : \(assignment.due_at!)")
                    Text("Created At : \(assignment.created_at!)")
                    Text("Points Possible : \(assignment.points_possible!)")
                    Text("Submission URL : \(assignment.submission_url!)")
                }
                Spacer()
            }.onAppear {
                ass_detail1.updateVal(x: assignment.one_line_summary ?? "Default One Line", y: assignment.sunmmary ?? "Default Summary")
                openWindow(id: "AssGPT")
            }

            Spacer(minLength: 20)
        }
    }
}

#Preview {
    AssignDetailView(assignment: AssignmentN(id: 0, name: "Assignment Name", created_at: "Created At", description: "Description", one_line_summary: "One Line Summary", points_possible: 0))
}
