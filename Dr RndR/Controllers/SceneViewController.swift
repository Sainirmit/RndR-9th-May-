//
//  ARViewController.swift
//  Dr RndR
//
//  Created by Sai Nirmit on 01/05/24.
//

import UIKit
import SceneKit

class SceneViewController: UIViewController {

    @IBOutlet weak var arView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func load3DModelFromAsset(){
        
        let scene = SCNScene(named: "Room.usdz")
        //let scene = SCNScene(named:"")
        
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x:0, y:10, z:35)
        scene?.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        
        /* let camera = SCNCamera()
        camera.fieldOfView = 50
        camera.zFar = 100000
        
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0, z: 0)
        node.camera = camera
        
        scene?.rootNode.addChildNode(node) */
        scene?.rootNode.addChildNode(ambientLightNode)
        
        arView.allowsCameraControl = true
        
        arView.backgroundColor = UIColor.white
        
        arView.cameraControlConfiguration.allowsTranslation = false
        
        arView.scene = scene
    }
}


