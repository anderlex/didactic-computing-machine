//
//  ColorGenerator.swift
//  iosSchool_HH
//
//  Created by student on 23.10.2023.
//

import Foundation
import UIKit

struct Color {
    var alpha: Brightness
    let red: Double
    let green: Double
    let blue: Double

    func description() {
        print("R: \(red), alpha: \(alpha.rawValue)")
    }

    init(red: Double, green: Double, blue: Double) {
        self.alpha = .dim
        self.red = red
        self.green = green
        self.blue = blue
    }
}

protocol ColorGeneratorProtocol {
    var alpha: Double { get set }
    var colorCodes: [Double] { get }

    func createColor() -> UIColor

    init(alpha: Double)
}

extension ColorGeneratorProtocol {
    func createColor() -> UIColor {
        return UIColor()
    }
}

class ColorGenerator: ColorGeneratorProtocol {
    var alpha: Double
    var colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
    let whiteColor: UIColor = .white

    required init(alpha: Double) {
        self.alpha = alpha
    }

    func changeColorCodes(completion: ([Double]) -> Void) {
        completion([])
    }

    func changeColor(completion: () -> [Double]) {
        print(completion())
    }

    func test() {
        changeColorCodes { [weak self] newColorCodes in
            self?.colorCodes = newColorCodes
        }

        changeColor { [weak self] in
            guard let self else {
                return []
            }
            self.colorCodes = [0, 1, 2, 3]
            return self.colorCodes
        }
    }

    func convertToArray<T>(element: T) -> [T] {
        [element]
    }

//    func printAlphaLong<T>(generator: T) where T: ColorGeneratorProtocol {
//        print(generator.alpha)
//    }

    func printAlpha<T: ColorGeneratorProtocol>(generator: T) {
        print(generator.alpha)
    }

    func printAnyAlpha(generator: Any) {
        let gen = generator as? ColorGeneratorProtocol

        guard let generator = generator as? ColorGeneratorProtocol else {
            return
        }
        print(generator.alpha)
    }
}

enum Brightness: Double {
    case dim = 0.1
    case average = 0.5
    case bright = 1.0

    func description() -> String {
        switch self {
        case .dim:
            return "Тусклый"
        case .average:
            return "Средний"
        case .bright:
            return "Яркий"
        }
    }
}

class Palette<CustomColor> {
    let colors: [CustomColor]

    init(colors: [CustomColor]) {
        self.colors = colors
    }
}
