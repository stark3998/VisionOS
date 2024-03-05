//
//  Page.swift
//  Trial
//
//  Created by Jatin Madan on 2/26/24.
//

import Foundation
import SwiftUI

enum Page: String, CaseIterable, Identifiable {
    
    case assignments
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .assignments: "Assignments"
        }
    }
    
    var symbolName: String {
        switch self {
        case .assignments:
            "textformat.size"
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch self {
        case .assignments:
            AssignmentView()
        }
    }
}
