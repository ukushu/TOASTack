
import SwiftUI

public class Toaster: ObservableObject {
    @MainActor public static let shared: Toaster = Toaster()
    public var config: ToastStackConfig = ToastStackConfig()
    @Published public var toasts: [Toast] = []
    
    private init() { }
    
    public func delete(id: String) {
        guard let idx = toasts.firstIndex(where: { $0.id == id}) else { return }
        toasts.remove(at: idx)
    }
    
    public func make(@ViewBuilder content: @escaping (String) -> some View) {
        withAnimation {
            toasts.append( Toast{ id in content(id) } )
        }
    }
}
