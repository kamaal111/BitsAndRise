//
//  BuildItemView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 17/02/2021.
//

import SwiftUI
import BitriseSDK

struct BuildItemView: View {
    let build: BuildListAllResponseModel.BuildListAllResponseItemModel

    var body: some View {
        Text(build.repository.title)
    }
}

struct BuildItemView_Previews: PreviewProvider {
    static var previews: some View {
        BuildItemView(build: BuildListAllResponseModel.preview.data.first!)
    }
}
