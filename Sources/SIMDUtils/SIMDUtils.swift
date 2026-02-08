public extension UnsafePointer where Pointee: SIMDScalar {
    @inlinable
    func loadUnalignedSIMD<V: SIMD>(_ index: Int) -> V where V.Scalar == Pointee {
        UnsafeRawPointer(self).loadUnaligned(fromByteOffset: index * MemoryLayout<V.Scalar>.stride, as: V.self)
    }
}

public extension UnsafeBufferPointer where Element: SIMDScalar {
    @inlinable
    func loadUnalignedSIMD<V: SIMD>(
        _ index: Int
    ) -> V where V.Scalar == Element {
     UnsafeRawBufferPointer(self).loadUnaligned(fromByteOffset: index * MemoryLayout<V.Scalar>.stride, as: V.self)
    }
}

public extension UnsafeMutablePointer where Pointee: SIMDScalar {
    @inlinable
    func loadUnalignedSIMD<V: SIMD>(_ index: Int) -> V where V.Scalar == Pointee {
        UnsafePointer(self).loadUnalignedSIMD(index)
    }

    @inlinable
    func storeSIMD<V: SIMD>(value: V, _ index: Int) where V.Scalar == Pointee {
        UnsafeMutableRawPointer(self).storeBytes(of: value, toByteOffset: index * MemoryLayout<V.Scalar>.stride, as: V.self)
    }
}

public extension UnsafeMutableBufferPointer where Element: SIMDScalar {
    @inlinable
    func loadUnalignedSIMD<V: SIMD>(_ index: Int) -> V where V.Scalar == Element {
        UnsafeBufferPointer(self).loadUnalignedSIMD(index)
    }

    @inlinable
    func storeSIMD<V: SIMD>(value: V, _ index: Int) where V.Scalar == Element {
        UnsafeMutableRawBufferPointer(self).storeBytes(of: value, toByteOffset: index * MemoryLayout<V.Scalar>.stride, as: V.self)
    }
}

@frozen
public struct ScalarIndex {
    public let value: Int

    @inlinable
    public init(_ index: Int) {
        self.value = index
    }
}

public extension Span where Element: SIMDScalar {
    @inlinable
    func simdLoad<V: SIMD>(_ index: Int) -> V where V.Scalar == Element {
        self.withUnsafeBufferPointer { $0.loadUnalignedSIMD(index) }
    }

    

    @inlinable
    subscript<V: SIMD>(scalarIndex: ScalarIndex) -> V where V.Scalar == Element {
        self.simdLoad(scalarIndex.value)
    }

}

public extension MutableSpan where Element: SIMDScalar {
    @inlinable
    func simdLoad<V: SIMD>(_ index: Int) -> V where V.Scalar == Element {
        self.withUnsafeBufferPointer { $0.loadUnalignedSIMD(index) }
    }

    @_lifetime(&self)
    @inlinable
    mutating func simdStore<V: SIMD>(value: V, at index: Int) where V.Scalar == Element {
        self.withUnsafeMutableBufferPointer { $0.storeSIMD(value: value, index) }
    }

    @inlinable
    subscript<V: SIMD>(scalarIndex: ScalarIndex) -> V where V.Scalar == Element {
        get {
            self.simdLoad(scalarIndex.value)
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: scalarIndex.value)
        }
    }
}

public extension Array where Element: SIMDScalar {
    @inlinable
    func simdLoad<V: SIMD>(_ index: Int) -> V where V.Scalar == Element {
        self.withUnsafeBufferPointer { $0.loadUnalignedSIMD(index) }
    }

    @inlinable
    mutating func simdStore<V: SIMD>(value: V, at index: Int) where V.Scalar == Element {
        self.withUnsafeMutableBufferPointer { $0.storeSIMD(value: value, index) }
    }

    @inlinable
    subscript<V: SIMD>(scalarIndex: ScalarIndex) -> V where V.Scalar == Element {
        get {
            self.simdLoad(scalarIndex.value)
        }
        set {
            self.simdStore(value: newValue, at: scalarIndex.value)
        }
    }
}

