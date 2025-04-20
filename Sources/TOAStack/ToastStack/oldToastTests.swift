
import SwiftUI
import MoreSwiftUI

//public struct UksToastConfig {
//    let autohideDelayS: Double?
//    let animation: Animation
//    let edge: VerticalAlignment
//    let isSwipeToDismissEnabled: Bool
//    let baseOffset: CGFloat
//    let animationOffset: CGFloat
//    
//    public init(autohideDelayS: Double? = 4,
//                animation: Animation = .bouncy(duration: 0.4),
//                edge: VerticalAlignment = .top,
//                isSwipeToDismissEnabled: Bool = true,
//                baseOffset: CGFloat = 30,
//                animationOffset: CGFloat = 250
//    ) {
//        self.autohideDelayS = autohideDelayS
//        self.animation = animation
//        self.edge = edge
//        self.isSwipeToDismissEnabled = isSwipeToDismissEnabled
//        self.baseOffset = baseOffset
//        self.animationOffset = animationOffset
//    }
//}

//public struct UksToast<Content: View>: View {
//    let config: UksToastConfig
//    @Binding var isActive: Bool
//    
//    @State var id: UUID?
//    
//    let content: (Binding<Bool>) -> Content
//    
//    init(isActive: Binding<Bool>, config: UksToastConfig, view: @escaping (Binding<Bool>) -> Content) {
//        _isActive = isActive
//        self.config = config
//        self.content = view
//    }
//    
//    public var body: some View {
//        let offset = offset()
//        
//        ZStack(alignment: config.edge == .top ? .top : .bottom) {
//            Color.clear
//            
//            content($isActive)
//                .compositingGroup()
//                .animation(config.animation, value: isActive)
//                .padding(.vertical, config.baseOffset)
//                .offset(x: 0, y: offset)
//                #if os(iOS) || os(macOS) || os(watchOS) || os(visionOS)
//                .gesture(swipeGesture, if: config.isSwipeToDismissEnabled)
//                #endif
//                .onChange(of: isActive, perform: handlePresentation)
//                .onChange(of: isActive) { _ in
//                    if isActive == false {
//                        id = nil
//                    }
//                }
//        }
//    }
//    
//}
//
//extension UksToast {
//    func offset() -> CGFloat {
//        if config.edge == .top {
//            return isActive ? 0 : -config.animationOffset
//        } else {
//            return isActive ? 0 : config.animationOffset
//        }
//    }
//    
//    func handlePresentation<V: Equatable>(_ v: V ) {
//        let id: UUID = UUID()
//        
//        guard isActive, let delay = config.autohideDelayS else { return }
//        
//        if self.id == nil {
//            self.id = id
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            if self.id == id {
//                dismiss()
//            }
//        }
//    }
//    
//    func dismiss() {
//        withAnimation {
//            isActive = false
//        }
//    }
//    
//    #if os(iOS) || os(macOS) || os(watchOS) || os(visionOS)
//    var swipeGesture: some Gesture {
//        DragGesture(minimumDistance: 20, coordinateSpace: .global)
//            .onEnded { value in
//                let horizontalTranslation = value.translation.width as CGFloat
//                let verticalTranslation = value.translation.height as CGFloat
//                let isVertical = abs(verticalTranslation) > abs(horizontalTranslation)
//                let isUp = verticalTranslation < 0
//                // let isLeft = horizontalTranslation < 0
//                guard isVertical else { return }            // We only use vertical edges
//                if isUp && config.edge == .top { dismiss() }
//                if !isUp && config.edge == .bottom { dismiss() }
//            }
//    }
//    #endif
//}
//
//
//public extension View {
//    func uksToast<Content: View>( isActive: Binding<Bool>, config: UksToastConfig = UksToastConfig(), content: @escaping (Binding<Bool>) -> Content ) -> some View {
//        ZStack {
//            self
//            UksToast(isActive: isActive, config: config, view: content)
////            SystemNotification(
////                isActive: isActive,
////                content: { _ in content() }
////            )
//        }
//    }
//}
