//
//  BuildsSection.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 17/02/2021.
//

import SwiftUI
import BitriseSDK

struct BuildsSection: View {
    let builds: [BuildListAllResponseModel.BuildListAllResponseItemModel]
    let totalBuildsCount: Int

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                ForEach(builds, id: \.self) { (build: BuildListAllResponseModel.BuildListAllResponseItemModel) in
                    VStack {
                        Divider()
                        BuildItemView(build: build)
                    }
                }
                .transition(.move(edge: .trailing))
                .animation(.default)
                .padding(.bottom, 2)
                Divider()
            }
            .padding(.vertical, 8)
        }
    }
}

struct BuildsSection_Previews: PreviewProvider {
    static var previews: some View {
        let buildsPreview = BuildListAllResponseModel.preview
        return BuildsSection(builds: buildsPreview.data, totalBuildsCount: buildsPreview.paging.totalItemCount)
    }
}
