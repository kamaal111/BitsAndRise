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
    @ObservedObject
    var viewModel: EntryViewModel

    var body: some View {
        HomeView(appsSearchText: $viewModel.appsSearchText,
                 apps: viewModel.filteredApps,
                 totalAppsCount: viewModel.apps?.paging.totalItemCount ?? 0)
    }
}

#if DEBUG
struct EntryContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EntryViewModel()
        viewModel.apps = BitriseApps.preview
        viewModel.profile = BitriseProfile.preview
        return NavigationView {
            EntryContentView(viewModel: viewModel)
                .navigationBarTitle(Text("BitsAndRise"))
        }
    }
}
#endif
