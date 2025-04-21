
import SwiftUI

//
// Sample 1: as simple as possible.
// This sample is so simplified -- that you even here do not able to use any custom data
//
public struct ToastSample: ToastView {
    public let delete: () -> ()
    
    @State private var str = UUID().uuidString
    
    // custom delete logic, in most cases not needed
    // it's needed only if you want to build own Toaster with custom logic :)
    //public init(delete: @escaping () -> Void) {
    //    self.delete = delete
    //}
    
    public init(id: String) {
        self.delete = { Toaster.shared.delete(id: id) }
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
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
