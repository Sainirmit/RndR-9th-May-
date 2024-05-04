import UIKit
import SceneKit

class DisplayModelViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    var modelURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let modelURL = modelURL {
            print("File path to print: \(modelURL)")
            var val = FileManager.default.fileExists(atPath: modelURL.absoluteString)
            print(val)
            displayModel(from: modelURL)
            
        } else {
            print("No model URL provided.")
        }
    }
    
    func displayModel(from url: URL) {
        do {
            print("inside the display func")
            let scene = try SCNScene(url: url)
            sceneView.scene = scene
            // Add lighting to the scene
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .omni
            lightNode.position = SCNVector3(x: 0, y: 10, z: 20)
            scene.rootNode.addChildNode(lightNode)
            
            let ambientLightNode = SCNNode()
            ambientLightNode.light = SCNLight()
            ambientLightNode.light?.type = .ambient
            ambientLightNode.light?.color = UIColor.darkGray
            scene.rootNode.addChildNode(ambientLightNode)
            
            // Set up the scene view
            sceneView.scene = scene
            sceneView.allowsCameraControl = true
            sceneView.backgroundColor = UIColor.black
            sceneView.cameraControlConfiguration.allowsTranslation = false
        } catch {
            print("Error loading scene: \(error.localizedDescription)")
        }
    }
}
