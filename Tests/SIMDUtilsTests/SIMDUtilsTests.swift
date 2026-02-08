import Testing
@testable import SIMDUtils

// MARK: - Array Subscript Tests

@Suite("Array SIMD Subscripts")
struct ArraySubscriptTests {

    @Test func arrayI2Get() {
        let xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let v0: SIMD2<Int32> = xs[I2(0)]
        let v2: SIMD2<Int32> = xs[I2(2)]
        let v6: SIMD2<Int32> = xs[I2(6)]

        #expect(v0 == SIMD2(1, 2))
        #expect(v2 == SIMD2(3, 4))
        #expect(v6 == SIMD2(7, 8))
    }

    @Test func arrayI2Set() {
        var xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        xs[I2(0)] = SIMD2(10, 20)
        xs[I2(4)] = SIMD2(50, 60)

        #expect(xs == [10, 20, 3, 4, 50, 60, 7, 8])
    }

    @Test func arrayI4Get() {
        let xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let v0: SIMD4<Int32> = xs[I4(0)]
        let v2: SIMD4<Int32> = xs[I4(2)]
        let v4: SIMD4<Int32> = xs[I4(4)]

        #expect(v0 == SIMD4(1, 2, 3, 4))
        #expect(v2 == SIMD4(3, 4, 5, 6))
        #expect(v4 == SIMD4(5, 6, 7, 8))
    }

    @Test func arrayI4Set() {
        var xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        xs[I4(0)] = SIMD4(10, 20, 30, 40)

        #expect(xs == [10, 20, 30, 40, 5, 6, 7, 8])
    }

    @Test func arrayI8Get() {
        let xs: [Int32] = Array(1...16)
        let v0: SIMD8<Int32> = xs[I8(0)]
        let v4: SIMD8<Int32> = xs[I8(4)]

        #expect(v0 == SIMD8(1, 2, 3, 4, 5, 6, 7, 8))
        #expect(v4 == SIMD8(5, 6, 7, 8, 9, 10, 11, 12))
    }

    @Test func arrayI8Set() {
        var xs: [Int32] = Array(1...16)
        xs[I8(0)] = SIMD8(10, 20, 30, 40, 50, 60, 70, 80)

        #expect(xs[0] == 10)
        #expect(xs[7] == 80)
        #expect(xs[8] == 9)
    }

    @Test func arrayI16Get() {
        let xs: [Int32] = Array(1...32)
        let v0: SIMD16<Int32> = xs[I16(0)]
        let v8: SIMD16<Int32> = xs[I16(8)]

        #expect(v0[0] == 1)
        #expect(v0[15] == 16)
        #expect(v8[0] == 9)
        #expect(v8[15] == 24)
    }

    @Test func arrayI16Set() {
        var xs: [Int32] = Array(1...32)
        var newValue = SIMD16<Int32>()
        for i in 0..<16 { newValue[i] = Int32((i + 1) * 10) }
        xs[I16(0)] = newValue

        #expect(xs[0] == 10)
        #expect(xs[15] == 160)
        #expect(xs[16] == 17)
    }

    @Test func arrayI32Get() {
        let xs: [Int32] = Array(1...64)
        let v0: SIMD32<Int32> = xs[I32(0)]
        let v16: SIMD32<Int32> = xs[I32(16)]

        #expect(v0[0] == 1)
        #expect(v0[31] == 32)
        #expect(v16[0] == 17)
        #expect(v16[31] == 48)
    }

    @Test func arrayI32Set() {
        var xs: [Int32] = Array(1...64)
        var newValue = SIMD32<Int32>()
        for i in 0..<32 { newValue[i] = Int32((i + 1) * 10) }
        xs[I32(0)] = newValue

        #expect(xs[0] == 10)
        #expect(xs[31] == 320)
        #expect(xs[32] == 33)
    }

    @Test func arrayI64Get() {
        let xs: [Int32] = Array(1...128)
        let v0: SIMD64<Int32> = xs[I64(0)]
        let v32: SIMD64<Int32> = xs[I64(32)]

        #expect(v0[0] == 1)
        #expect(v0[63] == 64)
        #expect(v32[0] == 33)
        #expect(v32[63] == 96)
    }

    @Test func arrayI64Set() {
        var xs: [Int32] = Array(1...128)
        var newValue = SIMD64<Int32>()
        for i in 0..<64 { newValue[i] = Int32((i + 1) * 10) }
        xs[I64(0)] = newValue

        #expect(xs[0] == 10)
        #expect(xs[63] == 640)
        #expect(xs[64] == 65)
    }

    @Test func arrayWithFloats() {
        let xs: [Float] = [1.0, 2.0, 3.0, 4.0]
        let v: SIMD4<Float> = xs[I4(0)]
        #expect(v == SIMD4(1.0, 2.0, 3.0, 4.0))
    }

