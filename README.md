# SIMD Utils
**Work in progress!**
The missing SIMD load and store operations. I got tired of seeing stuff like `Array<SIMD4<Float32>>` etc.

```
swift build -Xswiftc -enable-experimental-feature -Xswiftc Lifetimes
```

Example usage.
```swift
import SIMDUtils

let xs = [1, 2, 3, 4, 5, 6, 7, 8]
assert(xs[I2(0)] == SIMD2(1, 2))
assert(xs[I4(0) == SIMD4(1, 2, 3, 4))
assert(xs[I4(2) == SIMD4(3, 4, 5, 6))

func saxpy(_ ys: inout [Float32], _ xs: [Float32], a: Float32) {
    precondition(ys.count == xs.count)
    precondition(xs.count % 8 == 0)
    let x = xs.span
    var y = ys.mutableSpan
    var i = 0
    while i < xs.count {
        defer { i += 8 }
        let x1 = xs[I4(i)]
        let x2 = xs[I4(i+4)]
        let y1 = ys[I4(i)]
        let y2 = ys[I4(i+4)]
        y[I4(i)] = a * x1 + y1
        y[I4(i+4)] = a * x2 + y2
    }
    return
}
```

Codegen (`swift build -c release -Xswiftc -Ounchecked -Xswiftc -enable-experimental-feature -Xswiftc Lifetimes`):

```
.loop:
ldp     q0, q1, [x9, #-0x10]
ldp     q2, q3, [x10, #-0x10]
fmul.4s v0, v0, v4[0]
fadd.4s v0, v0, v2
fmul.4s v1, v1, v4[0]
fadd.4s v1, v1, v3
stp     q0, q1, [x10, #-0x10]
add     x8, x8, #0x8
add     x9, x9, #0x20
add     x10, x10, #0x20
cmp     x8, x22
b.lt    .loop
```

This does not beat the codegen that autovectorization is capable of, but this is just an example of what kind of codegen to expect.


# TODO
1. [ ] Support multiple Swift and macOS versions using `@available` and friends.
2. [ ] Loicense
3. [ ] Refactor into separate source files
4. [ ] Benchmarks
5. [ ] Property tests
6. [ ] Test with RelaxedMacro
