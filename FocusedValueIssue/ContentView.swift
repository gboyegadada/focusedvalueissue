//
//  ContentView.swift
//  FocusedValueIssue
//
//  Created by Gboyega Dada on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var alertTitle: String = "No title"
    @State private var alertMessage: String = ""
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .toolbar {
                ToolbarItemGroup() {
                    ExampleButton(
                        label: "Outside menu",
                        title: $alertTitle,
                        message: $alertMessage,
                        isPresented: $isPresented
                    )
                    
                    Menu {
                        ExampleButton(
                            label: "Inside a menu",
                            title: $alertTitle,
                            message: $alertMessage,
                            isPresented: $isPresented
                        )
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                    }
                }
            }
            .focusedSceneValue(\.focusedItem, "Yes, it is I !")
            .alert(
                alertTitle,
                isPresented: $isPresented,
                presenting: alertMessage
            ) { _ in } message: { message in
                Text(message)
            }
        }
    }
}

#Preview {
    ContentView()
}


private struct FocusedItemKey: FocusedValueKey {
    typealias Value = String?
}

extension FocusedValues {
    var focusedItem: String? {
        get { self[FocusedItemKey.self] ?? nil }
        set { self[FocusedItemKey.self] = newValue }
    }
}
