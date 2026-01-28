
import SwiftUI

public enum ToasterMode {
    case overlay
    case vStack(size: CGSize, positionTop: Bool)
}

public extension View {
    @ViewBuilder
    func applyToaster(_ mode: ToasterMode = .overlay) -> some View {
        switch mode {
        case .overlay:
            self.modifier(ToasterOverlayMod())
        case .vStack(let size, let positionTop):
            self.modifier(ToasterVStackMod(size: size, positionTop: positionTop))
        }
    }
}

struct ToasterOverlayMod: ViewModifier {
    @ObservedObject var model = Toaster.shared
    
    func body(content: Content) -> some View {
        content
            .if(model.config.dimOnToast) {
                $0.background{ Color.clickableAlpha }
                    .overlay {
                        Rectangle()
                            .fill( .black.opacity(model.toasts.count > 0 ? 0.5 : 0) )
                            .padding(-50)
                    }
                    .onTapGesture {
                        withAnimation {
                            model.toasts = []
                        }
                    }
            }
            .overlay {
                ToastStackView(toasts: $model.toasts, config: model.config)
            }
    }
}

struct ToasterVStackMod: ViewModifier {
    @ObservedObject private var model = Toaster.shared
    let size: CGSize
    let positionTop: Bool
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            if positionTop {
                ToastStackView(toasts: $model.toasts, config: model.config)
                    .frame(width: size.width , height: size.height)
                
                content
            } else {
                content
                
                ToastStackView(toasts: $model.toasts, config: model.config)
                    .frame(width: size.width , height: size.height)
            }
        }
    }
}
