module attributes {hlo.unique_id = 43 : i32, mhlo.unique_id = 43 : i64} {
  memref.global "private" constant @buffer_for_constant_162 : memref<f32> = dense<3.200000e+01> {lmhlo.alloc = 13 : index}
  memref.global "private" constant @buffer_for_constant_165 : memref<i32> = dense<32> {lmhlo.alloc = 12 : index}
  memref.global "private" constant @buffer_for_constant_33 : memref<i32> = dense<0> {lmhlo.alloc = 15 : index}
  memref.global "private" constant @buffer_for_constant_32 : memref<f32> = dense<0xFF800000> {lmhlo.alloc = 14 : index}
  func @cluster_2__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_6_.174(%arg0: memref<100352xi8> {lmhlo.params = 0 : index}, %arg1: memref<32xi8> {lmhlo.params = 1 : index}, %arg2: memref<512xi8> {lmhlo.params = 2 : index}, %arg3: memref<401408xi8> {lmhlo.params = 3 : index}, %arg4: memref<40xi8> {lmhlo.params = 4 : index}, %arg5: memref<5120xi8> {lmhlo.params = 5 : index}, %arg6: memref<4xi8> {lmhlo.params = 6 : index}, %arg7: memref<4xi8> {lmhlo.params = 7 : index}, %arg8: memref<4xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg9: memref<4xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg10: memref<4xi8> {lmhlo.output_index = dense<2> : tensor<1xi64>}, %arg11: memref<4xi8> {lmhlo.output_index = dense<3> : tensor<1xi64>}, %arg12: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_165"}, %arg13: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_162"}, %arg14: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_32"}, %arg15: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_33"}, %arg16: memref<17808xi8>) attributes {result_xla_shape = "(s32[], f32[], f32[], f32[])"} {
    %c0 = arith.constant 0 : index
    %0 = memref.view %arg2[%c0][] : memref<512xi8> to memref<128xf32>
    %c0_0 = arith.constant 0 : index
    %1 = memref.view %arg16[%c0_0][] : memref<17808xi8> to memref<32x128xf32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %0 : memref<128xf32>
      %30 = "mhlo.broadcast_in_dim"(%29) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<32x128xf32>
      memref.tensor_store %30, %1 : memref<32x128xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_1 = arith.constant 0 : index
    %2 = memref.view %arg0[%c0_1][] : memref<100352xi8> to memref<32x784xf32>
    %c0_2 = arith.constant 0 : index
    %3 = memref.view %arg3[%c0_2][] : memref<401408xi8> to memref<784x128xf32>
    %c0_3 = arith.constant 0 : index
    %4 = memref.view %arg16[%c0_3][] : memref<17808xi8> to memref<32x128xf32>
    "lmhlo_gpu.gemm_bias"(%2, %3, %1, %4) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, batch_size = 1 : i64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>, lhs_stride = 25088 : i64, rhs_stride = 100352 : i64} : (memref<32x784xf32>, memref<784x128xf32>, memref<32x128xf32>, memref<32x128xf32>) -> ()
    %c0_4 = arith.constant 0 : index
    %5 = memref.view %arg16[%c0_4][] : memref<17808xi8> to memref<32x128xf32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %4 : memref<32x128xf32>
      %30 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %31 = "mhlo.broadcast_in_dim"(%30) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x128xf32>
      %32 = mhlo.maximum %29, %31 : tensor<32x128xf32>
      memref.tensor_store %32, %5 : memref<32x128xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_5 = arith.constant 0 : index
    %6 = memref.view %arg4[%c0_5][] : memref<40xi8> to memref<10xf32>
    %c16384 = arith.constant 16384 : index
    %7 = memref.view %arg16[%c16384][] : memref<17808xi8> to memref<32x10xf32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %6 : memref<10xf32>
      %30 = "mhlo.broadcast_in_dim"(%29) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<32x10xf32>
      memref.tensor_store %30, %7 : memref<32x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_6 = arith.constant 0 : index
    %8 = memref.view %arg5[%c0_6][] : memref<5120xi8> to memref<128x10xf32>
    %c16384_7 = arith.constant 16384 : index
    %9 = memref.view %arg16[%c16384_7][] : memref<17808xi8> to memref<32x10xf32>
    "lmhlo_gpu.gemm_bias"(%5, %8, %7, %9) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, batch_size = 1 : i64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>, lhs_stride = 4096 : i64, rhs_stride = 1280 : i64} : (memref<32x128xf32>, memref<128x10xf32>, memref<32x10xf32>, memref<32x10xf32>) -> ()
    %10 = memref.get_global @buffer_for_constant_32 : memref<f32>
    %c0_8 = arith.constant 0 : index
    %11 = memref.view %arg16[%c0_8][] : memref<17808xi8> to memref<32xf32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %9 : memref<32x10xf32>
      %30 = bufferization.to_tensor %10 : memref<f32>
      %31 = mhlo.reduce(%29 init: %30) across dimensions = [1] : (tensor<32x10xf32>, tensor<f32>) -> tensor<32xf32>
       reducer(%arg17: tensor<f32>, %arg18: tensor<f32>)  {
        %32 = mhlo.maximum %arg17, %arg18 : tensor<f32>
        "mhlo.return"(%32) : (tensor<f32>) -> ()
      }
      memref.tensor_store %31, %11 : memref<32xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c128 = arith.constant 128 : index
    %12 = memref.view %arg16[%c128][] : memref<17808xi8> to memref<32xf32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %9 : memref<32x10xf32>
      %30 = bufferization.to_tensor %11 : memref<32xf32>
      %31 = "mhlo.broadcast_in_dim"(%30) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %32 = mhlo.subtract %29, %31 : tensor<32x10xf32>
      %33 = "mhlo.exponential"(%32) : (tensor<32x10xf32>) -> tensor<32x10xf32>
      %34 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %35 = mhlo.reduce(%33 init: %34) across dimensions = [1] : (tensor<32x10xf32>, tensor<f32>) -> tensor<32xf32>
       reducer(%arg17: tensor<f32>, %arg18: tensor<f32>)  {
        %37 = mhlo.add %arg17, %arg18 : tensor<f32>
        "mhlo.return"(%37) : (tensor<f32>) -> ()
      }
      %36 = "mhlo.log"(%35) : (tensor<32xf32>) -> tensor<32xf32>
      memref.tensor_store %36, %12 : memref<32xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_9 = arith.constant 0 : index
    %13 = memref.view %arg1[%c0_9][] : memref<32xi8> to memref<32xui8>
    %c0_10 = arith.constant 0 : index
    %14 = memref.view %arg11[%c0_10][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %12 : memref<32xf32>
      %30 = bufferization.to_tensor %13 : memref<32xui8>
      %31 = bufferization.to_tensor %9 : memref<32x10xf32>
      %32 = bufferization.to_tensor %11 : memref<32xf32>
      %33 = "mhlo.convert"(%30) : (tensor<32xui8>) -> tensor<32xi64>
      %34 = "mhlo.broadcast_in_dim"(%33) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xi64>) -> tensor<32x10xi64>
      %35 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<32x10xi64>
      %36 = "mhlo.compare"(%34, %35) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32x10xi64>, tensor<32x10xi64>) -> tensor<32x10xi1>
      %37 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %38 = "mhlo.broadcast_in_dim"(%37) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %39 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %40 = "mhlo.broadcast_in_dim"(%39) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %41 = "mhlo.select"(%36, %38, %40) : (tensor<32x10xi1>, tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xf32>
      %42 = mhlo.constant dense<0> : tensor<i64>
      %43 = "mhlo.broadcast_in_dim"(%42) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<i64>) -> tensor<32xi64>
      %44 = "mhlo.compare"(%43, %33) {comparison_direction = #mhlo<"comparison_direction LE">} : (tensor<32xi64>, tensor<32xi64>) -> tensor<32xi1>
      %45 = mhlo.constant dense<10> : tensor<i64>
      %46 = "mhlo.broadcast_in_dim"(%45) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<i64>) -> tensor<32xi64>
      %47 = "mhlo.compare"(%33, %46) {comparison_direction = #mhlo<"comparison_direction LT">} : (tensor<32xi64>, tensor<32xi64>) -> tensor<32xi1>
      %48 = mhlo.and %44, %47 : tensor<32xi1>
      %49 = "mhlo.broadcast_in_dim"(%39) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32xf32>
      %50 = mhlo.constant dense<0x7FC00000> : tensor<f32>
      %51 = "mhlo.broadcast_in_dim"(%50) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32xf32>
      %52 = "mhlo.select"(%48, %49, %51) : (tensor<32xi1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
      %53 = "mhlo.broadcast_in_dim"(%52) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %54 = mhlo.add %41, %53 : tensor<32x10xf32>
      %55 = "mhlo.negate"(%54) : (tensor<32x10xf32>) -> tensor<32x10xf32>
      %56 = "mhlo.compare"(%54, %40) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xi1>
      %57 = "mhlo.broadcast_in_dim"(%32) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %58 = mhlo.subtract %31, %57 : tensor<32x10xf32>
      %59 = "mhlo.broadcast_in_dim"(%29) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %60 = mhlo.subtract %58, %59 : tensor<32x10xf32>
      %61 = "mhlo.select"(%56, %40, %60) : (tensor<32x10xi1>, tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xf32>
      %62 = mhlo.multiply %55, %61 : tensor<32x10xf32>
      %63 = "mhlo.bitcast"(%62) {result_layout = dense<0> : tensor<1xindex>, source_layout = dense<[1, 0]> : tensor<2xindex>} : (tensor<32x10xf32>) -> tensor<320xf32>
      %64 = mhlo.reduce(%63 init: %39) across dimensions = [0] : (tensor<320xf32>, tensor<f32>) -> tensor<f32>
       reducer(%arg17: tensor<f32>, %arg18: tensor<f32>)  {
        %65 = mhlo.add %arg17, %arg18 : tensor<f32>
        "mhlo.return"(%65) : (tensor<f32>) -> ()
      }
      memref.tensor_store %64, %14 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_11 = arith.constant 0 : index
    %15 = memref.view %arg16[%c0_11][] : memref<17808xi8> to memref<32x10xi32>
    "lmhlo.fusion"() ({
      %29 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<32x10xi32>
      memref.tensor_store %29, %15 : memref<32x10xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %16 = memref.get_global @buffer_for_constant_33 : memref<i32>
    %c1280 = arith.constant 1280 : index
    %17 = memref.view %arg16[%c1280][] : memref<17808xi8> to memref<32xf32>
    %c1408 = arith.constant 1408 : index
    %18 = memref.view %arg16[%c1408][] : memref<17808xi8> to memref<32xi32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %9 : memref<32x10xf32>
      %30 = bufferization.to_tensor %15 : memref<32x10xi32>
      %31 = bufferization.to_tensor %10 : memref<f32>
      %32 = bufferization.to_tensor %16 : memref<i32>
      %33:2 = mhlo.reduce(%29 init: %31), (%30 init: %32) across dimensions = [1] : (tensor<32x10xf32>, tensor<32x10xi32>, tensor<f32>, tensor<i32>) -> (tensor<32xf32>, tensor<32xi32>)
       reducer(%arg17: tensor<f32>, %arg19: tensor<f32>) (%arg18: tensor<i32>, %arg20: tensor<i32>)  {
        %34:2 = "mhlo.fusion"(%arg18, %arg20, %arg17, %arg19) ({
        ^bb0(%arg21: tensor<i32>, %arg22: tensor<i32>, %arg23: tensor<f32>, %arg24: tensor<f32>):
          %35 = "mhlo.compare"(%arg23, %arg24) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %36 = mhlo.minimum %arg21, %arg22 : tensor<i32>
          %37 = "mhlo.compare"(%arg23, %arg24) {comparison_direction = #mhlo<"comparison_direction GE">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %38 = "mhlo.select"(%37, %arg21, %arg22) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %39 = "mhlo.select"(%35, %36, %38) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %40 = "mhlo.select"(%37, %arg23, %arg24) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
          "mhlo.return"(%39, %40) : (tensor<i32>, tensor<f32>) -> ()
        }) {fusion_kind = #mhlo<"fusion_kind kLoop">} : (tensor<i32>, tensor<i32>, tensor<f32>, tensor<f32>) -> (tensor<i32>, tensor<f32>)
        "mhlo.return"(%34#1, %34#0) : (tensor<f32>, tensor<i32>) -> ()
      }
      memref.tensor_store %33#0, %17 : memref<32xf32>
      memref.tensor_store %33#1, %18 : memref<32xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c1408_12 = arith.constant 1408 : index
    %19 = memref.view %arg16[%c1408_12][] : memref<17808xi8> to memref<32xi32>
    %c0_13 = arith.constant 0 : index
    %20 = memref.view %arg10[%c0_13][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %19 : memref<32xi32>
      %30 = bufferization.to_tensor %13 : memref<32xui8>
      %31 = "mhlo.convert"(%30) : (tensor<32xui8>) -> tensor<32xf32>
      %32 = "mhlo.convert"(%29) : (tensor<32xi32>) -> tensor<32xi64>
      %33 = "mhlo.convert"(%32) : (tensor<32xi64>) -> tensor<32xf32>
      %34 = "mhlo.compare"(%31, %33) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32xf32>, tensor<32xf32>) -> tensor<32xi1>
      %35 = "mhlo.convert"(%34) : (tensor<32xi1>) -> tensor<32xf32>
      %36 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %37 = mhlo.reduce(%35 init: %36) across dimensions = [0] : (tensor<32xf32>, tensor<f32>) -> tensor<f32>
       reducer(%arg17: tensor<f32>, %arg18: tensor<f32>)  {
        %38 = mhlo.add %arg17, %arg18 : tensor<f32>
        "mhlo.return"(%38) : (tensor<f32>) -> ()
      }
      memref.tensor_store %37, %20 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_14 = arith.constant 0 : index
    %21 = memref.view %arg6[%c0_14][] : memref<4xi8> to memref<f32>
    %c0_15 = arith.constant 0 : index
    %22 = memref.view %arg7[%c0_15][] : memref<4xi8> to memref<f32>
    %c0_16 = arith.constant 0 : index
    %23 = memref.view %arg10[%c0_16][] : memref<4xi8> to memref<1xf32>
    %c0_17 = arith.constant 0 : index
    %24 = memref.view %arg11[%c0_17][] : memref<4xi8> to memref<1xf32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %21 : memref<f32>
      %30 = bufferization.to_tensor %20 : memref<f32>
      %31 = bufferization.to_tensor %22 : memref<f32>
      %32 = bufferization.to_tensor %14 : memref<f32>
      %33 = mhlo.add %29, %30 : tensor<f32>
      %34 = "mhlo.reshape"(%33) : (tensor<f32>) -> tensor<1xf32>
      %35 = mhlo.add %31, %32 : tensor<f32>
      %36 = "mhlo.reshape"(%35) : (tensor<f32>) -> tensor<1xf32>
      %37 = "mhlo.concatenate"(%34, %36) {dimension = 0 : i64} : (tensor<1xf32>, tensor<1xf32>) -> tensor<2xf32>
      %38 = "mhlo.slice"(%37) {limit_indices = dense<1> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      %39 = "mhlo.slice"(%37) {limit_indices = dense<2> : tensor<1xi64>, start_indices = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      memref.tensor_store %38, %23 : memref<1xf32>
      memref.tensor_store %39, %24 : memref<1xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %25 = memref.get_global @buffer_for_constant_165 : memref<i32>
    %c0_18 = arith.constant 0 : index
    %26 = memref.view %arg8[%c0_18][] : memref<4xi8> to memref<i32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %25 : memref<i32>
      %30 = "mhlo.copy"(%29) : (tensor<i32>) -> tensor<i32>
      memref.tensor_store %30, %26 : memref<i32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %27 = memref.get_global @buffer_for_constant_162 : memref<f32>
    %c0_19 = arith.constant 0 : index
    %28 = memref.view %arg9[%c0_19][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %29 = bufferization.to_tensor %27 : memref<f32>
      %30 = "mhlo.copy"(%29) : (tensor<f32>) -> tensor<f32>
      memref.tensor_store %30, %28 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}