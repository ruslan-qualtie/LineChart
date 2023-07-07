public extension Collection {
    func compact<T>() -> [T] where Element == T? {
        compactMap { $0 }
    }

    func exclude<T>(_ type: T.Type, _ reason: String) -> [Element] {
        _ = reason
        return exclude { $0 is T }
    }

    func exclude(_ isExcluded: (Element) throws -> Bool) rethrows -> [Element] {
        try filter { try !isExcluded($0) }
    }

    func makeUniqueMap<Key: Hashable>(withKey keyPath: KeyPath<Element, Key>) -> [Key: Element] {
        Dictionary(
            uniqueKeysWithValues: map { ($0[keyPath: keyPath], $0) }
        )
    }

    func makeUniqueMap<Key: Hashable, Value>(withKey keyPath: KeyPath<Element, Key>, value valuePath: KeyPath<Element, Value>)
    -> [Key: Value] {
        Dictionary(
            uniqueKeysWithValues: map { ($0[keyPath: keyPath], $0[keyPath: valuePath]) }
        )
    }

    var isNotEmpty: Bool {
        !isEmpty
    }
}
