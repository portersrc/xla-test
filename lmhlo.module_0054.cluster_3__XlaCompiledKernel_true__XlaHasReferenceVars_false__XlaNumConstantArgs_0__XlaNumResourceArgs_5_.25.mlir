module attributes {hlo.unique_id = 54 : i32, mhlo.unique_id = 54 : i64} {
  memref.global "private" constant @buffer_for_constant_12 : memref<i64> = dense<1> {lmhlo.alloc = 6 : index}
  func @cluster_3__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_5_.25(%arg0: memref<4xi8> {lmhlo.params = 0 : index}, %arg1: memref<4xi8> {lmhlo.params = 1 : index}, %arg2: memref<4xi8> {lmhlo.params = 2 : index}, %arg3: memref<4xi8> {lmhlo.params = 3 : index}, %arg4: memref<8xi8> {lmhlo.params = 4 : index}, %arg5: memref<8xi8> {lmhlo.output_index = dense<2> : tensor<1xi64>}, %arg6: memref<8xi8> {lmhlo.constant_name = "buffer_for_constant_12"}, %arg7: memref<4xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg8: memref<4xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg9: memref<16xi8>) attributes {result_xla_shape = "(f32[], f32[], s64[])"} {
    %0 = memref.get_global @buffer_for_constant_12 : memref<i64>
    %c0 = arith.constant 0 : index
    %1 = memref.view %arg4[%c0][] : memref<8xi8> to memref<i64>
    %c0_0 = arith.constant 0 : index
    %2 = memref.view %arg5[%c0_0][] : memref<8xi8> to memref<i64>
    "lmhlo.fusion"() ({
      %9 = bufferization.to_tensor %1 : memref<i64>
      %10 = bufferization.to_tensor %0 : memref<i64>
      %11 = mhlo.add %9, %10 : tensor<i64>
      memref.tensor_store %11, %2 : memref<i64>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_1 = arith.constant 0 : index
    %3 = memref.view %arg0[%c0_1][] : memref<4xi8> to memref<f32>
    %c0_2 = arith.constant 0 : index
    %4 = memref.view %arg1[%c0_2][] : memref<4xi8> to memref<f32>
    %c0_3 = arith.constant 0 : index
    %5 = memref.view %arg2[%c0_3][] : memref<4xi8> to memref<f32>
    %c0_4 = arith.constant 0 : index
    %6 = memref.view %arg3[%c0_4][] : memref<4xi8> to memref<f32>
    %c0_5 = arith.constant 0 : index
    %7 = memref.view %arg7[%c0_5][] : memref<4xi8> to memref<1xf32>
    %c0_6 = arith.constant 0 : index
    %8 = memref.view %arg8[%c0_6][] : memref<4xi8> to memref<1xf32>
    "lmhlo.fusion"() ({
      %9 = bufferization.to_tensor %3 : memref<f32>
      %10 = bufferization.to_tensor %4 : memref<f32>
      %11 = bufferization.to_tensor %5 : memref<f32>
      %12 = bufferization.to_tensor %6 : memref<f32>
      %13 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %14 = "mhlo.compare"(%10, %13) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
      %15 = mhlo.divide %9, %10 : tensor<f32>
      %16 = "mhlo.select"(%14, %13, %15) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
      %17 = "mhlo.reshape"(%16) : (tensor<f32>) -> tensor<1xf32>
      %18 = "mhlo.compare"(%12, %13) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
      %19 = mhlo.divide %11, %12 : tensor<f32>
      %20 = "mhlo.select"(%18, %13, %19) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
      %21 = "mhlo.reshape"(%20) : (tensor<f32>) -> tensor<1xf32>
      %22 = "mhlo.concatenate"(%17, %21) {dimension = 0 : i64} : (tensor<1xf32>, tensor<1xf32>) -> tensor<2xf32>
      %23 = "mhlo.slice"(%22) {limit_indices = dense<1> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      %24 = "mhlo.slice"(%22) {limit_indices = dense<2> : tensor<1xi64>, start_indices = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      memref.tensor_store %23, %7 : memref<1xf32>
      memref.tensor_store %24, %8 : memref<1xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}