//
//  ImageOverlay.swift
//  Add An Image as overlay to a view
//
//  Created by Kirubakar Muruganandam on 09/24/22.
//

import SwiftUI

struct ImageOverlay: View {
    @State private var rectPosition = CGPoint(x: 200, y: 200)
    
    @State private var cutout: UIImage?
    let image: UIImage = UIImage(named: "lyon")!
    let inputView: UIView
    let frameSide: CGFloat = 250
    var body: some View {
        
        Image(uiImage: cutout ?? image)
            .frame(width: frameSide, height: frameSide)
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 0, style: .continuous).stroke(Color.black, lineWidth: 1))
            .onAppear(perform: {
                processImage()
            })
            .position(rectPosition)
            .gesture(DragGesture().onChanged({ value in
                self.rectPosition = value.location
                processImage()
            }))
        
    }
    
    func processImage() {
        
        cutout = croppedImage(from: inputView, croppedTo: CGRect(x: rectPosition.x, y: rectPosition.y, width: frameSide, height: frameSide))
    }
}

func croppedImage(from image: UIImage, croppedTo rect: CGRect) -> UIImage {
    
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    let drawRect = CGRect(x: -rect.origin.x, y: -rect.origin.y, width: image.size.width, height: image.size.height)
    
    context?.clip(to: CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
    
    image.resizable()
    image.aspectRatio(contentMode: .fit)
    image.draw(in: drawRect)
    
    let subImage = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    return subImage!
}


struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay(image: UIImage(named: "lyon")!)
    }
}
