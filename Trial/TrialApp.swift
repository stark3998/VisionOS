//
//  TrialApp.swift
//  Trial
//
//  Created by Jatin Madan on 1/8/24.
//

import SwiftUI

@main
struct TrialApp: App {
    @StateObject var toggleManager = ToggleManager()
    @State var immersionState: ImmersionStyle = .mixed
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
//        WindowGroup(id: "Detail") {
//            DetailsView(item: Item(id: 0, name: "Jatin", description: "Jatin Madan"))
//        }
        
//        WindowGroup(id: "Detail1", for: Item.self) { assignment in
//            DetailsView(item: assignment.wrappedValue!)
//        }
        
        WindowGroup(id: "Assignment", for: Assignment.self) { assignment in
            DetailsView(assignment: assignment.wrappedValue!)
        }
        
//        .handlesExternalEvents(matching: Set(arrayLiteral: NSUserActivityTypeBrowsingWeb))
        
//        WindowGroup(for: Item.self) { item in
//            VStack {
//                Spacer()
//                
//                DetailsView(item: item.wrappedValue!)
//            }
//            .onAppear {
//                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
//                    return
//                }
//                windowScene.requestGeometryUpdate(.Vision(resizingRestrictions: UIWindowScene.ResizingRestrictions.none))
//            }
//        }
        

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}

class ToggleManager: ObservableObject {
    @Published var oneToggled = false
}

