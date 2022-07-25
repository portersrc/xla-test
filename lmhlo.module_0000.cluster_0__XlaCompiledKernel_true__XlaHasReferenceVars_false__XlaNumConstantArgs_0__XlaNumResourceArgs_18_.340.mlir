module attributes {hlo.unique_id = 0 : i32, mhlo.unique_id = 0 : i64} {
  memref.global "private" constant @buffer_for_constant_60 : memref<f32> = dense<0xFF800000> {lmhlo.alloc = 37 : index}
  memref.global "private" constant @buffer_for_constant_61 : memref<i32> = dense<0> {lmhlo.alloc = 39 : index}
  memref.global "private" constant @buffer_for_constant_151 : memref<f32> = dense<-0.000000e+00> {lmhlo.alloc = 38 : index}
  memref.global "private" constant @buffer_for_constant_306 : memref<f32> = dense<3.200000e+01> {lmhlo.alloc = 36 : index}
  func @cluster_0__XlaCompiledKernel_true__XlaHasReferenceVars_false__XlaNumConstantArgs_0__XlaNumResourceArgs_18_.340(%arg0: memref<16384xi8> {lmhlo.params = 0 : index}, %arg1: memref<100352xi8> {lmhlo.params = 1 : index}, %arg2: memref<32xi8> {lmhlo.params = 2 : index}, %arg3: memref<8xi8> {lmhlo.params = 3 : index}, %arg4: memref<4xi8> {lmhlo.params = 4 : index}, %arg5: memref<4xi8> {lmhlo.params = 5 : index}, %arg6: memref<4xi8> {lmhlo.params = 6 : index}, %arg7: memref<512xi8> {lmhlo.params = 7 : index}, %arg8: memref<401408xi8> {lmhlo.params = 8 : index}, %arg9: memref<40xi8> {lmhlo.params = 9 : index}, %arg10: memref<5120xi8> {lmhlo.params = 10 : index}, %arg11: memref<40xi8> {lmhlo.params = 11 : index}, %arg12: memref<40xi8> {lmhlo.params = 12 : index}, %arg13: memref<5120xi8> {lmhlo.params = 13 : index}, %arg14: memref<5120xi8> {lmhlo.params = 14 : index}, %arg15: memref<4xi8> {lmhlo.params = 15 : index}, %arg16: memref<4xi8> {lmhlo.params = 16 : index}, %arg17: memref<401408xi8> {lmhlo.params = 17 : index}, %arg18: memref<401408xi8> {lmhlo.params = 18 : index}, %arg19: memref<512xi8> {lmhlo.params = 19 : index}, %arg20: memref<512xi8> {lmhlo.params = 20 : index}, %arg21: memref<401408xi8> {lmhlo.output_index = dense<2> : tensor<1xi64>}, %arg22: memref<401408xi8> {lmhlo.output_index = dense<11> : tensor<1xi64>}, %arg23: memref<401408xi8> {lmhlo.output_index = dense<12> : tensor<1xi64>}, %arg24: memref<5120xi8> {lmhlo.output_index = dense<4> : tensor<1xi64>}, %arg25: memref<5120xi8> {lmhlo.output_index = dense<7> : tensor<1xi64>}, %arg26: memref<5120xi8> {lmhlo.output_index = dense<8> : tensor<1xi64>}, %arg27: memref<512xi8> {lmhlo.output_index = dense<1> : tensor<1xi64>}, %arg28: memref<512xi8> {lmhlo.output_index = dense<13> : tensor<1xi64>}, %arg29: memref<512xi8> {lmhlo.output_index = dense<14> : tensor<1xi64>}, %arg30: memref<40xi8> {lmhlo.output_index = dense<3> : tensor<1xi64>}, %arg31: memref<40xi8> {lmhlo.output_index = dense<5> : tensor<1xi64>}, %arg32: memref<40xi8> {lmhlo.output_index = dense<6> : tensor<1xi64>}, %arg33: memref<4xi8> {lmhlo.output_index = dense<0> : tensor<1xi64>}, %arg34: memref<4xi8> {lmhlo.output_index = dense<9> : tensor<1xi64>}, %arg35: memref<4xi8> {lmhlo.output_index = dense<10> : tensor<1xi64>}, %arg36: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_306"}, %arg37: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_60"}, %arg38: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_151"}, %arg39: memref<4xi8> {lmhlo.constant_name = "buffer_for_constant_61"}, %arg40: memref<5272xi8>) attributes {result_xla_shape = "(f32[], f32[128]{0}, f32[784,128]{1,0}, f32[10]{0}, f32[128,10]{1,0}, /*index=5*/f32[10]{0}, f32[10]{0}, f32[128,10]{1,0}, f32[128,10]{1,0}, f32[], /*index=10*/f32[], f32[784,128]{1,0}, f32[784,128]{1,0}, f32[128]{0}, f32[128]{0})"} {
    %0 = memref.get_global @buffer_for_constant_306 : memref<f32>
    %c0 = arith.constant 0 : index
    %1 = memref.view %arg33[%c0][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %0 : memref<f32>
      %70 = "mhlo.copy"(%69) : (tensor<f32>) -> tensor<f32>
      memref.tensor_store %70, %1 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %2 = memref.get_global @buffer_for_constant_151 : memref<f32>
    %3 = memref.get_global @buffer_for_constant_61 : memref<i32>
    %4 = memref.get_global @buffer_for_constant_60 : memref<f32>
    %c0_0 = arith.constant 0 : index
    %5 = memref.view %arg5[%c0_0][] : memref<4xi8> to memref<f32>
    %c0_1 = arith.constant 0 : index
    %6 = memref.view %arg4[%c0_1][] : memref<4xi8> to memref<f32>
    %c0_2 = arith.constant 0 : index
    %7 = memref.view %arg6[%c0_2][] : memref<4xi8> to memref<f32>
    %c0_3 = arith.constant 0 : index
    %8 = memref.view %arg3[%c0_3][] : memref<8xi8> to memref<i64>
    %c4096 = arith.constant 4096 : index
    %9 = memref.view %arg40[%c4096][] : memref<5272xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %5 : memref<f32>
      %70 = bufferization.to_tensor %6 : memref<f32>
      %71 = bufferization.to_tensor %7 : memref<f32>
      %72 = bufferization.to_tensor %8 : memref<i64>
      %73 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %74 = mhlo.constant dense<1> : tensor<i64>
      %75 = mhlo.add %72, %74 : tensor<i64>
      %76 = "mhlo.convert"(%75) : (tensor<i64>) -> tensor<f32>
      %77 = mhlo.power %71, %76 : tensor<f32>
      %78 = mhlo.subtract %73, %77 : tensor<f32>
      %79 = "mhlo.sqrt"(%78) : (tensor<f32>) -> tensor<f32>
      %80 = mhlo.multiply %70, %79 : tensor<f32>
      %81 = mhlo.power %69, %76 : tensor<f32>
      %82 = mhlo.subtract %73, %81 : tensor<f32>
      %83 = mhlo.divide %80, %82 : tensor<f32>
      memref.tensor_store %83, %9 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_4 = arith.constant 0 : index
    %10 = memref.view %arg9[%c0_4][] : memref<40xi8> to memref<10xf32>
    %c0_5 = arith.constant 0 : index
    %11 = memref.view %arg26[%c0_5][] : memref<5120xi8> to memref<32x10xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %10 : memref<10xf32>
      %70 = "mhlo.broadcast_in_dim"(%69) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<10xf32>) -> tensor<32x10xf32>
      memref.tensor_store %70, %11 : memref<32x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_6 = arith.constant 0 : index
    %12 = memref.view %arg25[%c0_6][] : memref<5120xi8> to memref<32x10xi32>
    "lmhlo.fusion"() ({
      %69 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<32x10xi32>
      memref.tensor_store %69, %12 : memref<32x10xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_7 = arith.constant 0 : index
    %13 = memref.view %arg7[%c0_7][] : memref<512xi8> to memref<128xf32>
    %c0_8 = arith.constant 0 : index
    %14 = memref.view %arg23[%c0_8][] : memref<401408xi8> to memref<32x128xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %13 : memref<128xf32>
      %70 = "mhlo.broadcast_in_dim"(%69) {broadcast_dimensions = dense<1> : tensor<1xi64>} : (tensor<128xf32>) -> tensor<32x128xf32>
      memref.tensor_store %70, %14 : memref<32x128xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_9 = arith.constant 0 : index
    %15 = memref.view %arg1[%c0_9][] : memref<100352xi8> to memref<32x784xf32>
    %c0_10 = arith.constant 0 : index
    %16 = memref.view %arg8[%c0_10][] : memref<401408xi8> to memref<784x128xf32>
    %c0_11 = arith.constant 0 : index
    %17 = memref.view %arg23[%c0_11][] : memref<401408xi8> to memref<32x128xf32>
    "lmhlo_gpu.gemm_bias"(%15, %16, %14, %17) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, batch_size = 1 : i64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>, lhs_stride = 25088 : i64, rhs_stride = 100352 : i64} : (memref<32x784xf32>, memref<784x128xf32>, memref<32x128xf32>, memref<32x128xf32>) -> ()
    %c0_12 = arith.constant 0 : index
    %18 = memref.view %arg0[%c0_12][] : memref<16384xi8> to memref<32x128xf32>
    %c0_13 = arith.constant 0 : index
    %19 = memref.view %arg22[%c0_13][] : memref<401408xi8> to memref<32x128xf32>
    %c0_14 = arith.constant 0 : index
    %20 = memref.view %arg40[%c0_14][] : memref<5272xi8> to memref<32x128xi1>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %17 : memref<32x128xf32>
      %70 = bufferization.to_tensor %18 : memref<32x128xf32>
      %71 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %72 = "mhlo.broadcast_in_dim"(%71) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x128xf32>
      %73 = mhlo.maximum %69, %72 : tensor<32x128xf32>
      %74 = mhlo.constant dense<2.000000e-01> : tensor<f32>
      %75 = "mhlo.broadcast_in_dim"(%74) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x128xf32>
      %76 = "mhlo.compare"(%70, %75) {comparison_direction = #mhlo<"comparison_direction GE">} : (tensor<32x128xf32>, tensor<32x128xf32>) -> tensor<32x128xi1>
      %77 = mhlo.constant dense<1.250000e+00> : tensor<f32>
      %78 = "mhlo.broadcast_in_dim"(%77) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x128xf32>
      %79 = "mhlo.select"(%76, %78, %72) : (tensor<32x128xi1>, tensor<32x128xf32>, tensor<32x128xf32>) -> tensor<32x128xf32>
      %80 = mhlo.multiply %73, %79 : tensor<32x128xf32>
      memref.tensor_store %80, %19 : memref<32x128xf32>
      memref.tensor_store %76, %20 : memref<32x128xi1>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_15 = arith.constant 0 : index
    %21 = memref.view %arg22[%c0_15][] : memref<401408xi8> to memref<32x128xf32>
    %c0_16 = arith.constant 0 : index
    %22 = memref.view %arg10[%c0_16][] : memref<5120xi8> to memref<128x10xf32>
    %c0_17 = arith.constant 0 : index
    %23 = memref.view %arg26[%c0_17][] : memref<5120xi8> to memref<32x10xf32>
    "lmhlo_gpu.gemm_bias"(%21, %22, %11, %23) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, batch_size = 1 : i64, beta = 1.000000e+00 : f64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>, lhs_stride = 4096 : i64, rhs_stride = 1280 : i64} : (memref<32x128xf32>, memref<128x10xf32>, memref<32x10xf32>, memref<32x10xf32>) -> ()
    %c0_18 = arith.constant 0 : index
    %24 = memref.view %arg29[%c0_18][] : memref<512xi8> to memref<32xf32>
    %c0_19 = arith.constant 0 : index
    %25 = memref.view %arg28[%c0_19][] : memref<512xi8> to memref<32xi32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %23 : memref<32x10xf32>
      %70 = bufferization.to_tensor %12 : memref<32x10xi32>
      %71 = bufferization.to_tensor %4 : memref<f32>
      %72 = bufferization.to_tensor %3 : memref<i32>
      %73:2 = mhlo.reduce(%69 init: %71), (%70 init: %72) across dimensions = [1] : (tensor<32x10xf32>, tensor<32x10xi32>, tensor<f32>, tensor<i32>) -> (tensor<32xf32>, tensor<32xi32>)
       reducer(%arg41: tensor<f32>, %arg43: tensor<f32>) (%arg42: tensor<i32>, %arg44: tensor<i32>)  {
        %74:2 = "mhlo.fusion"(%arg42, %arg44, %arg41, %arg43) ({
        ^bb0(%arg45: tensor<i32>, %arg46: tensor<i32>, %arg47: tensor<f32>, %arg48: tensor<f32>):
          %75 = "mhlo.compare"(%arg47, %arg48) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %76 = mhlo.minimum %arg45, %arg46 : tensor<i32>
          %77 = "mhlo.compare"(%arg47, %arg48) {comparison_direction = #mhlo<"comparison_direction GE">} : (tensor<f32>, tensor<f32>) -> tensor<i1>
          %78 = "mhlo.select"(%77, %arg45, %arg46) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %79 = "mhlo.select"(%75, %76, %78) : (tensor<i1>, tensor<i32>, tensor<i32>) -> tensor<i32>
          %80 = "mhlo.select"(%77, %arg47, %arg48) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
          "mhlo.return"(%79, %80) : (tensor<i32>, tensor<f32>) -> ()
        }) {fusion_kind = #mhlo<"fusion_kind kLoop">} : (tensor<i32>, tensor<i32>, tensor<f32>, tensor<f32>) -> (tensor<i32>, tensor<f32>)
        "mhlo.return"(%74#1, %74#0) : (tensor<f32>, tensor<i32>) -> ()
      }
      memref.tensor_store %73#0, %24 : memref<32xf32>
      memref.tensor_store %73#1, %25 : memref<32xi32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_20 = arith.constant 0 : index
    %26 = memref.view %arg28[%c0_20][] : memref<512xi8> to memref<32xi32>
    %c0_21 = arith.constant 0 : index
    %27 = memref.view %arg2[%c0_21][] : memref<32xi8> to memref<32xui8>
    %c0_22 = arith.constant 0 : index
    %28 = memref.view %arg35[%c0_22][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %26 : memref<32xi32>
      %70 = bufferization.to_tensor %27 : memref<32xui8>
      %71 = "mhlo.convert"(%70) : (tensor<32xui8>) -> tensor<32xf32>
      %72 = "mhlo.convert"(%69) : (tensor<32xi32>) -> tensor<32xi64>
      %73 = "mhlo.convert"(%72) : (tensor<32xi64>) -> tensor<32xf32>
      %74 = "mhlo.compare"(%71, %73) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32xf32>, tensor<32xf32>) -> tensor<32xi1>
      %75 = "mhlo.convert"(%74) : (tensor<32xi1>) -> tensor<32xf32>
      %76 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %77 = mhlo.reduce(%75 init: %76) across dimensions = [0] : (tensor<32xf32>, tensor<f32>) -> tensor<f32>
       reducer(%arg41: tensor<f32>, %arg42: tensor<f32>)  {
        %78 = mhlo.add %arg41, %arg42 : tensor<f32>
        "mhlo.return"(%78) : (tensor<f32>) -> ()
      }
      memref.tensor_store %77, %28 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_23 = arith.constant 0 : index
    %29 = memref.view %arg29[%c0_23][] : memref<512xi8> to memref<32xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %23 : memref<32x10xf32>
      %70 = bufferization.to_tensor %4 : memref<f32>
      %71 = mhlo.reduce(%69 init: %70) across dimensions = [1] : (tensor<32x10xf32>, tensor<f32>) -> tensor<32xf32>
       reducer(%arg41: tensor<f32>, %arg42: tensor<f32>)  {
        %72 = mhlo.maximum %arg41, %arg42 : tensor<f32>
        "mhlo.return"(%72) : (tensor<f32>) -> ()
      }
      memref.tensor_store %71, %29 : memref<32xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_24 = arith.constant 0 : index
    %30 = memref.view %arg28[%c0_24][] : memref<512xi8> to memref<32xf32>
    %c0_25 = arith.constant 0 : index
    %31 = memref.view %arg27[%c0_25][] : memref<512xi8> to memref<32xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %23 : memref<32x10xf32>
      %70 = bufferization.to_tensor %29 : memref<32xf32>
      %71 = "mhlo.broadcast_in_dim"(%70) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %72 = mhlo.subtract %69, %71 : tensor<32x10xf32>
      %73 = "mhlo.exponential"(%72) : (tensor<32x10xf32>) -> tensor<32x10xf32>
      %74 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %75 = mhlo.reduce(%73 init: %74) across dimensions = [1] : (tensor<32x10xf32>, tensor<f32>) -> tensor<32xf32>
       reducer(%arg41: tensor<f32>, %arg42: tensor<f32>)  {
        %77 = mhlo.add %arg41, %arg42 : tensor<f32>
        "mhlo.return"(%77) : (tensor<f32>) -> ()
      }
      %76 = "mhlo.log"(%75) : (tensor<32xf32>) -> tensor<32xf32>
      memref.tensor_store %76, %30 : memref<32xf32>
      memref.tensor_store %75, %31 : memref<32xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_26 = arith.constant 0 : index
    %32 = memref.view %arg28[%c0_26][] : memref<512xi8> to memref<32xf32>
    %c0_27 = arith.constant 0 : index
    %33 = memref.view %arg34[%c0_27][] : memref<4xi8> to memref<f32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %32 : memref<32xf32>
      %70 = bufferization.to_tensor %27 : memref<32xui8>
      %71 = bufferization.to_tensor %23 : memref<32x10xf32>
      %72 = bufferization.to_tensor %29 : memref<32xf32>
      %73 = "mhlo.convert"(%70) : (tensor<32xui8>) -> tensor<32xi64>
      %74 = "mhlo.broadcast_in_dim"(%73) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xi64>) -> tensor<32x10xi64>
      %75 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<32x10xi64>
      %76 = "mhlo.compare"(%74, %75) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32x10xi64>, tensor<32x10xi64>) -> tensor<32x10xi1>
      %77 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %78 = "mhlo.broadcast_in_dim"(%77) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %79 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %80 = "mhlo.broadcast_in_dim"(%79) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %81 = "mhlo.select"(%76, %78, %80) : (tensor<32x10xi1>, tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xf32>
      %82 = mhlo.constant dense<0> : tensor<i64>
      %83 = "mhlo.broadcast_in_dim"(%82) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<i64>) -> tensor<32xi64>
      %84 = "mhlo.compare"(%83, %73) {comparison_direction = #mhlo<"comparison_direction LE">} : (tensor<32xi64>, tensor<32xi64>) -> tensor<32xi1>
      %85 = mhlo.constant dense<10> : tensor<i64>
      %86 = "mhlo.broadcast_in_dim"(%85) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<i64>) -> tensor<32xi64>
      %87 = "mhlo.compare"(%73, %86) {comparison_direction = #mhlo<"comparison_direction LT">} : (tensor<32xi64>, tensor<32xi64>) -> tensor<32xi1>
      %88 = mhlo.and %84, %87 : tensor<32xi1>
      %89 = "mhlo.broadcast_in_dim"(%79) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32xf32>
      %90 = mhlo.constant dense<0x7FC00000> : tensor<f32>
      %91 = "mhlo.broadcast_in_dim"(%90) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32xf32>
      %92 = "mhlo.select"(%88, %89, %91) : (tensor<32xi1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
      %93 = "mhlo.broadcast_in_dim"(%92) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %94 = mhlo.add %81, %93 : tensor<32x10xf32>
      %95 = "mhlo.negate"(%94) : (tensor<32x10xf32>) -> tensor<32x10xf32>
      %96 = "mhlo.compare"(%94, %80) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xi1>
      %97 = "mhlo.broadcast_in_dim"(%72) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %98 = mhlo.subtract %71, %97 : tensor<32x10xf32>
      %99 = "mhlo.broadcast_in_dim"(%69) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %100 = mhlo.subtract %98, %99 : tensor<32x10xf32>
      %101 = "mhlo.select"(%96, %80, %100) : (tensor<32x10xi1>, tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xf32>
      %102 = mhlo.multiply %95, %101 : tensor<32x10xf32>
      %103 = "mhlo.bitcast"(%102) {result_layout = dense<0> : tensor<1xindex>, source_layout = dense<[1, 0]> : tensor<2xindex>} : (tensor<32x10xf32>) -> tensor<320xf32>
      %104 = mhlo.reduce(%103 init: %79) across dimensions = [0] : (tensor<320xf32>, tensor<f32>) -> tensor<f32>
       reducer(%arg41: tensor<f32>, %arg42: tensor<f32>)  {
        %105 = mhlo.add %arg41, %arg42 : tensor<f32>
        "mhlo.return"(%105) : (tensor<f32>) -> ()
      }
      memref.tensor_store %104, %33 : memref<f32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_28 = arith.constant 0 : index
    %34 = memref.view %arg27[%c0_28][] : memref<512xi8> to memref<32xf32>
    %c0_29 = arith.constant 0 : index
    %35 = memref.view %arg21[%c0_29][] : memref<401408xi8> to memref<32x10xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %34 : memref<32xf32>
      %70 = bufferization.to_tensor %27 : memref<32xui8>
      %71 = bufferization.to_tensor %23 : memref<32x10xf32>
      %72 = bufferization.to_tensor %29 : memref<32xf32>
      %73 = mhlo.constant dense<3.125000e-02> : tensor<f32>
      %74 = "mhlo.broadcast_in_dim"(%73) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %75 = "mhlo.broadcast_in_dim"(%72) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %76 = mhlo.subtract %71, %75 : tensor<32x10xf32>
      %77 = "mhlo.exponential"(%76) : (tensor<32x10xf32>) -> tensor<32x10xf32>
      %78 = "mhlo.broadcast_in_dim"(%69) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %79 = mhlo.divide %77, %78 : tensor<32x10xf32>
      %80 = "mhlo.convert"(%70) : (tensor<32xui8>) -> tensor<32xi64>
      %81 = "mhlo.broadcast_in_dim"(%80) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xi64>) -> tensor<32x10xi64>
      %82 = "mhlo.iota"() {iota_dimension = 1 : i64} : () -> tensor<32x10xi64>
      %83 = "mhlo.compare"(%81, %82) {comparison_direction = #mhlo<"comparison_direction EQ">} : (tensor<32x10xi64>, tensor<32x10xi64>) -> tensor<32x10xi1>
      %84 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %85 = "mhlo.broadcast_in_dim"(%84) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %86 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %87 = "mhlo.broadcast_in_dim"(%86) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x10xf32>
      %88 = "mhlo.select"(%83, %85, %87) : (tensor<32x10xi1>, tensor<32x10xf32>, tensor<32x10xf32>) -> tensor<32x10xf32>
      %89 = mhlo.constant dense<0> : tensor<i64>
      %90 = "mhlo.broadcast_in_dim"(%89) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<i64>) -> tensor<32xi64>
      %91 = "mhlo.compare"(%90, %80) {comparison_direction = #mhlo<"comparison_direction LE">} : (tensor<32xi64>, tensor<32xi64>) -> tensor<32xi1>
      %92 = mhlo.constant dense<10> : tensor<i64>
      %93 = "mhlo.broadcast_in_dim"(%92) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<i64>) -> tensor<32xi64>
      %94 = "mhlo.compare"(%80, %93) {comparison_direction = #mhlo<"comparison_direction LT">} : (tensor<32xi64>, tensor<32xi64>) -> tensor<32xi1>
      %95 = mhlo.and %91, %94 : tensor<32xi1>
      %96 = "mhlo.broadcast_in_dim"(%86) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32xf32>
      %97 = mhlo.constant dense<0x7FC00000> : tensor<f32>
      %98 = "mhlo.broadcast_in_dim"(%97) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32xf32>
      %99 = "mhlo.select"(%95, %96, %98) : (tensor<32xi1>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
      %100 = "mhlo.broadcast_in_dim"(%99) {broadcast_dimensions = dense<0> : tensor<1xi64>} : (tensor<32xf32>) -> tensor<32x10xf32>
      %101 = mhlo.add %88, %100 : tensor<32x10xf32>
      %102 = mhlo.subtract %79, %101 : tensor<32x10xf32>
      %103 = mhlo.multiply %74, %102 : tensor<32x10xf32>
      memref.tensor_store %103, %35 : memref<32x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_30 = arith.constant 0 : index
    %36 = memref.view %arg26[%c0_30][] : memref<5120xi8> to memref<128x10xf32>
    "lmhlo_gpu.gemm"(%21, %35, %36) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, batch_size = 1 : i64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [0], rhs_contracting_dimensions = [0]>, lhs_stride = 4096 : i64, rhs_stride = 320 : i64} : (memref<32x128xf32>, memref<32x10xf32>, memref<128x10xf32>) -> ()
    %c0_31 = arith.constant 0 : index
    %37 = memref.view %arg15[%c0_31][] : memref<4xi8> to memref<f32>
    %c0_32 = arith.constant 0 : index
    %38 = memref.view %arg16[%c0_32][] : memref<4xi8> to memref<f32>
    %c0_33 = arith.constant 0 : index
    %39 = memref.view %arg34[%c0_33][] : memref<4xi8> to memref<1xf32>
    %c0_34 = arith.constant 0 : index
    %40 = memref.view %arg35[%c0_34][] : memref<4xi8> to memref<1xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %37 : memref<f32>
      %70 = bufferization.to_tensor %33 : memref<f32>
      %71 = bufferization.to_tensor %38 : memref<f32>
      %72 = bufferization.to_tensor %28 : memref<f32>
      %73 = mhlo.add %69, %70 : tensor<f32>
      %74 = "mhlo.reshape"(%73) : (tensor<f32>) -> tensor<1xf32>
      %75 = mhlo.add %71, %72 : tensor<f32>
      %76 = "mhlo.reshape"(%75) : (tensor<f32>) -> tensor<1xf32>
      %77 = "mhlo.concatenate"(%74, %76) {dimension = 0 : i64} : (tensor<1xf32>, tensor<1xf32>) -> tensor<2xf32>
      %78 = "mhlo.slice"(%77) {limit_indices = dense<1> : tensor<1xi64>, start_indices = dense<0> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      %79 = "mhlo.slice"(%77) {limit_indices = dense<2> : tensor<1xi64>, start_indices = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} : (tensor<2xf32>) -> tensor<1xf32>
      memref.tensor_store %78, %39 : memref<1xf32>
      memref.tensor_store %79, %40 : memref<1xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_35 = arith.constant 0 : index
    %41 = memref.view %arg32[%c0_35][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %35 : memref<32x10xf32>
      %70 = bufferization.to_tensor %2 : memref<f32>
      %71 = mhlo.reduce(%69 init: %70) across dimensions = [0] : (tensor<32x10xf32>, tensor<f32>) -> tensor<10xf32>
       reducer(%arg41: tensor<f32>, %arg42: tensor<f32>)  {
        %72 = mhlo.add %arg41, %arg42 : tensor<f32>
        "mhlo.return"(%72) : (tensor<f32>) -> ()
      }
      memref.tensor_store %71, %41 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_36 = arith.constant 0 : index
    %42 = memref.view %arg11[%c0_36][] : memref<40xi8> to memref<10xf32>
    %c0_37 = arith.constant 0 : index
    %43 = memref.view %arg12[%c0_37][] : memref<40xi8> to memref<10xf32>
    %c0_38 = arith.constant 0 : index
    %44 = memref.view %arg30[%c0_38][] : memref<40xi8> to memref<10xf32>
    %c0_39 = arith.constant 0 : index
    %45 = memref.view %arg31[%c0_39][] : memref<40xi8> to memref<10xf32>
    %c0_40 = arith.constant 0 : index
    %46 = memref.view %arg32[%c0_40][] : memref<40xi8> to memref<10xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %10 : memref<10xf32>
      %70 = bufferization.to_tensor %9 : memref<f32>
      %71 = bufferization.to_tensor %42 : memref<10xf32>
      %72 = bufferization.to_tensor %5 : memref<f32>
      %73 = bufferization.to_tensor %41 : memref<10xf32>
      %74 = bufferization.to_tensor %43 : memref<10xf32>
      %75 = bufferization.to_tensor %7 : memref<f32>
      %76 = mhlo.subtract %73, %71 : tensor<10xf32>
      %77 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %78 = mhlo.subtract %77, %72 : tensor<f32>
      %79 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %80 = mhlo.multiply %76, %79 : tensor<10xf32>
      %81 = mhlo.add %71, %80 : tensor<10xf32>
      %82 = "mhlo.broadcast_in_dim"(%70) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %83 = mhlo.multiply %81, %82 : tensor<10xf32>
      %84 = mhlo.multiply %73, %73 : tensor<10xf32>
      %85 = mhlo.subtract %84, %74 : tensor<10xf32>
      %86 = mhlo.subtract %77, %75 : tensor<f32>
      %87 = "mhlo.broadcast_in_dim"(%86) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %88 = mhlo.multiply %85, %87 : tensor<10xf32>
      %89 = mhlo.add %74, %88 : tensor<10xf32>
      %90 = "mhlo.sqrt"(%89) : (tensor<10xf32>) -> tensor<10xf32>
      %91 = mhlo.constant dense<1.000000e-07> : tensor<f32>
      %92 = "mhlo.broadcast_in_dim"(%91) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<10xf32>
      %93 = mhlo.add %90, %92 : tensor<10xf32>
      %94 = mhlo.divide %83, %93 : tensor<10xf32>
      %95 = mhlo.subtract %69, %94 : tensor<10xf32>
      memref.tensor_store %95, %44 : memref<10xf32>
      memref.tensor_store %81, %45 : memref<10xf32>
      memref.tensor_store %89, %46 : memref<10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_41 = arith.constant 0 : index
    %47 = memref.view %arg13[%c0_41][] : memref<5120xi8> to memref<128x10xf32>
    %c0_42 = arith.constant 0 : index
    %48 = memref.view %arg14[%c0_42][] : memref<5120xi8> to memref<128x10xf32>
    %c0_43 = arith.constant 0 : index
    %49 = memref.view %arg24[%c0_43][] : memref<5120xi8> to memref<128x10xf32>
    %c0_44 = arith.constant 0 : index
    %50 = memref.view %arg25[%c0_44][] : memref<5120xi8> to memref<128x10xf32>
    %c0_45 = arith.constant 0 : index
    %51 = memref.view %arg26[%c0_45][] : memref<5120xi8> to memref<128x10xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %22 : memref<128x10xf32>
      %70 = bufferization.to_tensor %9 : memref<f32>
      %71 = bufferization.to_tensor %47 : memref<128x10xf32>
      %72 = bufferization.to_tensor %5 : memref<f32>
      %73 = bufferization.to_tensor %36 : memref<128x10xf32>
      %74 = bufferization.to_tensor %48 : memref<128x10xf32>
      %75 = bufferization.to_tensor %7 : memref<f32>
      %76 = mhlo.subtract %73, %71 : tensor<128x10xf32>
      %77 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %78 = mhlo.subtract %77, %72 : tensor<f32>
      %79 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128x10xf32>
      %80 = mhlo.multiply %76, %79 : tensor<128x10xf32>
      %81 = mhlo.add %71, %80 : tensor<128x10xf32>
      %82 = "mhlo.broadcast_in_dim"(%70) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128x10xf32>
      %83 = mhlo.multiply %81, %82 : tensor<128x10xf32>
      %84 = mhlo.multiply %73, %73 : tensor<128x10xf32>
      %85 = mhlo.subtract %84, %74 : tensor<128x10xf32>
      %86 = mhlo.subtract %77, %75 : tensor<f32>
      %87 = "mhlo.broadcast_in_dim"(%86) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128x10xf32>
      %88 = mhlo.multiply %85, %87 : tensor<128x10xf32>
      %89 = mhlo.add %74, %88 : tensor<128x10xf32>
      %90 = "mhlo.sqrt"(%89) : (tensor<128x10xf32>) -> tensor<128x10xf32>
      %91 = mhlo.constant dense<1.000000e-07> : tensor<f32>
      %92 = "mhlo.broadcast_in_dim"(%91) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128x10xf32>
      %93 = mhlo.add %90, %92 : tensor<128x10xf32>
      %94 = mhlo.divide %83, %93 : tensor<128x10xf32>
      %95 = mhlo.subtract %69, %94 : tensor<128x10xf32>
      memref.tensor_store %95, %49 : memref<128x10xf32>
      memref.tensor_store %81, %50 : memref<128x10xf32>
      memref.tensor_store %89, %51 : memref<128x10xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_46 = arith.constant 0 : index
    %52 = memref.view %arg22[%c0_46][] : memref<401408xi8> to memref<32x128xf32>
    "lmhlo_gpu.gemm"(%35, %22, %52) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.250000e+00 : f64, batch_size = 1 : i64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [1]>, lhs_stride = 320 : i64, rhs_stride = 1280 : i64} : (memref<32x10xf32>, memref<128x10xf32>, memref<32x128xf32>) -> ()
    %c0_47 = arith.constant 0 : index
    %53 = memref.view %arg40[%c0_47][] : memref<5272xi8> to memref<32x128xi1>
    %c0_48 = arith.constant 0 : index
    %54 = memref.view %arg29[%c0_48][] : memref<512xi8> to memref<128xf32>
    %c0_49 = arith.constant 0 : index
    %55 = memref.view %arg21[%c0_49][] : memref<401408xi8> to memref<32x128xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %53 : memref<32x128xi1>
      %70 = bufferization.to_tensor %52 : memref<32x128xf32>
      %71 = bufferization.to_tensor %17 : memref<32x128xf32>
      %72 = mhlo.constant dense<0.000000e+00> : tensor<f32>
      %73 = "mhlo.broadcast_in_dim"(%72) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<32x128xf32>
      %74 = mhlo.maximum %71, %73 : tensor<32x128xf32>
      %75 = "mhlo.compare"(%74, %73) {comparison_direction = #mhlo<"comparison_direction GT">} : (tensor<32x128xf32>, tensor<32x128xf32>) -> tensor<32x128xi1>
      %76 = "mhlo.select"(%69, %70, %73) : (tensor<32x128xi1>, tensor<32x128xf32>, tensor<32x128xf32>) -> tensor<32x128xf32>
      %77 = "mhlo.select"(%75, %76, %73) : (tensor<32x128xi1>, tensor<32x128xf32>, tensor<32x128xf32>) -> tensor<32x128xf32>
      %78 = mhlo.constant dense<-0.000000e+00> : tensor<f32>
      %79 = mhlo.reduce(%77 init: %78) across dimensions = [0] : (tensor<32x128xf32>, tensor<f32>) -> tensor<128xf32>
       reducer(%arg41: tensor<f32>, %arg42: tensor<f32>)  {
        %80 = mhlo.add %arg41, %arg42 : tensor<f32>
        "mhlo.return"(%80) : (tensor<f32>) -> ()
      }
      memref.tensor_store %79, %54 : memref<128xf32>
      memref.tensor_store %77, %55 : memref<32x128xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_50 = arith.constant 0 : index
    %56 = memref.view %arg19[%c0_50][] : memref<512xi8> to memref<128xf32>
    %c0_51 = arith.constant 0 : index
    %57 = memref.view %arg29[%c0_51][] : memref<512xi8> to memref<128xf32>
    %c0_52 = arith.constant 0 : index
    %58 = memref.view %arg20[%c0_52][] : memref<512xi8> to memref<128xf32>
    %c0_53 = arith.constant 0 : index
    %59 = memref.view %arg27[%c0_53][] : memref<512xi8> to memref<128xf32>
    %c0_54 = arith.constant 0 : index
    %60 = memref.view %arg28[%c0_54][] : memref<512xi8> to memref<128xf32>
    %c0_55 = arith.constant 0 : index
    %61 = memref.view %arg29[%c0_55][] : memref<512xi8> to memref<128xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %13 : memref<128xf32>
      %70 = bufferization.to_tensor %9 : memref<f32>
      %71 = bufferization.to_tensor %56 : memref<128xf32>
      %72 = bufferization.to_tensor %5 : memref<f32>
      %73 = bufferization.to_tensor %57 : memref<128xf32>
      %74 = bufferization.to_tensor %58 : memref<128xf32>
      %75 = bufferization.to_tensor %7 : memref<f32>
      %76 = mhlo.subtract %73, %71 : tensor<128xf32>
      %77 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %78 = mhlo.subtract %77, %72 : tensor<f32>
      %79 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128xf32>
      %80 = mhlo.multiply %76, %79 : tensor<128xf32>
      %81 = mhlo.add %71, %80 : tensor<128xf32>
      %82 = "mhlo.broadcast_in_dim"(%70) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128xf32>
      %83 = mhlo.multiply %81, %82 : tensor<128xf32>
      %84 = mhlo.multiply %73, %73 : tensor<128xf32>
      %85 = mhlo.subtract %84, %74 : tensor<128xf32>
      %86 = mhlo.subtract %77, %75 : tensor<f32>
      %87 = "mhlo.broadcast_in_dim"(%86) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128xf32>
      %88 = mhlo.multiply %85, %87 : tensor<128xf32>
      %89 = mhlo.add %74, %88 : tensor<128xf32>
      %90 = "mhlo.sqrt"(%89) : (tensor<128xf32>) -> tensor<128xf32>
      %91 = mhlo.constant dense<1.000000e-07> : tensor<f32>
      %92 = "mhlo.broadcast_in_dim"(%91) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<128xf32>
      %93 = mhlo.add %90, %92 : tensor<128xf32>
      %94 = mhlo.divide %83, %93 : tensor<128xf32>
      %95 = mhlo.subtract %69, %94 : tensor<128xf32>
      memref.tensor_store %95, %59 : memref<128xf32>
      memref.tensor_store %81, %60 : memref<128xf32>
      memref.tensor_store %89, %61 : memref<128xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    %c0_56 = arith.constant 0 : index
    %62 = memref.view %arg21[%c0_56][] : memref<401408xi8> to memref<32x128xf32>
    %c0_57 = arith.constant 0 : index
    %63 = memref.view %arg23[%c0_57][] : memref<401408xi8> to memref<784x128xf32>
    "lmhlo_gpu.gemm"(%15, %62, %63) {algorithm = -1 : i64, alpha_imag = 0.000000e+00 : f64, alpha_real = 1.000000e+00 : f64, batch_size = 1 : i64, dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [0], rhs_contracting_dimensions = [0]>, lhs_stride = 25088 : i64, rhs_stride = 4096 : i64} : (memref<32x784xf32>, memref<32x128xf32>, memref<784x128xf32>) -> ()
    %c0_58 = arith.constant 0 : index
    %64 = memref.view %arg17[%c0_58][] : memref<401408xi8> to memref<784x128xf32>
    %c0_59 = arith.constant 0 : index
    %65 = memref.view %arg18[%c0_59][] : memref<401408xi8> to memref<784x128xf32>
    %c0_60 = arith.constant 0 : index
    %66 = memref.view %arg21[%c0_60][] : memref<401408xi8> to memref<784x128xf32>
    %c0_61 = arith.constant 0 : index
    %67 = memref.view %arg22[%c0_61][] : memref<401408xi8> to memref<784x128xf32>
    %c0_62 = arith.constant 0 : index
    %68 = memref.view %arg23[%c0_62][] : memref<401408xi8> to memref<784x128xf32>
    "lmhlo.fusion"() ({
      %69 = bufferization.to_tensor %16 : memref<784x128xf32>
      %70 = bufferization.to_tensor %9 : memref<f32>
      %71 = bufferization.to_tensor %64 : memref<784x128xf32>
      %72 = bufferization.to_tensor %5 : memref<f32>
      %73 = bufferization.to_tensor %63 : memref<784x128xf32>
      %74 = bufferization.to_tensor %65 : memref<784x128xf32>
      %75 = bufferization.to_tensor %7 : memref<f32>
      %76 = mhlo.subtract %73, %71 : tensor<784x128xf32>
      %77 = mhlo.constant dense<1.000000e+00> : tensor<f32>
      %78 = mhlo.subtract %77, %72 : tensor<f32>
      %79 = "mhlo.broadcast_in_dim"(%78) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x128xf32>
      %80 = mhlo.multiply %76, %79 : tensor<784x128xf32>
      %81 = mhlo.add %71, %80 : tensor<784x128xf32>
      %82 = "mhlo.broadcast_in_dim"(%70) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x128xf32>
      %83 = mhlo.multiply %81, %82 : tensor<784x128xf32>
      %84 = mhlo.multiply %73, %73 : tensor<784x128xf32>
      %85 = mhlo.subtract %84, %74 : tensor<784x128xf32>
      %86 = mhlo.subtract %77, %75 : tensor<f32>
      %87 = "mhlo.broadcast_in_dim"(%86) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x128xf32>
      %88 = mhlo.multiply %85, %87 : tensor<784x128xf32>
      %89 = mhlo.add %74, %88 : tensor<784x128xf32>
      %90 = "mhlo.sqrt"(%89) : (tensor<784x128xf32>) -> tensor<784x128xf32>
      %91 = mhlo.constant dense<1.000000e-07> : tensor<f32>
      %92 = "mhlo.broadcast_in_dim"(%91) {broadcast_dimensions = dense<> : tensor<0xi64>} : (tensor<f32>) -> tensor<784x128xf32>
      %93 = mhlo.add %90, %92 : tensor<784x128xf32>
      %94 = mhlo.divide %83, %93 : tensor<784x128xf32>
      %95 = mhlo.subtract %69, %94 : tensor<784x128xf32>
      memref.tensor_store %95, %66 : memref<784x128xf32>
      memref.tensor_store %81, %67 : memref<784x128xf32>
      memref.tensor_store %89, %68 : memref<784x128xf32>
      "lmhlo.terminator"() : () -> ()
    }) : () -> ()
    "lmhlo.terminator"() : () -> ()
  }
}