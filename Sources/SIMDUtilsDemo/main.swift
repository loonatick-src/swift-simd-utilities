import SIMDUtils

var array = [1, 2, 3, 4, 5, 6, 7, 8]
// SIMD loads
assert(array[I2(0)] == SIMD2(1, 2))        // 2-wide SIMD from start of array, scalar type inferred
assert(array[I4(0)] == SIMD4(1, 2, 3, 4))  // 4-wide SIMD from start of array, scalar type inferred
assert(array[I4(2)] == SIMD4(3, 4, 5, 6))  // 4-wide SIMD from offset 2, scalar type inferred

func load4<T: SIMDScalar>(_ array: [T], at index: Int) -> SIMD4<T> {
    array[I(index)]  // SIMD width and scalar type inferred
}

assert(load4(array, at: 3) == SIMD4(4, 5, 6, 7))

// SIMD stores
// XXX: is there a difference between using a subscript setter and just using a mutating function?
// NOTE: Array subscript setters are deliberately not provided
// use `Array.mutableSpan` instead (see saxpy example below)
array.storeSIMD(value: SIMD4(10, 20, 30, 40), at: 0)
assert(array == [10, 20, 30, 40, 5, 6, 7, 8])
array.storeSIMD(value: SIMD2(42, 99), at: 3)
assert(array == [10, 20, 30, 42, 99, 6, 7, 8])

func saxpyManualSIMD(_ ys: inout [Float32], _ xs: [Float32], a: Float32) {
    guard xs.count > 0 else {
        return
    }
    precondition(ys.count == xs.count)
    precondition(xs.count % 8 == 0)
    let x = xs.span
    var y = ys.mutableSpan
    var i = 0
    let av = SIMD4(repeating: a)
    while i < x.count {
        defer { i &+= 8 }
        let x1 = x[I4(i)]
        let x2 = x[I4(i &+ 4)]
        let y1 = y[I4(i)]
        let y2 = y[I4(i &+ 4)]
        y[I4(i)] = av * x1 + y1
        y[I4(i+4)] = av * x2 + y2
    }
}

public func saxpy(_ ys: inout [Float32], _ xs: [Float32], a: Float32) {
    precondition(ys.count == xs.count)
    precondition(xs.count % 8 == 0)
    let x = xs.span
    var y = ys.mutableSpan
    for i in y.indices {
        y[i] += a * x[i]
    }
}

// Test saxpy
var ys1: [Float32] = [1, 2, 3, 4, 5, 6, 7, 8]
var ys2 = ys1
let xs: [Float32] = [1, 1, 1, 1, 1, 1, 1, 1]
saxpyManualSIMD(&ys1, xs, a: 2.0)
saxpy(&ys2, xs, a: 2.0)
// Expected: [3, 4, 5, 6, 7, 8, 9, 10] (y = 2*x + y = 2*1 + original)
print("saxpyManualSIMD: \(ys1)")
print("saxpy:           \(ys2)")
assert(ys1 == ys2)
