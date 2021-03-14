//
//  ViewController.swift
//  Gradient
//
//  Created by worker on 15.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createGradientLayer()
    }

    func createGradientLayer() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            // https://webgradients.com/ colors
            let firstColor = UIColor(hexString: "#330867")
            let secondColor = UIColor(hexString: "#30cfd0")
            gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
            self.view.layer.addSublayer(gradientLayer)
        }
}

extension UIColor {

    convenience init(hexString: String) {
            let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int = UInt64()
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
}

