//
//  QRCodeView.swift
//  QRGenerator-SwiftUI
//
//  Created by Ali Pishvaee on 5/14/20.
//  Copyright © 2020 AliPishvaee. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
struct QRCodeView: View {
    
    var context = CIContext()
    var filter = CIFilter.qrCodeGenerator()
    var url: String
    
    var body: some View {
        Image(uiImage: generateQRImage(url))
            .interpolation(.none)
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
    }
    
    func generateQRImage( _ url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(url: "www.alipishvaee.com")
    }
}
