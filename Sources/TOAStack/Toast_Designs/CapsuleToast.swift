
import SwiftUI
import Essentials

public class CapsuleToastData: ObservableObject {
    let title: String
    let descr: String?
    let sfSymbol: String?
    
    public init(title: String, descr: String?, sfSymbol: String?) {
        self.title = title
        self.descr = descr
        self.sfSymbol = sfSymbol
    }
}

public struct CapsuleToast: ToastView {
    @EnvironmentObject var data: CapsuleToastData
    
    public let delete: () -> ()
    
    @State private var str = UUID().uuidString
    
    @State var animationFlag: Bool = false
    
    public init(id: String) {
        self.delete = { Toaster.shared.delete(id: id) }
    }
    
    let textColor = Color(hex: 0x303030)
    let bgColor = Color(hex: 0xe0e0e0)
    
    public var body: some View {
        HStack {
            AnimatedIcon()
                .foregroundStyle(textColor)
            
            VStack(alignment: .leading) {
                Text(verbatim: data.title)
                    .font( .system(size: ThisDevice.Os.isIOS ? 16 : 14).weight(.bold) )
                
                if let descr = data.descr {
                    Text(verbatim: descr)
                        .font( .system(size: ThisDevice.Os.isIOS ? 14 : 12).weight(.light) )
                        .multilineTextAlignment(.leading)
                        .lineLimit(5)
                        .opacity(0.7)
                }
            }
            .foregroundStyle(textColor)
            
            Spacer(minLength: 0)
            
            CloseBtn()
        }
        .padding(EdgeInsets(horizontal: 10, vertical: 7))
        .frame(height: ThisDevice.Os.isIOS ? 50 : 40)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(bgColor)
                .shadow(color: .black, radius: 4)
        }
        .onAppear {
            animationFlag = true
        }
    }
}

extension CapsuleToast {
    @ViewBuilder
    func AnimatedIcon() -> some View {
        if let sf = data.sfSymbol {
            Text.sfIcon(sf, size: 22)
                .rotationEffect(.degrees(animationFlag ? -3 : 3), anchor: .top)
                .animation(
                    Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2 ).repeatForever(),
                    value: animationFlag
                )
        }
    }
    
    func CloseBtn() -> some View {
        Button(action: {
            dismiss()
        }) {
            Text(verbatim: "X")
                .padding(6)
                .background {
                    Circle()
                        .fill(textColor)
                }
                .padding(6) // pixelhuting fix
                .background {
                    Color.clickableAlpha
                }
        }
        .buttonStyle(.plain)
        .padding(-6) // pixelhuting fix
    }
    
    func dismiss() {
        withAnimation {
            delete()
        }
    }
}

//
//#Preview {
//    VStack {
//        CapsuleToast(id: "asdf")
//            .environmentObject(CapsuleToastData(
//                title: "Hello",
//                descr: "alksdjf lk;asj dflk adslkfj",
//                sfSymbol: "trash"
//            ))
//        
//        CapsuleToast(id: "asdf")
//            .environmentObject(CapsuleToastData(
//                title: "Hello",
//                descr: nil,
//                sfSymbol: nil
//            ))
//    }
//}
