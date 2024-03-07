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
    case files
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .assignments: "Assignments"
        case .files: "Files"
        }
    }
    
    var symbolName: String {
        switch self {
        case .assignments:
            "textformat.size"
        case .files:
            "filemenu.and.selection"
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch self {
        case .assignments:
            AssignmentView()
        case .files:
            FileView()
        }
    }
}
