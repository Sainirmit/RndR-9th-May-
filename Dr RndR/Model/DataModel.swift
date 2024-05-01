import Foundation

// Define a struct to represent a 3D model scanned with Room Plan Kit
struct ScannedModel: Codable {
    let modelName: String // Name of the model
    let filePath: URL // File path to the USDZ file
    // You can add more properties specific to the scanned model
}


// Define a class to manage scanned models
class ScannedModelManager {
    var scannedModels: [ScannedModel] = []
    
    // Add a method to add a scanned model
    func addScannedModel(modelName: String, filePath: URL) {
        let scannedModel = ScannedModel(modelName: modelName, filePath: filePath)
        scannedModels.append(scannedModel)
        saveScannedModels()
    }
    
    // Add a method to retrieve all scanned models
    func getAllScannedModels() -> [ScannedModel] {
        loadScannedModels()
        return scannedModels
    }
    
    // Add more methods as needed, like deleting, updating, or retrieving individual models
    
    // Save scannedModels to UserDefaults
    private func saveScannedModels() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(scannedModels) {
            UserDefaults.standard.set(encodedData, forKey: "ScannedModels")
        }
    }
    
    // Load scannedModels from UserDefaults
    private func loadScannedModels() {
        if let savedData = UserDefaults.standard.data(forKey: "ScannedModels") {
            let decoder = JSONDecoder()
            if let loadedModels = try? decoder.decode([ScannedModel].self, from: savedData) {
                scannedModels = loadedModels
            }
        }
    }
}

let filePath = URL(fileURLWithPath: "///private/var/mobile/Containers/Data/Application/479B16F1-198E-4F79-BBAC-5B72185C746B/tmp/Export/Room_20240503_224239.usdz")
let anmd: () = ScannedModelManager().addScannedModel(modelName: "bedroom", filePath: filePath)
