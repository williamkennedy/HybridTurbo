//
//  NumbersViewController.swift
//  HybridTurbo
//
//  Created by William Kennedy on 13/07/2022.
//

import SwiftUI
import UIKit

class NumbersViewController: UIHostingController<NumbersView> {
    init() {
        super.init(rootView: NumbersView())
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct NumbersView: View {
    private let numbers = 1 ... 10

    var body: some View {
        List(numbers, id: \.self) { number in
            Text(String(number))
        }
        .navigationTitle("Hello")
    }
}

struct NumbersView_Preview: PreviewProvider {
    static var previews: some View {
        NumbersView()
    }
}
