
import SwiftUI

extension View {
    ///Give ability to click / tap / hover/ etc on full space of View. Even on empty space.
    func makeFullyIntaractable() -> some View {
        self.background(Color.clickableAlpha)
    }
    
    ///Give ability to click / tap / hover/ etc on full space of View. Even on empty space.
    func makeFullyIntaractableOverlay() -> some View {
        self.overlay(Color.clickableAlpha)
    }
}

extension View {
    /// IMPORTANT! Better to use standard SwiftUI's if else system!
    ///```
    ///Text("some Text")
    ///   .if(modifierEnabled) { $0.foregroundColor(.red) }
    ///```
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, @ViewBuilder content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
}
