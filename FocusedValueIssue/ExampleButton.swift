//
//  ExampleButton.swift
//  FocusedValueIssue
//
//  Created by Gboyega Dada on 09/04/2024.
//

import SwiftUI

struct ExampleButton: View {
    @FocusedValue(\.focusedItem) private var focusedItem: String?
    
    var label: String = "Text"
    @Binding var title: String
    @Binding var message: String
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: { buttonAction() }) {
            Label(label, systemImage: "plus")
        }
    }
    
    func buttonAction() {
        title = focusedItem ?? "Oops!"
        message = "(\(label))"
        isPresented = true
    }
}

#Preview {
    ExampleButton(
        title: .constant("placeholder"),
        message: .constant("placeholder"),
        isPresented: .constant(false)
    )
}
