
import SwiftUI

public protocol ToastView: View {
    var delete: () -> () { get }
}
