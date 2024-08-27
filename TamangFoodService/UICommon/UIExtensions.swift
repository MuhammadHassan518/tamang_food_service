//
//  UIExtensions.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 31/07/2024.
//

import Foundation
import SwiftUI

enum Poppins: String {
    case black = "Poppins-Black"
    case blackItalic = "Poppins-BlackItalic"
    case bold = "Poppins-Bold"
    case extraBold = "Poppins-ExtraBold"
    case extralight = "Poppins-ExtraLight"
    case italic = "Poppins-Italic"
    case light = "Poppins-Light"
    case medium = "Poppins-Medium"
    case regular = "Poppins-Regular"
    case semiBold = "Poppins-SemiBold"
}

enum YuGothic: String {
    case light = "YuGothic-Light"
    case regular = "YuGothicRegular"
    case semiBold = "YuGothicUI-SemiBold"
}

enum faBrands: String {
    case regular = "fa-brands-400"
}

extension Font {
    static func customPoppinsfont(_ font: Poppins, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
    
    static func customYuGothicfont(_ font: YuGothic, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
    
     static func customfaBrandsfont(_ font: faBrands, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
    
}


extension CGFloat {
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per;
        //375 * 0.5
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per;
        //375 * 0.5
    }
    
    static var topInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top
        }
        return 0.0
    }
    
    static var bottomInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
    static var horizontalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
        }
        return 0.0
    }
    
    static var verticalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
}


extension Color {
    
    static var lightBlack: Color {
        return Color(hex: "868686")
    }
    
    static var lightBlack2: Color {
        return Color(hex: "010F07")
    }

    static var lightYellow: Color {
        return Color(hex: "EEA734")
    }
    
    static var lightYellow2: Color {
        return Color(hex: "F8B64C")
    }
    
    static var facebook: Color {
        return Color(hex: "395998")
    }
    
    static var google: Color {
        return Color(hex: "4285F4")
    }
    
    static var primaryTextW: Color {
        return Color.white
    }
    
    static var secondaryText: Color {
        return Color(hex: "7F7F7F")
    }
    
    static var placeholder: Color {
        return Color(hex: "BBBBBB")
    }
    
     static var subTitle: Color {
        return Color(hex: "979797")
    }
    
    static var lightGray: Color {
        return Color(hex: "DADEE3")
    }
    
    static var lightWhite: Color {
        return Color(hex: "EFEFEF")
    }
    
    static var bg: Color {
        return Color.white
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
   static func rgbToUIColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    static func rgbToColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) -> Color {
        Color(red: r/255, green: g/255, blue: b/255).opacity(a)
     }
}


extension UIColor {
    
    public convenience init?(hex: String) {
            let r, g, b, a: CGFloat

            if hex.hasPrefix("#") {
                let start = hex.index(hex.startIndex, offsetBy: 1)
                let hexColor = String(hex[start...])

                if hexColor.count == 8 {
                    let scanner = Scanner(string: hexColor)
                    var hexNumber: UInt64 = 0

                    if scanner.scanHexInt64(&hexNumber) {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0x000000ff) / 255

                        self.init(red: r, green: g, blue: b, alpha: a)
                        return
                    }
                }
            }

            return nil
        }
}
