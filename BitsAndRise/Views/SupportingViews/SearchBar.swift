//
//  SearchBar.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import SwiftUI

public struct SearchBar: View {
    @State private var isSearching = false

    @Binding var searchText: String

    public let placeHolder: String

    public init(searchText: Binding<String>, placeHolder: String) {
        self._searchText = searchText
        self.placeHolder = placeHolder
    }

    public var body: some View {
        HStack {
            TextField(placeHolder,
                      text: $searchText,
                      onEditingChanged: onEditingChanged(_:))
                .padding(.leading, 24)
                .padding(.all, 16)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        if isSearching && !searchText.isEmpty {
                            clearButton()
                        }
                    }
                    .padding(.horizontal, 16)
                    .foregroundColor(.gray)
                )
            if isSearching {
                cancelButton()
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut)
            }
        }
    }

    private func clearButton() -> some View {
        Button(action: { withAnimation { searchText = "" } }) {
            Image(systemName: "xmark.circle.fill")
                .padding(.vertical)
        }
    }

    private func cancelButton() -> some View {
        Button(action: {
            withAnimation {
                isSearching = false
                searchText = ""
            }
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }) {
            Text("Cancel")
        }
    }

    private func onEditingChanged(_ editing: Bool) {
        withAnimation { isSearching = editing }
    }
}

#if DEBUG
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("1"), placeHolder: "Search stuff")
    }
}
#endif
