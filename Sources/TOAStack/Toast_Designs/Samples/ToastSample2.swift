
import SwiftUI


public class SampleToastData: ObservableObject {
    let title: String
    let descr: String
    let sfSymbol: String
    let color: Color
    
    public init(title: String, descr: String, sfSymbol: String, color: Color) {
        self.title = title
        self.descr = descr
        self.sfSymbol = sfSymbol
        self.color = color
    }
}

//
// Sample 2:
// * custom design
// * animated icon
// * data insertion
// * dismiss by horizontal swipe
//
public struct ToastSample2: ToastView {
    @EnvironmentObject var data: SampleToastData
    
    public let delete: () -> ()
    
    @State private var str = UUID().uuidString
    
    @State var animationFlag: Bool = false
    
    @State private var hDragAmount: CGFloat = 0.0
    @State private var opacityAmount: CGFloat = 1.0
    
    // custom delete logic, in most cases not needed
    // it's needed only if you want to build own Toaster with custom logic :)
    //public init(delete: @escaping () -> Void) {
    //    self.delete = delete
    //}
    
    public init(id: String) {
        self.delete = { Toaster.shared.delete(id: id) }
    }
    
    public var body: some View {
        HStack {
            AnimatedIcon()
            
            VStack(alignment: .leading) {
                Text(verbatim: data.title)
                    .bold()
                
                Text(verbatim: data.descr)
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
            }
            
            Spacer(minLength: 0)
        }
        .padding(EdgeInsets(horizontal: 10, vertical: 7))
        .foregroundStyle(data.color)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .shadow(radius: 5)
        }
        .onAppear {
            animationFlag = true
        }
        .swipeReaction(hDragAmount: $hDragAmount,
                       opacityAmount: $opacityAmount,
                       treshold: 150,
                       action: { dismiss() }
        )
    }
}

extension ToastSample2 {
    func AnimatedIcon() -> some View {
        Text.sfIcon(data.sfSymbol, size: 30)
            .rotationEffect(.degrees(animationFlag ? -3 : 3), anchor: .top)
            .animation(
                Animation.bouncy(duration: 0.2, extraBounce: 2).repeatForever(),
                value: animationFlag
            )
    }
    
    func dismiss() {
        withAnimation {
            delete()
        }
    }
}

fileprivate extension View {
    func swipeReaction(hDragAmount: Binding<CGFloat>,
                       opacityAmount: Binding<CGFloat>,
                       treshold: CGFloat,
                       action: @escaping ()->()
    ) -> some View {
        self.offset(x: hDragAmount.wrappedValue)
            .opacity(opacityAmount.wrappedValue)
            .gesture(
                DragGesture()
                    .onChanged { drag in
                        withAnimation {
                            hDragAmount.wrappedValue = drag.translation.width
                            
                            if abs(hDragAmount.wrappedValue) < treshold {
                                // make it more transparent the farther down it goes
                                opacityAmount.wrappedValue = (treshold - abs(hDragAmount.wrappedValue) ) / treshold
                            } else {
                                opacityAmount.wrappedValue = 0
                            }
                        }
                    }
                    .onEnded { drag in
                        withAnimation {
                            let draggedX = drag.translation.width
                            
                            if abs(draggedX) > treshold {
                                opacityAmount.wrappedValue = 0
                                hDragAmount.wrappedValue = 0
                                action()
                                
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                                    withAnimation {
                                        opacityAmount.wrappedValue = 1
                                    }
                                }
                            } else {
                                hDragAmount.wrappedValue = 0
                                opacityAmount.wrappedValue = 1
                            }
                        }
                    }
            )
    }
}
