//
//  FileView.swift
//  Trial
//
//  Created by Jatin Madan on 2/26/24.
//

import SwiftUI

struct File: Identifiable, Codable, Hashable{
    var id: String
    var created_at: String
    var due_at: String
    var description: String
    var submission_url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "url"
        case created_at
        case due_at
        case description
        case submission_url
    }
}

struct FileView: View {
    @State private var files: [File] = []
    var body: some View {
        VStack {
            Spacer(minLength: 10)
            Text("Hello, Jatin!")
            Spacer(minLength: 20)
            HStack {
                Spacer()
                VStack {
                    List(files) { file in
                        VStack(alignment: .leading) {
                            Text(String(file.id).split(separator: "/").last ?? "Default ID")
                                .font(.headline)
                                .foregroundColor(.primary)
                            VStack {
                                DisclosureGroup {
                                        if file.description != "" {
//                                            Text(file.description)
                                            HTMLStringView(htmlContent: file.description).frame(minHeight: 200,
                                                                                                maxHeight: .infinity)
                                        }
                                        else {
                                            HTMLStringView(htmlContent: "assignment.description!")
                                        }
                                    Text("URL: \(file.id)")
                                    Text("Due Date: \(file.due_at)")
                                    Text("Submission URL: \(file.submission_url)")
                                    
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text("Show Details")
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }.onAppear(perform: {
                loadData()
            })
        }
        
    }
    
    func loadData() {
            if let fileURL = Bundle.main.url(forResource: "file", withExtension: "json") {
                print(fileURL)
                do {
                    let data = try Data(contentsOf: fileURL)
                    let decodedData = try JSONDecoder().decode([File].self, from: data)
                    self.files = decodedData
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
    FileView()
}
