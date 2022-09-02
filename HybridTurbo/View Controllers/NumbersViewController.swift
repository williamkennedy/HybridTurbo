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
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
  
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
            }
            .navigationTitle("Hello")
        }
    }
}

struct NumbersView_Preview: PreviewProvider {
    static var previews: some View {
        NumbersView()
    }
}
