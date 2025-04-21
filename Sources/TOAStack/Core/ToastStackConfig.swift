
import SwiftUI

public struct ToastStackConfig {
    public var animation: Animation
    public var edge: VerticalAlignment
    public var isSwipeToDismissEnabled: Bool
    public var baseOffset: CGFloat
    public var animationOffset: CGFloat
    public var dimOnToast: Bool
    
    public init(animation: Animation = .bouncy(duration: 0.4),
                edge: VerticalAlignment = .top,
                isSwipeToDismissEnabled: Bool = true,
                baseOffset: CGFloat = 10,
                animationOffset: CGFloat = 250,
                dimOnToast: Bool = false
    ) {
        self.animation = animation
        self.edge = edge
        self.isSwipeToDismissEnabled = isSwipeToDismissEnabled
        self.baseOffset = baseOffset
        self.animationOffset = animationOffset
        self.dimOnToast = dimOnToast
    }
}
