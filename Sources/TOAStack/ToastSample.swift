
import SwiftUI

public struct ToastSample: ToastView {
    public let delete: () -> ()
    
    @State private var str = UUID().uuidString
    
    public init(delete: @escaping () -> Void) {
        self.delete = delete
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 40)
                .overlay {
                    HStack {
                        Text(verbatim: str)
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                delete()
                            }
                        }) {
                            Text(verbatim: "X")
                        }
                    }
                    .padding()
                }
        }
        .shadow(radius: 3)
    }
}
