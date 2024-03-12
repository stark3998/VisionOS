//
//  DetailsView.swift
//  Trial
//
//  Created by Jatin Madan on 3/1/24.
//

import SwiftUI
import WebKit

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.isOpaque = false
        uiView.backgroundColor = UIColor.clear
        uiView.scrollView.backgroundColor = UIColor.clear
        uiView.loadHTMLString("<div>"+htmlContent+"</div>", baseURL: nil)
    }
}

struct DetailsView: View {
    let assignment: Assignment
    
    var body: some View {
        VStack {
            Spacer(minLength: 10)
            Text("Hello, Jatin!")
            Spacer(minLength: 20)
            HStack {
                Spacer()
                VStack {
                    Text("Detail view for \(assignment.id)")
                        .font(.title)
                    HStack {
                        Spacer(minLength: 100)
                        if assignment.description != nil {
                            HTMLStringView(htmlContent: assignment.description!)
                        }
                        else {
                            HTMLStringView(htmlContent: "assignment.description!").background(Color.gray.opacity(0.5))
                        }
                        //            Text(assignment.description!)
                        //                .padding()
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer(minLength: 20)
        }
    }
}

#Preview {
//    DetailsView(item: Item(id: 0, name: "Jatin", description: "Jatin Madan Trial From View"))
    DetailsView(assignment: Assignment(id: "0", created_at: "Created At", due_at: "Due At", url: "URL", submission_url: "Submission URL", description: "Description"))
}
