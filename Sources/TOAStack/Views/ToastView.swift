
import SwiftUI
import MoreSwiftUI

public protocol ToastView: View {
    var delete: () -> () { get }
}
