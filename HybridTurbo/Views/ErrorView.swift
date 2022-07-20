//
//  ErrorView.swift
//  HybridTurbo
//
//  Created by William Kennedy on 13/07/2022.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(height: 40)
            Text("Error loading page")
                .font(.title)
            Text(errorMessage)
        }
    }
}
