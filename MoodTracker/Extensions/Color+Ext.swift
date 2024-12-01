import SwiftUI

extension Color {
    var hexString: String {
         let components = UIColor(self).cgColor.components ?? [0, 0, 0, 1]
         let red = components[0]
         let green = components[1]
         let blue = components[2]
         let alpha = components.count > 3 ? components[3] : 1.0
         return String(format: "#%02lX%02lX%02lX%02lX",
                       lround(Double(red * 255)),
                       lround(Double(green * 255)),
                       lround(Double(blue * 255)),
                       lround(Double(alpha * 255)))
     }

     static func fromHexString(_ hex: String) -> Color {
         var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
         hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

         var rgb: UInt64 = 0
         Scanner(string: hexSanitized).scanHexInt64(&rgb)

         let red = Double((rgb & 0xFF000000) >> 24) / 255.0
         let green = Double((rgb & 0x00FF0000) >> 16) / 255.0
         let blue = Double((rgb & 0x0000FF00) >> 8) / 255.0
         let alpha = Double(rgb & 0x000000FF) / 255.0

         return Color(red: red, green: green, blue: blue, opacity: alpha)
     }
}

