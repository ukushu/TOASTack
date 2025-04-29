
import SwiftUI

public extension EdgeInsets {
    init (horizontal: CGFloat? = nil, vertical: CGFloat? = nil) {
        self.init(top: vertical ?? 0, leading: horizontal ?? 0, bottom: vertical ?? 0, trailing: horizontal ?? 0)
    }
    
    init (horizontal: CGFloat? = nil, top: CGFloat? = nil, bottom: CGFloat? = nil) {
        self.init(top: top ?? 0, leading: horizontal ?? 0, bottom: bottom ?? 0, trailing: horizontal ?? 0)
    }
    
    init (vertical: CGFloat? = nil, leading: CGFloat? = nil, trailing: CGFloat? = nil) {
        self.init(top: vertical ?? 0, leading: leading ?? 0, bottom: vertical ?? 0, trailing: trailing ?? 0)
    }
}
