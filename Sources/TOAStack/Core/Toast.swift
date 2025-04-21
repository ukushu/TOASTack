
import SwiftUI

public struct Toast: Identifiable, Hashable {
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public private(set) var id: String = UUID().uuidString
    public var content: (String) -> AnyView
    
    public init(@ViewBuilder content: @escaping (String) -> some View) {
        self.content = { id in AnyView(content(id)) }
    }
}
