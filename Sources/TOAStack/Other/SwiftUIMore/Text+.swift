
import SwiftUI

extension Text {
    static func sfSymbol( _ sysName: String) -> Text {
        return Text(Image(systemName: sysName))
    }
    
    /// You need to use .fixedSize() manually!!!!
    static func sfIcon( _ sysName: String, size: CGFloat, weight: Font.Weight = .regular) -> Text {
        return Text(Image(systemName: sysName))
            .font(.system(size: size).weight(weight))
    }
}
