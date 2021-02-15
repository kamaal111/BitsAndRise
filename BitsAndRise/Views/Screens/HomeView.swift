//
//  HomeView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import SwiftUI
import BitriseSDK

struct HomeView: View {
    @Binding var appsSearchText: String

    let apps: [BitriseApps.App]
    let totalAppsCount: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("Apps")
                .font(.headline)
            SearchBar(searchText: $appsSearchText, placeHolder: "")
                .padding(.top, 8)
            AppsSection(apps: apps, totalAppsCount: totalAppsCount)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let previewApps = BitriseApps.preview
        return HomeView(appsSearchText: .constant(""),
                        apps: previewApps.data,
                        totalAppsCount: previewApps.paging.totalItemCount)
    }
}
