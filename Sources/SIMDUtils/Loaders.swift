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
            self.simdLoad(i2.index)
        }
    }

    subscript(i4: I4) -> SIMD4<Element> {
        get {
            self.simdLoad(i4.index)
        }
    }

    subscript(i8: I8) -> SIMD8<Element> {
        get {
            self.simdLoad(i8.index)
        }
    }

    subscript(i16: I16) -> SIMD16<Element> {
        get {
            self.simdLoad(i16.index)
        }
    }

    subscript(i32: I32) -> SIMD32<Element> {
        get {
            self.simdLoad(i32.index)
        }
    }

    subscript(i64: I64) -> SIMD64<Element> {
        get {
            self.simdLoad(i64.index)
        }
    }
}

public extension Span where Element: SIMDScalar {
    @inlinable
    subscript(i2: I2) -> SIMD2<Element> {
        self.simdLoad(i2.index)       
    }

    @inlinable
    subscript(i4: I4) -> SIMD4<Element> {
        self.simdLoad(i4.index)       
    }

    @inlinable
    subscript(i8: I8) -> SIMD8<Element> {
        self.simdLoad(i8.index)       
    }

    @inlinable
    subscript(i16: I16) -> SIMD16<Element> {
        self.simdLoad(i16.index)       
    }

    @inlinable
    subscript(i32: I32) -> SIMD32<Element> {
        self.simdLoad(i32.index)       
    }

    @inlinable
    subscript(i64: I64) -> SIMD64<Element> {
        self.simdLoad(i64.index)       
    }
}

public extension MutableSpan where Element: SIMDScalar {
    @inlinable
    subscript(i2: I2) -> SIMD2<Element> {
        get {
            self.simdLoad(i2.index)       
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: i2.index)
        }
    }

    @inlinable
    subscript(i4: I4) -> SIMD4<Element> {
        get {
            self.simdLoad(i4.index)       
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: i4.index)
        }
    }

    @inlinable
    subscript(i8: I8) -> SIMD8<Element> {
        get {
            self.simdLoad(i8.index)       
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: i8.index)
        }
    }


    @inlinable
    subscript(i16: I16) -> SIMD16<Element> {
        get {
            self.simdLoad(i16.index)       
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: i16.index)
        }
    }

    @inlinable
    subscript(i32: I32) -> SIMD32<Element> {
        get {
            self.simdLoad(i32.index)       
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: i32.index)
        }
    }

    @inlinable
    subscript(i64: I64) -> SIMD64<Element> {
        get {
            self.simdLoad(i64.index)       
        }
        @_lifetime(&self)
        set {
            self.simdStore(value: newValue, at: i64.index)
        }
    }
}
