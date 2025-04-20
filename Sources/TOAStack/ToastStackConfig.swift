
import SwiftUI

public struct ToastStackConfig {
    var animation: Animation
    var edge: VerticalAlignment
    var isSwipeToDismissEnabled: Bool
    var baseOffset: CGFloat
    var animationOffset: CGFloat
    
    public init(animation: Animation = .bouncy(duration: 0.4),
                edge: VerticalAlignment = .top,
                isSwipeToDismissEnabled: Bool = true,
                baseOffset: CGFloat = 10,
                animationOffset: CGFloat = 250
    ) {
        self.animation = animation
        self.edge = edge
        self.isSwipeToDismissEnabled = isSwipeToDismissEnabled
        self.baseOffset = baseOffset
        self.animationOffset = animationOffset
    }
}
