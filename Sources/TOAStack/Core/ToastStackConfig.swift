
import SwiftUI

public struct ToastStackConfig {
    public var animation: Animation
    public var edge: VerticalAlignment
    public var isSwipeToDismissEnabled: Bool
    public var baseOffset: CGFloat
    public var dimOnToast: Bool
    public var displaMax: Int
    
    public init(animation: Animation = .bouncy(duration: 0.4),
                edge: VerticalAlignment = .top,
                isSwipeToDismissEnabled: Bool = true,
                baseOffset: CGFloat = 10,
                dimOnToast: Bool = false,
                displaMax: Int = 5
    ) {
        self.animation = animation
        self.edge = edge
        self.isSwipeToDismissEnabled = isSwipeToDismissEnabled
        self.baseOffset = baseOffset
        self.dimOnToast = dimOnToast
        self.displaMax = displaMax
    }
    
    func transition() -> AnyTransition {
        AnyTransition.asymmetric(
            insertion: .push(from: self.edge.asEdge() ).combined(with: .opacity),
            removal: .move(edge: self.edge.asEdge() ).combined(with: .opacity)
        )
    }
}

extension VerticalAlignment {
    func asEdge() -> Edge {
        self == VerticalAlignment.top ? Edge.top : Edge.bottom
    }
}
