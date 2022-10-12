//
//  NSColor+Extension.swift
//  geshi
//
//  Created by 徐文杰 on 2022/8/18.
//

import Foundation
import Cocoa

extension String {
    func conformsTo(_ pattern: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}

extension NSColor {

    public class var mainBlue: NSColor {
        return .init(hex: 0x1A85FF)
    }

    public class var mainRed: NSColor {
        return .init(hex: 0xFF524D)
    }

    public class var mainBlueInside: NSColor {
        return .init(hex: 0x0D7EFF)
    }

    public class var mainBluePress: NSColor {
        return .init(hex: 0x0576F7)
    }

    public class var titleBarGray: NSColor {
        return .init(hex: 0xF0F2F5)
    }

    public class var lineGray: NSColor {
        return .init(hex: 0xF0F2F5)
    }

    public class var sideMenuGray: NSColor {
        return .init(hex: 0xFAFBFC)
    }

    public class var alphaBlack: NSColor {
        return .init(hex: 0x000000, alpha: 0.3)
    }

    public class var labelBlack: NSColor {
        return .init(hex: 0x000000, alpha: 0.85)
    }

    public class var splitLineGray: NSColor {
        return .init(hex: 0xE7E9EC)
    }

    public class var iconGray: NSColor {
        return .init(hex: 0x6C6C6C)
    }

    public class var mainBlueBG: NSColor {
        return .init(hex: 0xEBF5FE)
    }

    public class var tagBlue: NSColor {
        return .init(hex: 0xBFDDFF)
    }

    public class var goldProgress: NSColor {
        return .init(hex: 0xAC864B)
    }

    convenience init(hex: Int, alpha: CGFloat = 1) {
        self.init(
            calibratedRed: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
            blue: CGFloat((hex & 0xFF)) / 255.0,
            alpha: alpha
        )
    }

    convenience init(hex: String, alpha: CGFloat = 1) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
