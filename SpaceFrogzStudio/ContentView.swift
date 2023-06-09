//
//  ContentView.swift
//  SpaceFrogzStudio
//
//  Created by Horea Crisan on 09.06.2023.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadSphere()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

//import SwiftUI
//import ARKit
//
//struct ContentView: View {
//    var body: some View {
//        ARViewContainer().edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//    func makeUIView(context: Context) -> ARSCNView {
//        let arView = ARSCNView()
//
//        // Load reference images from the "AR Resources" group in the asset catalog
//        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
//            fatalError("Missing expected asset catalog resources.")
//        }
//
//        // Configure ARWorldTrackingConfiguration with reference images
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.detectionImages = referenceImages
//
//        // Run AR session with configuration and options
//        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
//
//        arView.delegate = context.coordinator
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARSCNView, context: Context) {}
//
//    func makeCoordinator() -> ARViewCoordinator {
//        ARViewCoordinator()
//    }
//}
//
//class ARViewCoordinator: NSObject, ARSCNViewDelegate {
//    private var parentNode: SCNNode? // Store a reference to the parent node
//    private var modelNode: SCNNode? // Store a reference to the model node
//
//    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
//        guard let imageAnchor = anchor as? ARImageAnchor else { return nil }
//
//        // Log that the image was detected
//        print("Image detected: \(imageAnchor.referenceImage.name ?? "")")
//
//        if parentNode == nil {
//            parentNode = SCNNode() // Create a parent node
//        }
//
//        if modelNode == nil {
//            guard let modelURL = Bundle.main.url(forResource: "Flower", withExtension: "usdz") else {
//                fatalError("Failed to find model file.")
//            }
//            let modelScene = try! SCNScene(url: modelURL, options: nil)
//            modelNode = modelScene.rootNode
//
//            // Scale the model to the desired size
//            let scaleFactor: Float = 0.0001 // Adjust the scale factor as needed
//            modelNode?.scale = SCNVector3(scaleFactor, scaleFactor, scaleFactor)
//
//            // Add the model node to the parent node
//            parentNode?.addChildNode(modelNode!)
//        }
//
//        // Update the position of the parent node
//        parentNode?.position = SCNVector3(imageAnchor.transform.columns.3.x,
//                                          imageAnchor.transform.columns.3.y,
//                                          imageAnchor.transform.columns.3.z)
//
//        return parentNode
//    }
//}
//
//
//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
