
import SwiftUI
import MoreSwiftUI

public class CRToastData: ObservableObject {
    let title: String
    var width: CGFloat
    let sfSymbol: String?
    let color: Color
    
    public init(title: String, width: CGFloat = CGFloat.infinity, sfSymbol: String?, color: Color) {
        self.title = title
        self.width = width
        self.sfSymbol = sfSymbol
        self.color = color
    }
}

public struct CRToast: View {
    @EnvironmentObject var data: CRToastData
    public let delete: () -> ()
    
    public init(id: String) {
        self.delete = { Toaster.shared.delete(id: id) }
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Icon()
            
            Text(data.title)
                .font(Font.caption)
                .lineLimit(4)
            
            Spacer(minLength: 0)
            
            CloseBtn()
        }
        .padding(EdgeInsets(horizontal: 10, vertical: 5))
        .frame(minWidth: 0, maxWidth: data.width)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.thinMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(data.color, lineWidth: 1.5)
                }
        }
    }
}

extension CRToast {
    @ViewBuilder
    func Icon() -> some View {
        if let sf = data.sfSymbol {
            Text.sfIcon(sf, size: 22)
                .foregroundColor(data.color)
        }
    }
    
    func CloseBtn() -> some View {
        Button(action: {
            dismiss()
        }) {
            Text.sfIcon("xmark", size: 16)
                .foregroundColor(data.color)
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
