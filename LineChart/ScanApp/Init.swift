import Foundation

public func Init<Type>(_ value: Type, block: (_ object: inout Type) -> Void) -> Type {  // swiftlint:disable:this identifier_name

    var mutable = value
    block(&mutable)
    return mutable
}

public func using<Type>(_ value: Type, block: (_ object: inout Type) -> Void) {
    _ = Init(value, block: block)
}
