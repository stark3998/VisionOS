//
//  AssignmentView.swift
//  Trial
//
//  Created by Jatin Madan on 2/26/24.
//

import SwiftUI

//struct Item: Identifiable, Codable, Hashable {
//    var id: Int
//    var name: String
//    var description: String
//}
//
//struct LItem: Codable {
//    var assigns: [Item]
//}

struct Assignment: Identifiable, Codable, Hashable {
    var id: String
    var created_at: String?
    var due_at: String?
    var url: String?
    var submission_url: String?
    var description: String?
}

struct AssignmentView: View {
    @State var showSidebar: NavigationSplitViewVisibility = .doubleColumn
//    @State private var items: [Item] = []
//    @State private var litems: LItem = LItem(assigns: [])
    @State private var assignments: [Assignment] = []
    
    
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            Spacer(minLength: 10)
            Text("Hello, Jatin!")
            Spacer(minLength: 20)
            HStack {
                Spacer()
                VStack {
                        List(assignments) { assignment in
                        VStack(alignment: .leading) {
                            Button(action: {
                                // Handle text tap here
                                //                    List(litems.assigns) { item in
//                                openWindow(id: "Detail")
                                openWindow(value: assignment)
                                print("Text tapped for \(assignment.id)")
                            }) {
//                                VStack(alignment: .leading) 
                                HStack {
                                    Text(assignment.id)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    VStack {
                                        DisclosureGroup {
                                            HStack {
//                                                Spacer(minLength: 100)
                                                if assignment.description != nil {
                                                    HTMLStringView(htmlContent: assignment.description!)
                                                }
                                                else {
                                                    HTMLStringView(htmlContent: "assignment.description!")
                                                }
                                                //            Text(assignment.description!)
                                                //                .padding()
                                                Spacer()
                                            }
                                        } label: {
                                            HStack {
                                                Spacer()
                                                Text("Show Details")
                                            }
                                        }
                                    } // End VStack
                                    // Ensure text color matches the rest of the list
//                                    Text(assignment.description!)
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                    HStack {
//                                        Spacer(minLength: 100)
//                                        if assignment.description != nil {
//                                            HTMLStringView(htmlContent: assignment.description!)
//                                        }
//                                        else {
//                                            HTMLStringView(htmlContent: "assignment.description!")
//                                        }
//                                        //            Text(assignment.description!)
//                                        //                .padding()
//                                        Spacer()
//                                    }
                                } // End HStack
                            } // End Button
                        } // End VStack
                    } // End list
                    .navigationBarTitle("Items")
//                    .frame(maxWidth: .infinity)
                    Spacer()
                } // End VStack
                .onAppear(perform: loadData)
                Spacer()
            } // End HStack
            Spacer()
//            Button(action: showToolbar) {
//                Label("Show Toolbar", systemImage: "arrow.up")
//            }
//            Spacer()
        } // End VStack
    }
    
    func loadData() {
            // Find the file in the bundle
            if let fileURL = Bundle.main.url(forResource: "assignments", withExtension: "json") {
                print(fileURL)
                do {
                    // Load the data from the file
                    let data = try Data(contentsOf: fileURL)
                    // Decode the JSON data into an array of items
//                    let decodedData = try JSONDecoder().decode(LItem.self, from: data)
                    let decodedData = try JSONDecoder().decode([Assignment].self, from: data)
                    // Update the items array with the decoded data
                    self.assignments = decodedData
                } catch {
                    print("Error loading JSON data: \(error)")
                    print("Error loading JSON data: \(error.localizedDescription)")
                }
            } else {
                print("Couldn't find assignments.json in the bundle.")
            }
        }
    
//    func openDetailWindow(item: Item) {
//            let activity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
//            activity.userInfo = ["itemID": item.id] // Pass necessary information here
//            UIApplication.shared.requestSceneSessionActivation(nil, userActivity: activity, options: nil, errorHandler: nil)
//        }
    
    func showToolbar() {
        showSidebar = .doubleColumn
    }
}

#Preview {
    AssignmentView()
}