    @Test func arrayWithDoubles() {
        let xs: [Double] = [1.0, 2.0, 3.0, 4.0]
        let v: SIMD4<Double> = xs[I4(0)]
        #expect(v == SIMD4(1.0, 2.0, 3.0, 4.0))
    }
}

// MARK: - Span Subscript Tests

@Suite("Span SIMD Subscripts")
struct SpanSubscriptTests {

    @Test func spanI2Get() {
        let xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let span = xs.span
        let v0: SIMD2<Int32> = span[I2(0)]
        let v2: SIMD2<Int32> = span[I2(2)]
        let v6: SIMD2<Int32> = span[I2(6)]

        #expect(v0 == SIMD2(1, 2))
        #expect(v2 == SIMD2(3, 4))
        #expect(v6 == SIMD2(7, 8))
    }

    @Test func spanI4Get() {
        let xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let span = xs.span
        let v0: SIMD4<Int32> = span[I4(0)]
        let v2: SIMD4<Int32> = span[I4(2)]
        let v4: SIMD4<Int32> = span[I4(4)]

        #expect(v0 == SIMD4(1, 2, 3, 4))
        #expect(v2 == SIMD4(3, 4, 5, 6))
        #expect(v4 == SIMD4(5, 6, 7, 8))
    }

    @Test func spanI8Get() {
        let xs: [Int32] = Array(1...16)
        let span = xs.span
        let v0: SIMD8<Int32> = span[I8(0)]
        let v4: SIMD8<Int32> = span[I8(4)]

        #expect(v0 == SIMD8(1, 2, 3, 4, 5, 6, 7, 8))
        #expect(v4 == SIMD8(5, 6, 7, 8, 9, 10, 11, 12))
    }

    @Test func spanI16Get() {
        let xs: [Int32] = Array(1...32)
        let span = xs.span
        let v0: SIMD16<Int32> = span[I16(0)]
        let v8: SIMD16<Int32> = span[I16(8)]

        #expect(v0[0] == 1)
        #expect(v0[15] == 16)
        #expect(v8[0] == 9)
        #expect(v8[15] == 24)
    }

    @Test func spanI32Get() {
        let xs: [Int32] = Array(1...64)
        let span = xs.span
        let v0: SIMD32<Int32> = span[I32(0)]
        let v16: SIMD32<Int32> = span[I32(16)]

        #expect(v0[0] == 1)
        #expect(v0[31] == 32)
        #expect(v16[0] == 17)
        #expect(v16[31] == 48)
    }

    @Test func spanI64Get() {
        let xs: [Int32] = Array(1...128)
        let span = xs.span
        let v0: SIMD64<Int32> = span[I64(0)]
        let v32: SIMD64<Int32> = span[I64(32)]

        #expect(v0[0] == 1)
        #expect(v0[63] == 64)
        #expect(v32[0] == 33)
        #expect(v32[63] == 96)
    }

    @Test func spanWithFloats() {
        let xs: [Float] = [1.0, 2.0, 3.0, 4.0]
        let span = xs.span
        let v: SIMD4<Float> = span[I4(0)]
        #expect(v == SIMD4(1.0, 2.0, 3.0, 4.0))
    }
}

// MARK: - MutableSpan Subscript Tests

@Suite("MutableSpan SIMD Subscripts")
struct MutableSpanSubscriptTests {

    @Test func mutableSpanI2Get() {
        var base: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let xs = base.mutableSpan
        let v0: SIMD2<Int32> = xs[I2(0)]
        let v2: SIMD2<Int32> = xs[I2(2)]
        let v6: SIMD2<Int32> = xs[I2(6)]

        #expect(v0 == SIMD2(1, 2))
        #expect(v2 == SIMD2(3, 4))
        #expect(v6 == SIMD2(7, 8))
    }

    @Test func mutableSpanI2Set() {
        var base: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        var xs = base.mutableSpan
        xs[I2(0)] = SIMD2(10, 20)
        xs[I2(4)] = SIMD2(50, 60)

        #expect(base == [10, 20, 3, 4, 50, 60, 7, 8])
    }

    @Test func mutableSpanI4Get() {
        var base: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let xs = base.mutableSpan
        let v0: SIMD4<Int32> = xs[I4(0)]
        let v2: SIMD4<Int32> = xs[I4(2)]
        let v4: SIMD4<Int32> = xs[I4(4)]

        #expect(v0 == SIMD4(1, 2, 3, 4))
        #expect(v2 == SIMD4(3, 4, 5, 6))
        #expect(v4 == SIMD4(5, 6, 7, 8))
    }

    @Test func mutableSpanI4Set() {
        var base: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        var xs = base.mutableSpan
        xs[I4(0)] = SIMD4(10, 20, 30, 40)

        #expect(base == [10, 20, 30, 40, 5, 6, 7, 8])
    }

    @Test func mutableSpanI8Get() {
        var base: [Int32] = Array(1...16)
        let xs = base.mutableSpan
        let v0: SIMD8<Int32> = xs[I8(0)]
        let v4: SIMD8<Int32> = xs[I8(4)]

        #expect(v0 == SIMD8(1, 2, 3, 4, 5, 6, 7, 8))
        #expect(v4 == SIMD8(5, 6, 7, 8, 9, 10, 11, 12))
    }

