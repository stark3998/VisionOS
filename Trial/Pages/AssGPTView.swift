//
//  AssGPTView.swift
//  Trial
//
//  Created by Jatin Madan on 3/13/24.
//

import SwiftUI

struct AssGPTView: View {
    @EnvironmentObject var ass_detail1: AssignmentObject
    var body: some View {
        VStack {
            Text("Hello, Jatin!")
            Text("One Line Summary")
            if (ass_detail1.assignment_one_line).isEmpty {
                Text("Summary")
            }
            else {
                Text(ass_detail1.assignment_one_line)
            }
            Text("Assignment Summary")
            if (ass_detail1.sunmmary).isEmpty {
                Text("Summary")
            }
            else {
                Text(ass_detail1.sunmmary)
            }
        }
    }
}

#Preview {
    AssGPTView()
}
