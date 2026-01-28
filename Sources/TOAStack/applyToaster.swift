
import SwiftUI

public enum ToasterMode {
    case overlay
    case vStack
}

public extension View {
    @ViewBuilder
    func applyToaster(_ mode: ToasterMode = .overlay) -> some View {
        switch mode {
        case .overlay:
            self.modifier(ToasterOverlayMod())
        case .vStack:
            self.modifier(ToasterVStackMod())
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
    @ObservedObject var model = Toaster.shared
    
    func body(content: Content) -> some View {
        VStack {
            switch model.config.edge{
            case .top:
                VStack {
                    ToastStackView(toasts: $model.toasts, config: model.config)
                    
                    content
                }
            case .bottom:
                VStack {
                    content
                    
                    ToastStackView(toasts: $model.toasts, config: model.config, fillNeeded: false)
                }
            default:
                Text("configure your Toaster as .top or .bottom edge value")
            }
        }
    }
}
