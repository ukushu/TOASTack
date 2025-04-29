
import Foundation
import SwiftUI

struct ThisDevice {
    struct Os {
        static var isMacOS: Bool {
            #if os(macOS)
            return true
            #else
            return false
            #endif
        }
        
        static var isIOS: Bool {
            #if os(iOS)
            return true
            #else
            return false
            #endif
        }
    }
    
    #if os(iOS)
    static var isIPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    
    static var isIPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
    
    static var isTV: Bool { UIDevice.current.userInterfaceIdiom == .tv }
    
    @available(iOS 17.0, *)
    static var isVision: Bool { UIDevice.current.userInterfaceIdiom == .vision }
    
    @available(iOS 14.0, *)
    static var isMac: Bool { UIDevice.current.userInterfaceIdiom == .mac }
    #endif
}
