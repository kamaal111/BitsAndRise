//
//  AppsSection.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 15/02/2021.
//

import SwiftUI
import BitriseSDK
import SalmonUI
import ShrimpExtensions

struct AppsSection: View {
    let apps: [AppResponseItemModel]
    let totalAppsCount: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("Showing \(apps.count)/\(totalAppsCount) apps")
                .foregroundColor(.secondary)
                .padding(.top, 8)
            VStack(alignment: .leading) {
                ForEach(apps, id: \.self) { (app: AppResponseItemModel) in
                    VStack {
                        Divider()
                        AppItemView(app: app)
                    }
                }
                .transition(.move(edge: .trailing))
                .animation(.default)
                Divider()
            }
            .padding(.vertical, 8)
        }
    }
}

struct AppsSection_Previews: PreviewProvider {
    static var previews: some View {
        let previewApps = AppListResponseModel.preview
        return AppsSection(apps: previewApps.data, totalAppsCount: previewApps.paging.totalItemCount)
    }
}
