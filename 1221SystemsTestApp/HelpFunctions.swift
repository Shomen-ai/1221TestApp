import CoreImage
import UIKit

struct HelpFunctions {
    
    static let shared = HelpFunctions()
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: .utf8)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10) // Масштабируем QR-код
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func generateRandomPastelColor() -> UIColor {
        let hue = CGFloat(arc4random_uniform(256)) / 256.0
        let saturation = (CGFloat(arc4random_uniform(128)) / 256.0) + 0.5
        let brightness = (CGFloat(arc4random_uniform(128)) / 256.0) + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
