
import SwiftUI

struct ToastStackView: View {
    @Binding var toasts: [ToastModel]
    @State private var expanded: Bool = false
    let config: ToastStackConfig
    
    init(toasts: Binding<[ToastModel]>, config: ToastStackConfig) {
        _toasts = toasts
        self.config = config
    }
    
    var body: some View {
        ZStack(alignment: config.edge == .top ? .top : .bottom) {
            Color.clear
            
            ToastsView()
        }
        .animation(config.animation, value: expanded)
        .padding(.vertical, config.baseOffset)
        .onChange(of: toasts) { _ in
            if toasts.count == 0 {
                expanded = false
            }
        }
        .transition(.move(edge: config.edge == .top ? .top : .bottom))
    }
    
    @ViewBuilder
    func ToastsView() -> some View {
        let layout = expanded ? AnyLayout(VStackLayout(spacing: 10)) : AnyLayout (ZStackLayout () )
            
        layout {
            ForEach($toasts) { $toast in
                let index = (toasts.firstIndex(where: { $0.id == toast.id }) ?? 0)
                let scale = scale(toasts.count - index)
                let offset = offsetY(toasts.count - index)
                
                toast.content(toast.id)
                    .offset(y: expanded ? 0 : (config.edge == .bottom ? offset : -offset ) )
                    .scaleEffect(expanded ? 1 : scale)
                    .transition(
                        .asymmetric(
                            insertion: .push(from: config.edge == .top ? .top : .bottom).combined(with: .opacity),
                            removal: .move(edge: config.edge == .top ? .top : .bottom).combined(with: .opacity)
                        )
                    )
            }
            .onTapGesture { toggleExpanded() }
        }
        .padding(.horizontal, 20)
        .background {
            Color.clickableAlpha
                .onTapGesture { toggleExpanded() }
        }
        .gesture(swipeGesture, if: config.isSwipeToDismissEnabled)
    }
}

//
// Helpers
//
extension ToastStackView {
    func offsetY(_ index: Int) -> CGFloat {
        let singleOffset: CGFloat = 20
        
        let offset = min(CGFloat (index) * singleOffset, 30)
        
        return -offset
    }
    
    func scale(_ index: Int) -> CGFloat {
        let singleScale = 0.05
        
        let scale = min(CGFloat (index) * singleScale, 30)
        
        return 1 + singleScale - scale
    }
    
    func toggleExpanded() {
        guard self.toasts.count > 1 else { return }
        
        expanded.toggle()
    }
    
    func dismiss() {
        withAnimation {
            self.toasts = []
        }
    }
    
    #if os(iOS) || os(macOS) || os(watchOS) || os(visionOS)
    var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 20, coordinateSpace: .global)
            .onEnded { value in
                let horizontalTranslation = value.translation.width as CGFloat
                let verticalTranslation = value.translation.height as CGFloat
                let isVertical = abs(verticalTranslation) > abs(horizontalTranslation)
                let isUp = verticalTranslation < 0
                // let isLeft = horizontalTranslation < 0
                guard isVertical else { return }            // We only use vertical edges
                if isUp && config.edge == .top { dismiss() }
                if !isUp && config.edge == .bottom { dismiss() }
            }
    }
    #endif
}


fileprivate extension View {
    @ViewBuilder
    func gesture<GestureType: Gesture>(
        _ gesture: GestureType,
        if condition: Bool
    ) -> some View {
        if condition {
            self.gesture(gesture)
        } else {
            self
        }
    }
}
