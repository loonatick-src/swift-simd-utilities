public struct I2 {
    public let index: Int

    @inlinable
    public init(_ index: Int) {
        self.index = index
    }
}

public struct I4 {
    public let index: Int

    @inlinable
    public init(_ index: Int) {
        self.index = index
    }
}

public struct I8 {
    public let index: Int

    @inlinable
    public init(_ index: Int) {
        self.index = index
    }
}

public struct I16 {
    public let index: Int

    @inlinable
    public init(_ index: Int) {
        self.index = index
    }
}

public struct I32 {
    public let index: Int

    @inlinable
    public init(_ index: Int) {
        self.index = index
    }
}

public struct I64 {
    public let index: Int

    @inlinable
    public init(_ index: Int) {
        self.index = index
    }
}

public extension Array where Element: SIMDScalar {
    subscript(i2: I2) -> SIMD2<Element> {
        get {
            self.loadSIMD(i2.index)
        }
    }

    subscript(i4: I4) -> SIMD4<Element> {
        get {
            self.loadSIMD(i4.index)
        }
    }

    subscript(i8: I8) -> SIMD8<Element> {
        get {
            self.loadSIMD(i8.index)
        }
    }

    subscript(i16: I16) -> SIMD16<Element> {
        get {
            self.loadSIMD(i16.index)
        }
    }

    subscript(i32: I32) -> SIMD32<Element> {
        get {
            self.loadSIMD(i32.index)
        }
    }

    subscript(i64: I64) -> SIMD64<Element> {
        get {
            self.loadSIMD(i64.index)
        }
    }
}

public extension Span where Element: SIMDScalar {
    @inlinable
    subscript(i2: I2) -> SIMD2<Element> {
        self.loadSIMD(i2.index)
    }

    @inlinable
    subscript(i4: I4) -> SIMD4<Element> {
        self.loadSIMD(i4.index)
    }

    @inlinable
    subscript(i8: I8) -> SIMD8<Element> {
        self.loadSIMD(i8.index)
    }

    @inlinable
    subscript(i16: I16) -> SIMD16<Element> {
        self.loadSIMD(i16.index)
    }

    @inlinable
    subscript(i32: I32) -> SIMD32<Element> {
        self.loadSIMD(i32.index)
    }

    @inlinable
    subscript(i64: I64) -> SIMD64<Element> {
        self.loadSIMD(i64.index)
    }
}

public extension UnsafeBufferPointer where Element: SIMDScalar {
    @inlinable
    subscript(i2: I2) -> SIMD2<Element> {
        self.loadUnalignedSIMD(i2.index)
    }

    @inlinable
    subscript(i4: I4) -> SIMD4<Element> {
        self.loadUnalignedSIMD(i4.index)
    }

    @inlinable
    subscript(i8: I8) -> SIMD8<Element> {
        self.loadUnalignedSIMD(i8.index)
    }

    @inlinable
    subscript(i16: I16) -> SIMD16<Element> {
        self.loadUnalignedSIMD(i16.index)
    }

    @inlinable
    subscript(i32: I32) -> SIMD32<Element> {
        self.loadUnalignedSIMD(i32.index)
    }

    @inlinable
    subscript(i64: I64) -> SIMD64<Element> {
        self.loadUnalignedSIMD(i64.index)
    }
}

public extension UnsafeMutableBufferPointer where Element: SIMDScalar {
    @inlinable
    subscript(i2: I2) -> SIMD2<Element> {
        get {
            self.loadUnalignedSIMD(i2.index)
        }
        set {
            self.storeSIMD(value: newValue, i2.index)
        }
    }

    @inlinable
    subscript(i4: I4) -> SIMD4<Element> {
        get {
            self.loadUnalignedSIMD(i4.index)
        }
        set {
            self.storeSIMD(value: newValue, i4.index)
        }
    }

    @inlinable
    subscript(i8: I8) -> SIMD8<Element> {
        get {
            self.loadUnalignedSIMD(i8.index)
        }
        set {
            self.storeSIMD(value: newValue, i8.index)
        }
    }

    @inlinable
    subscript(i16: I16) -> SIMD16<Element> {
        get {
            self.loadUnalignedSIMD(i16.index)
        }
        set {
            self.storeSIMD(value: newValue, i16.index)
        }
    }

    @inlinable
    subscript(i32: I32) -> SIMD32<Element> {
        get {
            self.loadUnalignedSIMD(i32.index)
        }
        set {
            self.storeSIMD(value: newValue, i32.index)
        }
    }

    @inlinable
    subscript(i64: I64) -> SIMD64<Element> {
        get {
            self.loadUnalignedSIMD(i64.index)
        }
        set {
            self.storeSIMD(value: newValue, i64.index)
        }
    }
}

public extension MutableSpan where Element: SIMDScalar {
    @inlinable
    subscript(i2: I2) -> SIMD2<Element> {
        get {
            self.loadSIMD(i2.index)
        }
        @_lifetime(&self)
        set {
            self.storeSIMD(value: newValue, at: i2.index)
        }
    }

    @inlinable
    subscript(i4: I4) -> SIMD4<Element> {
        get {
            self.loadSIMD(i4.index)
        }
        @_lifetime(&self)
        set {
            self.storeSIMD(value: newValue, at: i4.index)
        }
    }

    @inlinable
    subscript(i8: I8) -> SIMD8<Element> {
        get {
            self.loadSIMD(i8.index)
        }
        @_lifetime(&self)
        set {
            self.storeSIMD(value: newValue, at: i8.index)
        }
    }

    @inlinable
    subscript(i16: I16) -> SIMD16<Element> {
        get {
            self.loadSIMD(i16.index)
        }
        @_lifetime(&self)
        set {
            self.storeSIMD(value: newValue, at: i16.index)
        }
    }

    @inlinable
    subscript(i32: I32) -> SIMD32<Element> {
        get {
            self.loadSIMD(i32.index)
        }
        @_lifetime(&self)
        set {
            self.storeSIMD(value: newValue, at: i32.index)
        }
    }

    @inlinable
    subscript(i64: I64) -> SIMD64<Element> {
        get {
            self.loadSIMD(i64.index)
        }
        @_lifetime(&self)
        set {
            self.storeSIMD(value: newValue, at: i64.index)
        }
    }
}
