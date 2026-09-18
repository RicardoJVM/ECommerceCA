//
//  ContentView.swift
//  ECommerceCA
//
//  Created by Ricardo Valencia on 18/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CartFactory.makeCartView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
