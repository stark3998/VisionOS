//
//  ContentView.swift
//  Trial
//
//  Created by Jatin Madan on 1/8/24.
//
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @State var showSidebar: NavigationSplitViewVisibility = .doubleColumn
    @State var selectedPage: Page?
    
    var body: some View {
        NavigationSplitView(columnVisibility: $showSidebar) {
            List {
                ForEach(Page.allCases) { page in
                    Button {
                        selectedPage = page
                    } label: {
                        Label {
                            Text(page.title)
                        } icon: {
                            Image(systemName: page.symbolName)
                        }
                    }
                }
            }
            .navigationTitle("Pages")
            .onAppear {
                selectedPage = .assignments
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        if showSidebar == .doubleColumn {
                            showSidebar = .detailOnly
                        } else {
                            showSidebar = .doubleColumn
                        }
                    }) {
                        Text(showSidebar == .doubleColumn ? "Hide" : "Show")
                    }
                }
            }
            
        } detail: {
            if let selectedPage {
                selectedPage.content
                    .navigationTitle(selectedPage.title)
            }
        }
    }
//    var body: some View {
//        VStack {
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)
//
//            Text("Hello, world!")
//
//            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
//                .toggleStyle(.button)
//                .padding(.top, 50)
//        }
//        .padding()
//        .onChange(of: showImmersiveSpace) { _, newValue in
//            Task {
//                if newValue {
//                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
//                    case .opened:
//                        immersiveSpaceIsShown = true
//                    case .error, .userCancelled:
//                        fallthrough
//                    @unknown default:
//                        immersiveSpaceIsShown = false
//                        showImmersiveSpace = false
//                    }
//                } else if immersiveSpaceIsShown {
//                    await dismissImmersiveSpace()
//                    immersiveSpaceIsShown = false
//                }
//            }
//        }
//    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
