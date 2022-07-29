//
//  ARView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 26/07/22.
//

import SwiftUI
import ARKit

class ARCoordinator: NSObject, ARSCNViewDelegate {
    
}

struct ARView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let sceneView = ARSCNView()
        sceneView.showsStatistics = true
        sceneView.delegate = context.coordinator
        
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        return sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeCoordinator() -> ARCoordinator {
        ARCoordinator()
    }
    
}

struct Objects3DView: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "E189B0"))
            
            VStack(alignment: .center, spacing: 10) {
                ARView()
            }
            .navigationTitle("3D Objects")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        Objects3DView()
    }
}
