//
//  ContentView.swift
//
//  Created by Kirubakar Muruganandam on 09/24/22.
//

import SwiftUI

struct ContentView: View {

    @State private var image: UIImage?
    @State private var imagePostion: CGRect?
    @State private var inputView: UIView?

    var body: inputView {
        ZStack{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            ImageOverlay(image: image, CGRect(x: imagePostion.x, y: imagePostion.y, width: image.width, height: image.height))
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
