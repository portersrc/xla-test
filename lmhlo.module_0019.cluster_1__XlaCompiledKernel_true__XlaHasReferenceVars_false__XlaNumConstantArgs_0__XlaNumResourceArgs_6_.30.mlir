module attributes {hlo.unique_id = 19 : i32, mhlo.unique_id = 19 : i64} {
  memref.global "private" constant @buffer_for_constant_7 : memref<i64> = dense<1> {lmhlo.alloc = 8 : index}
  func @cluster_1__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_6_.30(%arg0: memref<4xi8> {lmhlo.params = 0 : index}, %arg1: memref<4xi8> {lmhlo.params = 1 : index}, %arg2: memref<4xi8> {lmhlo.params = 2 : index}, %arg3: memref<4xi8> {lmhlo.params = 3 : index}, %arg4: memref<8xi8> {lmhlo.params = 4 : index}, %arg5: memref<8xi8> {lmhlo.params = 5 : index}, %arg6: memref<8xi8> {lmhlo.output_index = dense<2> : tensor<1xi64>}, %arg7: memref<8xi8> {lmhlo.output_index = dense<3> : tensor<1xi64>}, %arg8: memref<8xi8> {lmhlo.constant_name = "buffer_for_constant_7"}, %arg9: memref<4xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg10: memref<4xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg11: memref<144xi8>) attributes {result_xla_shape = "(f32[], f32[], s64[], s64[])"} {
    %0 = memref.get_global @buffer_for_constant_7 : memref<i64>
    %c0 = arith.constant 0 : index
    %1 = memref.view %arg2[%c0][] : memref<4xi8> to memref<f32>
    %c0_0 = arith.constant 0 : index
    %2 = memref.view %arg3[%c0_0][] : memref<4xi8> to memref<f32>
    %c0_1 = arith.constant 0 : index
    %3 = memref.view %arg0[%c0_1][] : memref<4xi8> to memref<f32>
    %c0_2 = arith.constant 0 : index
    %4 = memref.view %arg1[%c0_2][] : memref<4xi8> to memref<f32>
    %c0_3 = arith.constant 0 : index
    %5 = memref.view %arg9[%c0_3][] : memref<4xi8> to memref<1xf32>
    %c0_4 = arith.constant 0 : index
    %6 = memref.view %arg10[%c0_4][] : memref<4xi8> to memref<1xf32>
    "lmhlo.fusion"() ({
      %11 = bufferization.to_tensor %1 : memref<f32>
      %12 = bufferization.to_tensor %2 : memref<f32>
      %13 = bufferization.to_tensor %3 : memref<f32>
      %14 = bufferization.to_tensor %4 : memref<f32>
      %15 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %16 = "mhlo.compare"(%12, %15) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
      %17 = mhlo.divide %11, %12 : tensor<f32>
      %18 = "mhlo.select"(%16, %15, %17) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
      %19 = "mhlo.reshape"(%18) : (tensor<f32>) -> tensor<1xf32>
      %20 = "mhlo.compare"(%14, %15) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
      %21 = mhlo.divide %13, %14 : tensor<f32>
      %22 = "mhlo.select"(%20, %15, %21) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
      %23 = "mhlo.reshape"(%22) : (tensor<f32>) -> tensor<1xf32>
      %24 = "mhlo.concatenate"(%19, %23) {dimension = 0 : i64} : (tensor<1xf32>, tensor<1xf32>) -> tensor<2xf32>
      %25 = "mhlo.slice"(%24) {limit_indices = dense<1> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      %26 = "mhlo.slice"(%24) {limit_indices = dense<2> : tensor<1xi64>, start_indices = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      memref.tensor_store %25, %5 : memref<1xf32>
      memref.tensor_store %26, %6 : memref<1xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_5 = arith.constant 0 : index
    %7 = memref.view %arg4[%c0_5][] : memref<8xi8> to memref<i64>
    %c0_6 = arith.constant 0 : index
    %8 = memref.view %arg5[%c0_6][] : memref<8xi8> to memref<i64>
    %c0_7 = arith.constant 0 : index
    %9 = memref.view %arg6[%c0_7][] : memref<8xi8> to memref<1xi64>
    %c0_8 = arith.constant 0 : index
    %10 = memref.view %arg7[%c0_8][] : memref<8xi8> to memref<1xi64>
    "lmhlo.fusion"() ({
      %11 = bufferization.to_tensor %7 : memref<i64>
      %12 = bufferization.to_tensor %0 : memref<i64>
      %13 = bufferization.to_tensor %8 : memref<i64>
      %14 = bufferization.to_tensor %0 : memref<i64>
      %15 = mhlo.add %11, %12 : tensor<i64>
      %16 = "mhlo.reshape"(%15) : (tensor<i64>) -> tensor<1xi64>
      %17 = mhlo.add %13, %14 : tensor<i64>
      %18 = "mhlo.reshape"(%17) : (tensor<i64>) -> tensor<1xi64>
      %19 = "mhlo.concatenate"(%16, %18) {dimension = 0 : i64} : (tensor<1xi64>, tensor<1xi64>) -> tensor<2xi64>
      %20 = "mhlo.slice"(%19) {limit_indices = dense<1> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xi64>) -> tensor<1xi64>
      %21 = "mhlo.slice"(%19) {limit_indices = dense<2> : tensor<1xi64>, start_indices = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xi64>) -> tensor<1xi64>
      memref.tensor_store %20, %9 : memref<1xi64>
      memref.tensor_store %21, %10 : memref<1xi64>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}