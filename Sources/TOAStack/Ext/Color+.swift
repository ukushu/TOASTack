
import SwiftUI

@available(macOS 12.0, *)
@available(iOS 14.0, *)
extension Color {
    init(hex: UInt32) {
        self.init(
            red:       Double((hex >> 16) & 0xFF) / 256.0,
            green:     Double((hex >> 8) & 0xFF) / 256.0,
            blue:      Double(hex & 0xFF) / 256.0
        )
    }
    
    init(rgbaHex: UInt32) {
        self.init(
            red:      Double((rgbaHex >> 24) & 0xFF) / 256.0,
            green:    Double((rgbaHex >> 16) & 0xFF) / 256.0,
            blue:     Double((rgbaHex >> 8) & 0xFF) / 256.0,
            opacity:  Double(rgbaHex & 0xFF) / 256.0
        )
    }
}

extension Color {
    static var clickableAlpha: Color { get { return Color(rgbaHex: 0x01010101) } }
}
