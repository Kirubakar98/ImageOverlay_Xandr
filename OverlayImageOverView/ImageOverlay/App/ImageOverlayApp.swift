//
//  ImageOverlayApp.swift
//  ImageOverlay
//
//  Created by Kirubakar Muruganandam on 09/24/22.
//

import SwiftUI

@main
struct ImageOverlayApp: App {
    
    @State private var image: UIImage?
    @State private var imagePostion: CGRect?
    @State private var inputView: UIView

    var body: some Scene {
        WindowGroup {
            ContentView( view: inputView, image: image, CGRect(x: imagePostion.x, y: imagePostion.y, width: image.width, height: image.height))
        }
    }
}
