//
//  ContentView.swift
//  QRGenerator-SwiftUI
//
//  Created by Ali Pishvaee on 5/14/20.
//  Copyright © 2020 AliPishvaee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var qrInput = ""
    var body: some View {
        VStack {
            QRCodeView(url: qrInput)
            TextField("Enter your input here", text: $qrInput)
            .font(Font.system(size: 15, weight: .medium, design: .serif))
                .frame(width: 300, height: 50, alignment: .center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.bottom, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
