
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

struct CRToast: View {
    @EnvironmentObject var data: CRToastData
    public let delete: () -> ()
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Icon()
            
            Text(data.title)
                .font(Font.caption)
                .foregroundColor(.black)
            
            Spacer(minLength: 10)
            
            CloseBtn()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: data.width)
        .background(.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .opacity(0.6)
                
        )
        .padding(.horizontal, 16)
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
            Text.sfIcon("xmark", size: 20)
                .foregroundColor(data.color)
        }
        .buttonStyle(.plain)
        .padding(-6) // pixelhuting fix
    }
}
