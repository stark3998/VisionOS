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
    @StateObject var ass_obj = AssignmentObject()
    @State var immersionState: ImmersionStyle = .mixed
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ass_obj)
        }

        
        WindowGroup(id: "Assignment", for: Assignment.self) { assignment in
            DetailsView(assignment: assignment.wrappedValue!).environmentObject(ass_obj)
        }
        
        WindowGroup(id: "AssignmentNew", for: AssignmentN.self) { assignment in
            VStack {
                Spacer()
                AssignDetailView(assignment: assignment.wrappedValue!).environmentObject(ass_obj)
                Spacer()
            }
            
        }
        
        WindowGroup(id: "AssGPT") {
            VStack {
                Spacer()
                AssGPTView().environmentObject(ass_obj)
                Spacer()
            }
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

