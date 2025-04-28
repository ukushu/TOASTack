
import SwiftUI

public extension View {
    func applyToaster() -> some View {
        self.modifier(ToasterMod())
    }
}

struct ToasterMod: ViewModifier {
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
