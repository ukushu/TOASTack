
// Fix of horrible swift naming
extension Array {
    func first(_ count: Int) -> ArraySlice<Element> {
        return self.prefix(count)
    }
    
    func last(_ count: Int) -> ArraySlice<Element> {
        return self.suffix(count)
    }
}
