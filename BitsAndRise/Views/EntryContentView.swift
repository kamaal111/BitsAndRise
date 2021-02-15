//
//  EntryContentView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import SwiftUI
import BitriseSDK
import SalmonUI
import ShrimpExtensions

struct EntryContentView: View {
    @State private var tabSelection = 0

    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationView { AppsScreenView() }
                .tabItem({
                    Text("Apps")
                    Image(systemName: "rectangle.grid.2x2")
                })
                .tag(0)
        }
    }
}

#if DEBUG
struct EntryContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntryContentView()
    }
}
#endif
