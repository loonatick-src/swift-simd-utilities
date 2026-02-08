import SIMDUtils

let xs = [1, 2, 3, 4, 5, 6, 7, 8]
assert(xs[I2(0)] == SIMD2(1, 2))
assert(xs[I4(0)] == SIMD4(1, 2, 3, 4))
assert(xs[I4(2)] == SIMD4(3, 4, 5, 6))

func saxpy(_ ys: inout [Float32], _ xs: [Float32], a: Float32) {
    precondition(ys.count == xs.count)
    precondition(xs.count % 8 == 0)
    let x = xs.span
    var y = ys.mutableSpan
    var i = 0
    while i < xs.count {
        defer { i += 8 }
        let x1: SIMD4<Float32> = x[I4(i)]
        let x2: SIMD4<Float32> = x[I4(i+4)]
        let y1: SIMD4<Float32> = y[I4(i)]
        let y2: SIMD4<Float32> = y[I4(i+4)]
        y[I4(i)] = a * x1 + y1
        y[I4(i+4)] = a * x2 + y2
    }
    return
}

// Test saxpy
var ys: [Float32] = [1, 2, 3, 4, 5, 6, 7, 8]
let xsFloat: [Float32] = [1, 1, 1, 1, 1, 1, 1, 1]
saxpy(&ys, xsFloat, a: 2.0)
print("saxpy result: \(ys)")
// Expected: [3, 4, 5, 6, 7, 8, 9, 10] (y = 2*x + y = 2*1 + original)
