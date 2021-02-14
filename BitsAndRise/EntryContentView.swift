//
//  EntryContentView.swift
//  BitsAndRise
//
//  Created by Kamaal M Farah on 13/02/2021.
//

import SwiftUI

struct EntryContentView: View {
    @ObservedObject
    var viewModel: EntryViewModel

    var body: some View {
        Text(viewModel.profile?.username ?? "")
    }
}

struct EntryContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntryContentView(viewModel: EntryViewModel())
    }
}