    @Test func mutableSpanI8Set() {
        var base: [Int32] = Array(1...16)
        var xs = base.mutableSpan
        xs[I8(0)] = SIMD8(10, 20, 30, 40, 50, 60, 70, 80)

        #expect(xs[0] == 10)
        #expect(xs[7] == 80)
        #expect(xs[8] == 9)
    }

    @Test func mutableSpanI16Get() {
        var base: [Int32] = Array(1...32)
        let xs = base.mutableSpan
        let v0: SIMD16<Int32> = xs[I16(0)]
        let v8: SIMD16<Int32> = xs[I16(8)]

        #expect(v0[0] == 1)
        #expect(v0[15] == 16)
        #expect(v8[0] == 9)
        #expect(v8[15] == 24)
    }

    @Test func mutableSpanI16Set() {
        var base: [Int32] = Array(1...32)
        var newValue = SIMD16<Int32>()
        for i in 0..<16 { newValue[i] = Int32((i + 1) * 10) }
        var xs = base.mutableSpan
        xs[I16(0)] = newValue

        #expect(xs[0] == 10)
        #expect(xs[15] == 160)
        #expect(xs[16] == 17)
    }

    @Test func mutableSpanI32Get() {
        var base: [Int32] = Array(1...64)
        let xs = base.mutableSpan
        let v0: SIMD32<Int32> = xs[I32(0)]
        let v16: SIMD32<Int32> = xs[I32(16)]

        #expect(v0[0] == 1)
        #expect(v0[31] == 32)
        #expect(v16[0] == 17)
        #expect(v16[31] == 48)
    }

   @Test func mutableSpanI32Set() {
        var base: [Int32] = Array(1...64)
        var newValue = SIMD32<Int32>()
        for i in 0..<32 { newValue[i] = Int32((i + 1) * 10) }
        var xs = base.mutableSpan
        xs[I32(0)] = newValue

        #expect(xs[0] == 10)
        #expect(xs[31] == 320)
        #expect(xs[32] == 33)
    }

    @Test func mutableSpanI64Get() {
        var base: [Int32] = Array(1...128)
        let xs = base.mutableSpan
        let v0: SIMD64<Int32> = xs[I64(0)]
        let v32: SIMD64<Int32> = xs[I64(32)]

        #expect(v0[0] == 1)
        #expect(v0[63] == 64)
        #expect(v32[0] == 33)
        #expect(v32[63] == 96)
    }

    @Test func mutableSpanI64Set() {
        var base: [Int32] = Array(1...128)
        var newValue = SIMD64<Int32>()
        for i in 0..<64 { newValue[i] = Int32((i + 1) * 10) }
        var xs = base.mutableSpan
        xs[I64(0)] = newValue

        #expect(xs[0] == 10)
        #expect(xs[63] == 640)
        #expect(xs[64] == 65)
    }

    @Test func mutableSpanWithFloats() {
        var base: [Float] = [1.0, 2.0, 3.0, 4.0]
        var xs = base.mutableSpan
        let v: SIMD4<Float> = xs[I4(0)]
        #expect(v == SIMD4(1.0, 2.0, 3.0, 4.0))
    
        xs[I4(0)] = SIMD4(10.0, 20.0, 30.0, 40.0)
        #expect(base == [10.0, 20.0, 30.0, 40.0])
    }
}

// MARK: - ScalarIndex Tests (from SIMDUtils.swift)

@Suite("ScalarIndex Subscripts")
struct ScalarIndexSubscriptTests {

    @Test func arrayScalarIndexGet() {
        let xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let v: SIMD4<Int32> = xs[ScalarIndex(2)]
        #expect(v == SIMD4(3, 4, 5, 6))
    }

    @Test func arrayScalarIndexSet() {
        var xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        xs[ScalarIndex(2)] = SIMD4<Int32>(30, 40, 50, 60)
        #expect(xs == [1, 2, 30, 40, 50, 60, 7, 8])
    }

    @Test func spanScalarIndexGet() {
        let xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let span = xs.span
        let v: SIMD4<Int32> = span[ScalarIndex(2)]
        #expect(v == SIMD4(3, 4, 5, 6))
    }

    @Test func mutableSpanScalarIndexGet() {
        var xs: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        let v: SIMD4<Int32> = xs.mutableSpan[ScalarIndex(2)]
        #expect(v == SIMD4(3, 4, 5, 6))
    }

    @Test func mutableSpanScalarIndexSet() {
        var base: [Int32] = [1, 2, 3, 4, 5, 6, 7, 8]
        var xs = base.mutableSpan
        xs[ScalarIndex(2)] = SIMD4<Int32>(30, 40, 50, 60)
        #expect(base == [1, 2, 30, 40, 50, 60, 7, 8])
    }
}
