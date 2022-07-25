target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = external dso_local unnamed_addr constant [4 x i8]
@buffer_for_constant_32 = external constant [4 x i8], align 128
@1 = external dso_local unnamed_addr constant [4 x i8]
@2 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache = external dso_local addrspace(3) global [1 x [1 x [1 x float]]]
@3 = external dso_local unnamed_addr constant [4 x i8]
@4 = external dso_local unnamed_addr constant [8 x i8]
@5 = external dso_local unnamed_addr constant [8 x i8]
@6 = external dso_local unnamed_addr constant [4 x i8]
@buffer_for_constant_33 = external constant [4 x i8], align 128
@7 = external dso_local unnamed_addr constant [4 x i8]
@shared_cache1 = external dso_local addrspace(3) global [5 x [1 x [1 x float]]]
@buffer_for_constant_165 = external constant [4 x i8], align 128
@buffer_for_constant_162 = external constant [4 x i8], align 128

define void @broadcast_15(i8* noalias align 16 dereferenceable(512) %alloc2, i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc2, i64 0
  %1 = bitcast i8* %0 to [128 x float]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %3 = bitcast i8* %2 to [32 x [128 x float]]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %6 = mul nuw nsw i32 %4, 128
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !23
  %8 = mul nuw nsw i32 %7, 32
  %9 = add nuw nsw i32 %6, %8
  %linear_index = add nuw nsw i32 %9, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 1024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %row_index = mul nuw nsw i32 %5, 4
  %10 = udiv i32 %linear_index_base, 1
  %11 = urem i32 %10, 128
  %12 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %row_index_plus1 = add nuw nsw i32 %row_index, 1
  %13 = udiv i32 %linear_index1, 1
  %14 = urem i32 %13, 128
  %15 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %row_index_plus2 = add nuw nsw i32 %row_index, 2
  %16 = udiv i32 %linear_index2, 1
  %17 = urem i32 %16, 128
  %18 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %row_index_plus3 = add nuw nsw i32 %row_index, 3
  %19 = udiv i32 %linear_index3, 1
  %20 = urem i32 %19, 128
  %21 = udiv i32 %linear_index3, 128
  %22 = icmp ult i32 %linear_index_base, 4096
  br i1 %22, label %broadcast_15.in_bounds-true, label %broadcast_15.in_bounds-after

broadcast_15.in_bounds-after:                     ; preds = %broadcast_15.in_bounds-true, %entry
  ret void

broadcast_15.in_bounds-true:                      ; preds = %entry
  %23 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index
  %24 = load float, float* %23, align 4, !invariant.load !24
  %25 = bitcast [32 x [128 x float]]* %3 to float*
  %26 = getelementptr inbounds float, float* %25, i32 %linear_index_base
  store float %24, float* %26, align 4
  %27 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index_plus1
  %28 = load float, float* %27, align 4, !invariant.load !24
  %29 = bitcast [32 x [128 x float]]* %3 to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index1
  store float %28, float* %30, align 4
  %31 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index_plus2
  %32 = load float, float* %31, align 4, !invariant.load !24
  %33 = bitcast [32 x [128 x float]]* %3 to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index2
  store float %32, float* %34, align 4
  %35 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index_plus3
  %36 = load float, float* %35, align 4, !invariant.load !24
  %37 = bitcast [32 x [128 x float]]* %3 to float*
  %38 = getelementptr inbounds float, float* %37, i32 %linear_index3
  store float %36, float* %38, align 4
  br label %broadcast_15.in_bounds-after
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

define void @fusion_3(i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %1 = bitcast i8* %0 to [32 x [128 x float]]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %3 = bitcast i8* %2 to [32 x [128 x float]]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
  %6 = mul nuw nsw i32 %4, 256
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 1024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %7 = udiv i32 %linear_index_base, 1
  %8 = urem i32 %7, 128
  %9 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 128
  %12 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 128
  %15 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %16 = udiv i32 %linear_index3, 1
  %17 = urem i32 %16, 128
  %18 = udiv i32 %linear_index3, 128
  %19 = icmp ult i32 %linear_index_base, 4096
  br i1 %19, label %fusion_3.in_bounds-true, label %fusion_3.in_bounds-after

fusion_3.in_bounds-after:                         ; preds = %fusion_3.in_bounds-true, %entry
  ret void

fusion_3.in_bounds-true:                          ; preds = %entry
  %20 = bitcast [32 x [128 x float]]* %1 to float*
  %21 = getelementptr inbounds float, float* %20, i32 %linear_index_base
  %22 = load float, float* %21, align 4
  %region_0_5_constant_2 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %23 = fcmp oge float %22, %region_0_5_constant_2
  %24 = fcmp une float %22, %22
  %25 = or i1 %23, %24
  %maximum.4 = select i1 %25, float %22, float %region_0_5_constant_2
  %26 = bitcast [32 x [128 x float]]* %3 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  store float %maximum.4, float* %27, align 4
  %28 = bitcast [32 x [128 x float]]* %1 to float*
  %29 = getelementptr inbounds float, float* %28, i32 %linear_index1
  %30 = load float, float* %29, align 4
  %region_0_5_constant_21 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %31 = fcmp oge float %30, %region_0_5_constant_21
  %32 = fcmp une float %30, %30
  %33 = or i1 %31, %32
  %maximum.42 = select i1 %33, float %30, float %region_0_5_constant_21
  %34 = bitcast [32 x [128 x float]]* %3 to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index1
  store float %maximum.42, float* %35, align 4
  %36 = bitcast [32 x [128 x float]]* %1 to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index2
  %38 = load float, float* %37, align 4
  %region_0_5_constant_23 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %39 = fcmp oge float %38, %region_0_5_constant_23
  %40 = fcmp une float %38, %38
  %41 = or i1 %39, %40
  %maximum.44 = select i1 %41, float %38, float %region_0_5_constant_23
  %42 = bitcast [32 x [128 x float]]* %3 to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index2
  store float %maximum.44, float* %43, align 4
  %44 = bitcast [32 x [128 x float]]* %1 to float*
  %45 = getelementptr inbounds float, float* %44, i32 %linear_index3
  %46 = load float, float* %45, align 4
  %region_0_5_constant_25 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %47 = fcmp oge float %46, %region_0_5_constant_25
  %48 = fcmp une float %46, %46
  %49 = or i1 %47, %48
  %maximum.46 = select i1 %49, float %46, float %region_0_5_constant_25
  %50 = bitcast [32 x [128 x float]]* %3 to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index3
  store float %maximum.46, float* %51, align 4
  br label %fusion_3.in_bounds-after
}

define void @broadcast_22(i8* noalias align 16 dereferenceable(40) %alloc4, i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc4, i64 0
  %1 = bitcast i8* %0 to [10 x float]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 16384
  %3 = bitcast i8* %2 to [32 x [10 x float]]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %6 = mul nuw nsw i32 %4, 80
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 80
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %7 = udiv i32 %linear_index_base, 1
  %8 = urem i32 %7, 10
  %9 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 10
  %12 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 10
  %15 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %16 = udiv i32 %linear_index3, 1
  %17 = urem i32 %16, 10
  %18 = udiv i32 %linear_index3, 10
  %19 = icmp ult i32 %linear_index_base, 320
  br i1 %19, label %broadcast_22.in_bounds-true, label %broadcast_22.in_bounds-after

broadcast_22.in_bounds-after:                     ; preds = %broadcast_22.in_bounds-true, %entry
  ret void

broadcast_22.in_bounds-true:                      ; preds = %entry
  %20 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %8
  %21 = load float, float* %20, align 4, !invariant.load !24
  %22 = bitcast [32 x [10 x float]]* %3 to float*
  %23 = getelementptr inbounds float, float* %22, i32 %linear_index_base
  store float %21, float* %23, align 4
  %24 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %11
  %25 = load float, float* %24, align 4, !invariant.load !24
  %26 = bitcast [32 x [10 x float]]* %3 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index1
  store float %25, float* %27, align 4
  %28 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %14
  %29 = load float, float* %28, align 4, !invariant.load !24
  %30 = bitcast [32 x [10 x float]]* %3 to float*
  %31 = getelementptr inbounds float, float* %30, i32 %linear_index2
  store float %29, float* %31, align 4
  %32 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %17
  %33 = load float, float* %32, align 4, !invariant.load !24
  %34 = bitcast [32 x [10 x float]]* %3 to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index3
  store float %33, float* %35, align 4
  br label %broadcast_22.in_bounds-after
}

define void @reduce_110(i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %return_buffer31 = alloca float, align 4
  %parameter_buffer30 = alloca float, align 4
  %parameter_buffer29 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.126 = alloca i32, align 4
  %accumulator_022 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %parameter_buffer20 = alloca float, align 4
  %parameter_buffer19 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.116 = alloca i32, align 4
  %accumulator_012 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %parameter_buffer10 = alloca float, align 4
  %parameter_buffer9 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.16 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 16384
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %3 = bitcast i8* %2 to [32 x float]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %6 = mul nuw nsw i32 %4, 8
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 8
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %7 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %10 = udiv i32 %linear_index3, 1
  %11 = icmp ult i32 %linear_index_base, 32
  br i1 %11, label %reduce_110.in_bounds-true, label %reduce_110.in_bounds-after

reduce_110.in_bounds-after:                       ; preds = %reduce.7.inner.loop_exit.reduction_dim.123, %entry
  ret void

reduce_110.in_bounds-true:                        ; preds = %entry
  %12 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_32 to float*), align 4, !invariant.load !24
  store float %12, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_header.reduction_dim.1:       ; preds = %reduce.7.inner.loop_body.reduction_dim.1, %reduce_110.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.1, align 4
  %13 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.1, 10
  br i1 %13, label %reduce.7.inner.loop_exit.reduction_dim.1, label %reduce.7.inner.loop_body.reduction_dim.1

reduce.7.inner.loop_body.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %14 = load float, float* %accumulator_0, align 4
  %15 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %7, i32 %reduce.7.inner.indvar.reduction_dim.1
  %16 = load float, float* %15, align 4, !invariant.load !24
  store float %14, float* %parameter_buffer, align 4
  store float %16, float* %parameter_buffer1, align 4
  call void @region_1_3(float* %parameter_buffer, float* %parameter_buffer1, float* %return_buffer)
  %17 = load float, float* %return_buffer, align 4
  store float %17, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_exit.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %18 = load float, float* %accumulator_0, align 4
  %19 = bitcast [32 x float]* %3 to float*
  %20 = getelementptr inbounds float, float* %19, i32 %linear_index_base
  store float %18, float* %20, align 4
  %21 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_32 to float*), align 4, !invariant.load !24
  store float %21, float* %accumulator_02, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.16, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.14

reduce.7.inner.loop_header.reduction_dim.14:      ; preds = %reduce.7.inner.loop_body.reduction_dim.15, %reduce.7.inner.loop_exit.reduction_dim.1
  %reduce.7.inner.indvar.reduction_dim.17 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.16, align 4
  %22 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.17, 10
  br i1 %22, label %reduce.7.inner.loop_exit.reduction_dim.13, label %reduce.7.inner.loop_body.reduction_dim.15

reduce.7.inner.loop_body.reduction_dim.15:        ; preds = %reduce.7.inner.loop_header.reduction_dim.14
  %23 = load float, float* %accumulator_02, align 4
  %24 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %8, i32 %reduce.7.inner.indvar.reduction_dim.17
  %25 = load float, float* %24, align 4, !invariant.load !24
  store float %23, float* %parameter_buffer9, align 4
  store float %25, float* %parameter_buffer10, align 4
  call void @region_1_3(float* %parameter_buffer9, float* %parameter_buffer10, float* %return_buffer11)
  %26 = load float, float* %return_buffer11, align 4
  store float %26, float* %accumulator_02, align 4
  %invar.inc8 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.17, 1
  store i32 %invar.inc8, i32* %reduce.7.inner.invar_address.reduction_dim.16, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.14

reduce.7.inner.loop_exit.reduction_dim.13:        ; preds = %reduce.7.inner.loop_header.reduction_dim.14
  %27 = load float, float* %accumulator_02, align 4
  %28 = bitcast [32 x float]* %3 to float*
  %29 = getelementptr inbounds float, float* %28, i32 %linear_index1
  store float %27, float* %29, align 4
  %30 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_32 to float*), align 4, !invariant.load !24
  store float %30, float* %accumulator_012, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.116, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.114

reduce.7.inner.loop_header.reduction_dim.114:     ; preds = %reduce.7.inner.loop_body.reduction_dim.115, %reduce.7.inner.loop_exit.reduction_dim.13
  %reduce.7.inner.indvar.reduction_dim.117 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.116, align 4
  %31 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.117, 10
  br i1 %31, label %reduce.7.inner.loop_exit.reduction_dim.113, label %reduce.7.inner.loop_body.reduction_dim.115

reduce.7.inner.loop_body.reduction_dim.115:       ; preds = %reduce.7.inner.loop_header.reduction_dim.114
  %32 = load float, float* %accumulator_012, align 4
  %33 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %9, i32 %reduce.7.inner.indvar.reduction_dim.117
  %34 = load float, float* %33, align 4, !invariant.load !24
  store float %32, float* %parameter_buffer19, align 4
  store float %34, float* %parameter_buffer20, align 4
  call void @region_1_3(float* %parameter_buffer19, float* %parameter_buffer20, float* %return_buffer21)
  %35 = load float, float* %return_buffer21, align 4
  store float %35, float* %accumulator_012, align 4
  %invar.inc18 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.117, 1
  store i32 %invar.inc18, i32* %reduce.7.inner.invar_address.reduction_dim.116, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.114

reduce.7.inner.loop_exit.reduction_dim.113:       ; preds = %reduce.7.inner.loop_header.reduction_dim.114
  %36 = load float, float* %accumulator_012, align 4
  %37 = bitcast [32 x float]* %3 to float*
  %38 = getelementptr inbounds float, float* %37, i32 %linear_index2
  store float %36, float* %38, align 4
  %39 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_32 to float*), align 4, !invariant.load !24
  store float %39, float* %accumulator_022, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.126, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.124

reduce.7.inner.loop_header.reduction_dim.124:     ; preds = %reduce.7.inner.loop_body.reduction_dim.125, %reduce.7.inner.loop_exit.reduction_dim.113
  %reduce.7.inner.indvar.reduction_dim.127 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.126, align 4
  %40 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.127, 10
  br i1 %40, label %reduce.7.inner.loop_exit.reduction_dim.123, label %reduce.7.inner.loop_body.reduction_dim.125

reduce.7.inner.loop_body.reduction_dim.125:       ; preds = %reduce.7.inner.loop_header.reduction_dim.124
  %41 = load float, float* %accumulator_022, align 4
  %42 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %10, i32 %reduce.7.inner.indvar.reduction_dim.127
  %43 = load float, float* %42, align 4, !invariant.load !24
  store float %41, float* %parameter_buffer29, align 4
  store float %43, float* %parameter_buffer30, align 4
  call void @region_1_3(float* %parameter_buffer29, float* %parameter_buffer30, float* %return_buffer31)
  %44 = load float, float* %return_buffer31, align 4
  store float %44, float* %accumulator_022, align 4
  %invar.inc28 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.127, 1
  store i32 %invar.inc28, i32* %reduce.7.inner.invar_address.reduction_dim.126, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.124

reduce.7.inner.loop_exit.reduction_dim.123:       ; preds = %reduce.7.inner.loop_header.reduction_dim.124
  %45 = load float, float* %accumulator_022, align 4
  %46 = bitcast [32 x float]* %3 to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index3
  store float %45, float* %47, align 4
  br label %reduce_110.in_bounds-after
}

define internal void @region_1_3(float* dereferenceable(4) %Arg_0.4.typed, float* dereferenceable(4) %Arg_1.5.typed, float* dereferenceable(4) %output_arg) {
entry:
  %maximum.6.typed = alloca float, align 4
  %Arg_0.4 = load float, float* %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, float* %Arg_1.5.typed, align 4
  %0 = fcmp oge float %Arg_0.4, %Arg_1.5
  %1 = fcmp une float %Arg_0.4, %Arg_0.4
  %2 = or i1 %0, %1
  %maximum.6 = select i1 %2, float %Arg_0.4, float %Arg_1.5
  store float %maximum.6, float* %maximum.6.typed, align 4
  %load_ret_value = load float, float* %maximum.6.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_1(i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %return_buffer37 = alloca float, align 4
  %parameter_buffer36 = alloca float, align 4
  %parameter_buffer35 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.131 = alloca i32, align 4
  %accumulator_026 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %parameter_buffer24 = alloca float, align 4
  %parameter_buffer23 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.119 = alloca i32, align 4
  %accumulator_014 = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %parameter_buffer12 = alloca float, align 4
  %parameter_buffer11 = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.17 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.11.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 16384
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %3 = bitcast i8* %2 to [32 x float]*
  %4 = getelementptr inbounds i8, i8* %temp_buf, i64 128
  %5 = bitcast i8* %4 to [32 x float]*
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %8 = mul nuw nsw i32 %6, 8
  %linear_index = add nuw nsw i32 %8, %7
  %linear_index_in_range = icmp ult i32 %linear_index, 8
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %9 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %11 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = icmp ult i32 %linear_index_base, 32
  br i1 %13, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %reduce.11.inner.loop_exit.reduction_dim.128, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %region_0_13_constant_6 = load float, float* bitcast ([4 x i8]* @1 to float*), align 4
  store float %region_0_13_constant_6, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_header.reduction_dim.1:      ; preds = %reduce.11.inner.loop_body.reduction_dim.1, %fusion_1.in_bounds-true
  %reduce.11.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.1, align 4
  %14 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.1, 10
  br i1 %14, label %reduce.11.inner.loop_exit.reduction_dim.1, label %reduce.11.inner.loop_body.reduction_dim.1

reduce.11.inner.loop_body.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %15 = load float, float* %accumulator_0, align 4
  %16 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %9, i32 %reduce.11.inner.indvar.reduction_dim.1
  %17 = load float, float* %16, align 4, !invariant.load !24
  %18 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %9
  %19 = load float, float* %18, align 4, !invariant.load !24
  %subtract.4 = fsub float %17, %19
  %20 = call float @__nv_expf(float %subtract.4)
  store float %15, float* %parameter_buffer, align 4
  store float %20, float* %parameter_buffer1, align 4
  call void @region_1_7(float* %parameter_buffer, float* %parameter_buffer1, float* %return_buffer)
  %21 = load float, float* %return_buffer, align 4
  store float %21, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %22 = load float, float* %accumulator_0, align 4
  %23 = call float @__nv_logf(float %22)
  %24 = bitcast [32 x float]* %5 to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index_base
  store float %23, float* %25, align 4
  %region_0_13_constant_63 = load float, float* bitcast ([4 x i8]* @1 to float*), align 4
  store float %region_0_13_constant_63, float* %accumulator_02, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_header.reduction_dim.15:     ; preds = %reduce.11.inner.loop_body.reduction_dim.16, %reduce.11.inner.loop_exit.reduction_dim.1
  %reduce.11.inner.indvar.reduction_dim.18 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.17, align 4
  %26 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.18, 10
  br i1 %26, label %reduce.11.inner.loop_exit.reduction_dim.14, label %reduce.11.inner.loop_body.reduction_dim.16

reduce.11.inner.loop_body.reduction_dim.16:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %27 = load float, float* %accumulator_02, align 4
  %28 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %10, i32 %reduce.11.inner.indvar.reduction_dim.18
  %29 = load float, float* %28, align 4, !invariant.load !24
  %30 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %10
  %31 = load float, float* %30, align 4, !invariant.load !24
  %subtract.410 = fsub float %29, %31
  %32 = call float @__nv_expf(float %subtract.410)
  store float %27, float* %parameter_buffer11, align 4
  store float %32, float* %parameter_buffer12, align 4
  call void @region_1_7(float* %parameter_buffer11, float* %parameter_buffer12, float* %return_buffer13)
  %33 = load float, float* %return_buffer13, align 4
  store float %33, float* %accumulator_02, align 4
  %invar.inc9 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.18, 1
  store i32 %invar.inc9, i32* %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_exit.reduction_dim.14:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %34 = load float, float* %accumulator_02, align 4
  %35 = call float @__nv_logf(float %34)
  %36 = bitcast [32 x float]* %5 to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index1
  store float %35, float* %37, align 4
  %region_0_13_constant_615 = load float, float* bitcast ([4 x i8]* @1 to float*), align 4
  store float %region_0_13_constant_615, float* %accumulator_014, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.117

reduce.11.inner.loop_header.reduction_dim.117:    ; preds = %reduce.11.inner.loop_body.reduction_dim.118, %reduce.11.inner.loop_exit.reduction_dim.14
  %reduce.11.inner.indvar.reduction_dim.120 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.119, align 4
  %38 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.120, 10
  br i1 %38, label %reduce.11.inner.loop_exit.reduction_dim.116, label %reduce.11.inner.loop_body.reduction_dim.118

reduce.11.inner.loop_body.reduction_dim.118:      ; preds = %reduce.11.inner.loop_header.reduction_dim.117
  %39 = load float, float* %accumulator_014, align 4
  %40 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %11, i32 %reduce.11.inner.indvar.reduction_dim.120
  %41 = load float, float* %40, align 4, !invariant.load !24
  %42 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %11
  %43 = load float, float* %42, align 4, !invariant.load !24
  %subtract.422 = fsub float %41, %43
  %44 = call float @__nv_expf(float %subtract.422)
  store float %39, float* %parameter_buffer23, align 4
  store float %44, float* %parameter_buffer24, align 4
  call void @region_1_7(float* %parameter_buffer23, float* %parameter_buffer24, float* %return_buffer25)
  %45 = load float, float* %return_buffer25, align 4
  store float %45, float* %accumulator_014, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.120, 1
  store i32 %invar.inc21, i32* %reduce.11.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.117

reduce.11.inner.loop_exit.reduction_dim.116:      ; preds = %reduce.11.inner.loop_header.reduction_dim.117
  %46 = load float, float* %accumulator_014, align 4
  %47 = call float @__nv_logf(float %46)
  %48 = bitcast [32 x float]* %5 to float*
  %49 = getelementptr inbounds float, float* %48, i32 %linear_index2
  store float %47, float* %49, align 4
  %region_0_13_constant_627 = load float, float* bitcast ([4 x i8]* @1 to float*), align 4
  store float %region_0_13_constant_627, float* %accumulator_026, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.131, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.129

reduce.11.inner.loop_header.reduction_dim.129:    ; preds = %reduce.11.inner.loop_body.reduction_dim.130, %reduce.11.inner.loop_exit.reduction_dim.116
  %reduce.11.inner.indvar.reduction_dim.132 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.131, align 4
  %50 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.132, 10
  br i1 %50, label %reduce.11.inner.loop_exit.reduction_dim.128, label %reduce.11.inner.loop_body.reduction_dim.130

reduce.11.inner.loop_body.reduction_dim.130:      ; preds = %reduce.11.inner.loop_header.reduction_dim.129
  %51 = load float, float* %accumulator_026, align 4
  %52 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %12, i32 %reduce.11.inner.indvar.reduction_dim.132
  %53 = load float, float* %52, align 4, !invariant.load !24
  %54 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %12
  %55 = load float, float* %54, align 4, !invariant.load !24
  %subtract.434 = fsub float %53, %55
  %56 = call float @__nv_expf(float %subtract.434)
  store float %51, float* %parameter_buffer35, align 4
  store float %56, float* %parameter_buffer36, align 4
  call void @region_1_7(float* %parameter_buffer35, float* %parameter_buffer36, float* %return_buffer37)
  %57 = load float, float* %return_buffer37, align 4
  store float %57, float* %accumulator_026, align 4
  %invar.inc33 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.132, 1
  store i32 %invar.inc33, i32* %reduce.11.inner.invar_address.reduction_dim.131, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.129

reduce.11.inner.loop_exit.reduction_dim.128:      ; preds = %reduce.11.inner.loop_header.reduction_dim.129
  %58 = load float, float* %accumulator_026, align 4
  %59 = call float @__nv_logf(float %58)
  %60 = bitcast [32 x float]* %5 to float*
  %61 = getelementptr inbounds float, float* %60, i32 %linear_index3
  store float %59, float* %61, align 4
  br label %fusion_1.in_bounds-after
}

; Function Attrs: nounwind readnone
declare float @__nv_expf(float) #2

define internal void @region_1_7(float* dereferenceable(4) %Arg_0.8.typed, float* dereferenceable(4) %Arg_1.9.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.10.typed = alloca float, align 4
  %Arg_0.8 = load float, float* %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, float* %Arg_1.9.typed, align 4
  %add.10 = fadd float %Arg_0.8, %Arg_1.9
  store float %add.10, float* %add.10.typed, align 4
  %load_ret_value = load float, float* %add.10.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare float @__nv_logf(float) #2

define void @input_fusion_reduce(i8* noalias align 16 dereferenceable(32) %alloc1, i8* noalias align 128 dereferenceable(4) %alloc11, i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %return_buffer64 = alloca float, align 4
  %result_from_other_lane62 = alloca float, align 4
  %return_buffer61 = alloca float, align 4
  %result_from_other_lane59 = alloca float, align 4
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %result_from_other_lane47 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane44 = alloca float, align 4
  %return_buffer43 = alloca float, align 4
  %result_from_other_lane41 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %tile_loop.invar_address12 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 128
  %1 = bitcast i8* %0 to [32 x float]*
  %2 = getelementptr inbounds i8, i8* %alloc1, i64 0
  %3 = bitcast i8* %2 to [32 x i8]*
  %4 = getelementptr inbounds i8, i8* %temp_buf, i64 16384
  %5 = bitcast i8* %4 to [32 x [10 x float]]*
  %6 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %7 = bitcast i8* %6 to [32 x float]*
  %8 = getelementptr inbounds i8, i8* %alloc11, i64 0
  %9 = bitcast i8* %8 to float*
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !26
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_41_constant_11 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %12 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  store float %region_0_41_constant_11, float* %12, align 4
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %15 = urem i32 %13, 32
  %16 = udiv i32 %13, 32
  %17 = mul i32 %14, 1
  %18 = add i32 %17, %16
  %19 = icmp ult i32 %18, 1
  br i1 %19, label %20, label %early_return

20:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %15, 32
  %thread_id.y = udiv i32 %15, 32
  %lane_id = urem i32 %15, 32
  %21 = udiv i32 %18, 1
  %22 = urem i32 %21, 1
  %23 = udiv i32 %18, 1
  %24 = urem i32 %23, 1
  %25 = udiv i32 %18, 1
  %block_origin.z = mul i32 %25, 1
  %26 = icmp eq i32 %24, 0
  %tile_bound = select i1 %26, i32 1, i32 1
  %27 = icmp eq i32 %22, 0
  %tile_bound1 = select i1 %27, i32 320, i32 512
  %tile_origin.1 = mul i32 %24, 1
  %tile_origin.2 = mul i32 %22, 512
  %28 = mul i32 %thread_id.x, 1
  %29 = add i32 %tile_origin.2, %28
  store i32 %thread_id.y, i32* %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %20
  %y_in_tile.indvar = load i32, i32* %y_in_tile.invar_address, align 4
  %30 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %30, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, i32* %y_in_tile.invar_address, align 4
  %31 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %32 = icmp eq i32 512, %tile_bound1
  br i1 %32, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit9, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !28

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  %partial_reduction_result36 = load float, float* %current_output, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 16, i32 31)
  store float %33, float* %result_from_other_lane, align 4
  call void @region_1_36(float* %current_output, float* %result_from_other_lane, float* %return_buffer37)
  %34 = load float, float* %return_buffer37, align 4
  store float %34, float* %current_output, align 4
  %partial_reduction_result39 = load float, float* %current_output, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 8, i32 31)
  store float %35, float* %result_from_other_lane38, align 4
  call void @region_1_36(float* %current_output, float* %result_from_other_lane38, float* %return_buffer40)
  %36 = load float, float* %return_buffer40, align 4
  store float %36, float* %current_output, align 4
  %partial_reduction_result42 = load float, float* %current_output, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result42, i32 4, i32 31)
  store float %37, float* %result_from_other_lane41, align 4
  call void @region_1_36(float* %current_output, float* %result_from_other_lane41, float* %return_buffer43)
  %38 = load float, float* %return_buffer43, align 4
  store float %38, float* %current_output, align 4
  %partial_reduction_result45 = load float, float* %current_output, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 2, i32 31)
  store float %39, float* %result_from_other_lane44, align 4
  call void @region_1_36(float* %current_output, float* %result_from_other_lane44, float* %return_buffer46)
  %40 = load float, float* %return_buffer46, align 4
  store float %40, float* %current_output, align 4
  %partial_reduction_result48 = load float, float* %current_output, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result48, i32 1, i32 31)
  store float %41, float* %result_from_other_lane47, align 4
  call void @region_1_36(float* %current_output, float* %result_from_other_lane47, float* %return_buffer49)
  %42 = load float, float* %return_buffer49, align 4
  store float %42, float* %current_output, align 4
  %43 = udiv i32 %thread_id.x, 32
  %44 = icmp eq i32 %lane_id, 0
  br i1 %44, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %45 = icmp eq i32 %43, 0
  br i1 %45, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %46 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, i32* %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, i32* %tile_loop.invar_address, align 4
  %47 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %47, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, i32* %tile_loop.invar_address, align 4
  %48 = icmp eq i32 %tile_loop.indvar, 0
  %49 = mul i32 %tile_loop.indvar, 1
  %50 = add i32 %49, 0
  %51 = mul i32 %tile_loop.indvar, 32
  %52 = add i32 %51, 0
  %x_loc = add i32 %52, %28
  %53 = mul i32 %tile_loop.indvar, 32
  %54 = add i32 %53, 0
  %55 = add i32 %29, %54
  %56 = mul nuw nsw i32 %55, 1
  %57 = add nuw nsw i32 0, %56
  %58 = mul nuw nsw i32 %46, 320
  %59 = add nuw nsw i32 %57, %58
  %60 = mul nuw nsw i32 %block_origin.z, 320
  %61 = add nuw nsw i32 %59, %60
  %62 = udiv i32 %61, 1
  %63 = mul nuw nsw i32 %62, 1
  %64 = add nuw nsw i32 0, %63
  %65 = urem i32 %64, 10
  %66 = udiv i32 %64, 10
  %67 = udiv i32 %66, 32
  %Arg_1.2 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i32 %66
  %Arg_1.23 = load i8, i8* %Arg_1.2, align 1, !invariant.load !24
  %68 = zext i8 %Arg_1.23 to i64
  %69 = mul nuw nsw i32 %65, 1
  %70 = add nuw nsw i32 0, %69
  %71 = zext i32 %70 to i64
  %72 = icmp eq i64 %68, %71
  %73 = zext i1 %72 to i8
  %region_0_41_constant_9 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  %region_0_41_constant_114 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %74 = trunc i8 %73 to i1
  %75 = select i1 %74, float %region_0_41_constant_9, float %region_0_41_constant_114
  %region_0_41_constant_14 = load i64, i64* bitcast ([8 x i8]* @5 to i64*), align 8
  %76 = icmp sle i64 %region_0_41_constant_14, %68
  %77 = zext i1 %76 to i8
  %region_0_41_constant_17 = load i64, i64* bitcast ([8 x i8]* @4 to i64*), align 8
  %78 = icmp slt i64 %68, %region_0_41_constant_17
  %79 = zext i1 %78 to i8
  %80 = and i8 %77, %79
  %region_0_41_constant_115 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %region_0_41_constant_22 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %81 = trunc i8 %80 to i1
  %82 = select i1 %81, float %region_0_41_constant_115, float %region_0_41_constant_22
  %add.26 = fadd float %75, %82
  %83 = fneg float %add.26
  %compare.28 = fcmp oeq float %add.26, %region_0_41_constant_114
  %84 = zext i1 %compare.28 to i8
  %85 = bitcast [32 x [10 x float]]* %5 to float*
  %Arg_2.3 = getelementptr inbounds float, float* %85, i32 %61
  %Arg_2.36 = load float, float* %Arg_2.3, align 4, !invariant.load !24
  %Arg_3.4 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %66
  %Arg_3.47 = load float, float* %Arg_3.4, align 4, !invariant.load !24
  %subtract.30 = fsub float %Arg_2.36, %Arg_3.47
  %Arg_0.1 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %66
  %Arg_0.18 = load float, float* %Arg_0.1, align 4, !invariant.load !24
  %subtract.32 = fsub float %subtract.30, %Arg_0.18
  %86 = trunc i8 %84 to i1
  %87 = select i1 %86, float %region_0_41_constant_114, float %subtract.32
  %multiply.34 = fmul float %83, %87
  store float %multiply.34, float* %reduction_input_address, align 4
  %88 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  call void @region_1_36(float* %88, float* %reduction_input_address, float* %return_buffer)
  %89 = load float, float* %return_buffer, align 4
  store float %89, float* %88, align 4
  br label %tile_loop.loop_header, !llvm.loop !30

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %90 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, i32* %tile_loop.invar_address12, align 4
  br label %tile_loop.loop_header10

tile_loop.loop_header10:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar13 = load i32, i32* %tile_loop.invar_address12, align 4
  %91 = icmp uge i32 %tile_loop.indvar13, 16
  br i1 %91, label %tile_loop.loop_exit9, label %tile_loop.loop_body11

tile_loop.loop_body11:                            ; preds = %tile_loop.loop_header10
  %invar.inc14 = add nuw nsw i32 %tile_loop.indvar13, 1
  store i32 %invar.inc14, i32* %tile_loop.invar_address12, align 4
  %92 = icmp eq i32 %tile_loop.indvar13, 0
  %93 = mul i32 %tile_loop.indvar13, 1
  %94 = add i32 %93, 0
  %95 = mul i32 %tile_loop.indvar13, 32
  %96 = add i32 %95, 0
  %x_loc15 = add i32 %96, %28
  %97 = mul i32 %tile_loop.indvar13, 32
  %98 = add i32 %97, 0
  %99 = add i32 %29, %98
  %100 = icmp ult i32 %x_loc15, %tile_bound1
  br i1 %100, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body11
  br label %tile_loop.loop_header10, !llvm.loop !32

tile_loop.loop_exit9:                             ; preds = %tile_loop.loop_header10
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body11
  %101 = mul nuw nsw i32 %99, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %90, 320
  %104 = add nuw nsw i32 %102, %103
  %105 = mul nuw nsw i32 %block_origin.z, 320
  %106 = add nuw nsw i32 %104, %105
  %107 = udiv i32 %106, 1
  %108 = mul nuw nsw i32 %107, 1
  %109 = add nuw nsw i32 0, %108
  %110 = urem i32 %109, 10
  %111 = udiv i32 %109, 10
  %112 = udiv i32 %111, 32
  %Arg_1.216 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i32 %111
  %Arg_1.217 = load i8, i8* %Arg_1.216, align 1, !invariant.load !24
  %113 = zext i8 %Arg_1.217 to i64
  %114 = mul nuw nsw i32 %110, 1
  %115 = add nuw nsw i32 0, %114
  %116 = zext i32 %115 to i64
  %117 = icmp eq i64 %113, %116
  %118 = zext i1 %117 to i8
  %region_0_41_constant_918 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  %region_0_41_constant_1119 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %119 = trunc i8 %118 to i1
  %120 = select i1 %119, float %region_0_41_constant_918, float %region_0_41_constant_1119
  %region_0_41_constant_1420 = load i64, i64* bitcast ([8 x i8]* @5 to i64*), align 8
  %121 = icmp sle i64 %region_0_41_constant_1420, %113
  %122 = zext i1 %121 to i8
  %region_0_41_constant_1721 = load i64, i64* bitcast ([8 x i8]* @4 to i64*), align 8
  %123 = icmp slt i64 %113, %region_0_41_constant_1721
  %124 = zext i1 %123 to i8
  %125 = and i8 %122, %124
  %region_0_41_constant_1122 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %region_0_41_constant_2223 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %126 = trunc i8 %125 to i1
  %127 = select i1 %126, float %region_0_41_constant_1122, float %region_0_41_constant_2223
  %add.2624 = fadd float %120, %127
  %128 = fneg float %add.2624
  %compare.2825 = fcmp oeq float %add.2624, %region_0_41_constant_1119
  %129 = zext i1 %compare.2825 to i8
  %130 = bitcast [32 x [10 x float]]* %5 to float*
  %Arg_2.326 = getelementptr inbounds float, float* %130, i32 %106
  %Arg_2.327 = load float, float* %Arg_2.326, align 4, !invariant.load !24
  %Arg_3.428 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %111
  %Arg_3.429 = load float, float* %Arg_3.428, align 4, !invariant.load !24
  %subtract.3030 = fsub float %Arg_2.327, %Arg_3.429
  %Arg_0.131 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %111
  %Arg_0.132 = load float, float* %Arg_0.131, align 4, !invariant.load !24
  %subtract.3233 = fsub float %subtract.3030, %Arg_0.132
  %131 = trunc i8 %129 to i1
  %132 = select i1 %131, float %region_0_41_constant_1119, float %subtract.3233
  %multiply.3434 = fmul float %128, %132
  store float %multiply.3434, float* %reduction_input_address, align 4
  %133 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  call void @region_1_36(float* %133, float* %reduction_input_address, float* %return_buffer35)
  %134 = load float, float* %return_buffer35, align 4
  store float %134, float* %133, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %135 = getelementptr inbounds [1 x [1 x [1 x float]]], [1 x [1 x [1 x float]]] addrspace(3)* @shared_cache, i32 0, i32 %16, i32 0, i32 %43
  %136 = addrspacecast float addrspace(3)* %135 to float*
  %137 = load float, float* %current_output, align 4
  store float %137, float* %136, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %138 = getelementptr inbounds [1 x [1 x [1 x float]]], [1 x [1 x [1 x float]]] addrspace(3)* @shared_cache, i32 0, i32 %16, i32 0, i32 %lane_id
  %139 = addrspacecast float addrspace(3)* %138 to float*
  store float %region_0_41_constant_11, float* %initial_value_addr, align 4
  %140 = icmp ult i32 %thread_id.x, 1
  %141 = select i1 %140, float* %139, float* %initial_value_addr
  %partial_reduction_result51 = load float, float* %141, align 4
  %142 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  store float %142, float* %result_from_other_lane50, align 4
  call void @region_1_36(float* %141, float* %result_from_other_lane50, float* %return_buffer52)
  %143 = load float, float* %return_buffer52, align 4
  store float %143, float* %141, align 4
  %partial_reduction_result54 = load float, float* %141, align 4
  %144 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 8, i32 31)
  store float %144, float* %result_from_other_lane53, align 4
  call void @region_1_36(float* %141, float* %result_from_other_lane53, float* %return_buffer55)
  %145 = load float, float* %return_buffer55, align 4
  store float %145, float* %141, align 4
  %partial_reduction_result57 = load float, float* %141, align 4
  %146 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 4, i32 31)
  store float %146, float* %result_from_other_lane56, align 4
  call void @region_1_36(float* %141, float* %result_from_other_lane56, float* %return_buffer58)
  %147 = load float, float* %return_buffer58, align 4
  store float %147, float* %141, align 4
  %partial_reduction_result60 = load float, float* %141, align 4
  %148 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result60, i32 2, i32 31)
  store float %148, float* %result_from_other_lane59, align 4
  call void @region_1_36(float* %141, float* %result_from_other_lane59, float* %return_buffer61)
  %149 = load float, float* %return_buffer61, align 4
  store float %149, float* %141, align 4
  %partial_reduction_result63 = load float, float* %141, align 4
  %150 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result63, i32 1, i32 31)
  store float %150, float* %result_from_other_lane62, align 4
  call void @region_1_36(float* %141, float* %result_from_other_lane62, float* %return_buffer64)
  %151 = load float, float* %return_buffer64, align 4
  store float %151, float* %141, align 4
  %152 = icmp eq i32 %thread_id.x, 0
  br i1 %152, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %153 = mul i32 %thread_id.x, 1
  %154 = add i32 %tile_origin.1, %thread_id.y
  %155 = add i32 %tile_origin.2, %153
  %156 = add i32 %155, 0
  %output = load float, float* %141, align 4
  store float %output, float* %9, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_36(float* dereferenceable(4) %Arg_0.37.typed, float* dereferenceable(4) %Arg_1.38.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.39.typed = alloca float, align 4
  %Arg_0.37 = load float, float* %Arg_0.37.typed, align 4
  %Arg_1.38 = load float, float* %Arg_1.38.typed, align 4
  %add.39 = fadd float %Arg_0.37, %Arg_1.38
  store float %add.39, float* %add.39.typed, align 4
  %load_ret_value = load float, float* %add.39.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

; Function Attrs: convergent inaccessiblememonly nounwind
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #4

define void @iota_34(i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %1 = bitcast i8* %0 to [32 x [10 x i32]]*
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %4 = mul nuw nsw i32 %2, 80
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 80
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 10
  %7 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 10
  %10 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 10
  %13 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 10
  %16 = udiv i32 %linear_index3, 10
  %17 = icmp ult i32 %linear_index_base, 320
  br i1 %17, label %iota_34.in_bounds-true, label %iota_34.in_bounds-after

iota_34.in_bounds-after:                          ; preds = %iota_34.in_bounds-true, %entry
  ret void

iota_34.in_bounds-true:                           ; preds = %entry
  %18 = mul nuw nsw i32 %6, 1
  %19 = add nuw nsw i32 0, %18
  %20 = bitcast [32 x [10 x i32]]* %1 to i32*
  %21 = getelementptr inbounds i32, i32* %20, i32 %linear_index_base
  store i32 %19, i32* %21, align 4
  %22 = mul nuw nsw i32 %9, 1
  %23 = add nuw nsw i32 0, %22
  %24 = bitcast [32 x [10 x i32]]* %1 to i32*
  %25 = getelementptr inbounds i32, i32* %24, i32 %linear_index1
  store i32 %23, i32* %25, align 4
  %26 = mul nuw nsw i32 %12, 1
  %27 = add nuw nsw i32 0, %26
  %28 = bitcast [32 x [10 x i32]]* %1 to i32*
  %29 = getelementptr inbounds i32, i32* %28, i32 %linear_index2
  store i32 %27, i32* %29, align 4
  %30 = mul nuw nsw i32 %15, 1
  %31 = add nuw nsw i32 0, %30
  %32 = bitcast [32 x [10 x i32]]* %1 to i32*
  %33 = getelementptr inbounds i32, i32* %32, i32 %linear_index3
  store i32 %31, i32* %33, align 4
  br label %iota_34.in_bounds-after
}

define void @reduce_47(i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %tuple_element_0 = alloca float, align 4
  %tuple_element_1 = alloca i32, align 4
  %return_buffer = alloca [2 x i8*], align 8
  %parameter_buffer3 = alloca i32, align 4
  %parameter_buffer2 = alloca float, align 4
  %parameter_buffer1 = alloca i32, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.26.inner.invar_address.reduction_dim.1 = alloca i32, align 4
  %accumulator_1 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 16384
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %3 = bitcast i8* %2 to [32 x [10 x i32]]*
  %4 = getelementptr inbounds i8, i8* %temp_buf, i64 1280
  %5 = bitcast i8* %4 to [32 x float]*
  %6 = getelementptr inbounds i8, i8* %temp_buf, i64 1408
  %7 = bitcast i8* %6 to [32 x i32]*
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %10 = mul nuw nsw i32 %8, 32
  %linear_index = add nuw nsw i32 %10, %9
  %linear_index_in_range = icmp ult i32 %linear_index, 32
  call void @llvm.assume(i1 %linear_index_in_range)
  %11 = udiv i32 %linear_index, 1
  %12 = icmp ult i32 %linear_index, 32
  br i1 %12, label %reduce_47.in_bounds-true, label %reduce_47.in_bounds-after

reduce_47.in_bounds-after:                        ; preds = %reduce.26.inner.loop_exit.reduction_dim.1, %entry
  ret void

reduce_47.in_bounds-true:                         ; preds = %entry
  %13 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_32 to float*), align 4, !invariant.load !24
  store float %13, float* %accumulator_0, align 4
  %14 = load i32, i32* bitcast ([4 x i8]* @buffer_for_constant_33 to i32*), align 4, !invariant.load !24
  store i32 %14, i32* %accumulator_1, align 4
  store i32 0, i32* %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_header.reduction_dim.1:      ; preds = %reduce.26.inner.loop_body.reduction_dim.1, %reduce_47.in_bounds-true
  %reduce.26.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.26.inner.invar_address.reduction_dim.1, align 4
  %15 = icmp uge i32 %reduce.26.inner.indvar.reduction_dim.1, 10
  br i1 %15, label %reduce.26.inner.loop_exit.reduction_dim.1, label %reduce.26.inner.loop_body.reduction_dim.1

reduce.26.inner.loop_body.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %16 = load float, float* %accumulator_0, align 4
  %17 = load i32, i32* %accumulator_1, align 4
  %18 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %11, i32 %reduce.26.inner.indvar.reduction_dim.1
  %19 = load float, float* %18, align 4, !invariant.load !24
  %20 = getelementptr inbounds [32 x [10 x i32]], [32 x [10 x i32]]* %3, i32 0, i32 %11, i32 %reduce.26.inner.indvar.reduction_dim.1
  %21 = load i32, i32* %20, align 4, !invariant.load !24
  store float %16, float* %parameter_buffer, align 4
  store i32 %17, i32* %parameter_buffer1, align 4
  store float %19, float* %parameter_buffer2, align 4
  store i32 %21, i32* %parameter_buffer3, align 4
  %22 = bitcast float* %tuple_element_0 to i8*
  %23 = getelementptr inbounds [2 x i8*], [2 x i8*]* %return_buffer, i64 0, i64 0
  store i8* %22, i8** %23, align 8
  %24 = bitcast i32* %tuple_element_1 to i8*
  %25 = getelementptr inbounds [2 x i8*], [2 x i8*]* %return_buffer, i64 0, i64 1
  store i8* %24, i8** %25, align 8
  call void @region_1_17(float* %parameter_buffer, i32* %parameter_buffer1, float* %parameter_buffer2, i32* %parameter_buffer3, [2 x i8*]* %return_buffer)
  %26 = load float, float* %tuple_element_0, align 4
  %27 = load i32, i32* %tuple_element_1, align 4
  store float %26, float* %accumulator_0, align 4
  store i32 %27, i32* %accumulator_1, align 4
  %invar.inc = add nuw nsw i32 %reduce.26.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %28 = load float, float* %accumulator_0, align 4
  %29 = insertvalue { float, i32 } undef, float %28, 0
  %30 = load i32, i32* %accumulator_1, align 4
  %31 = insertvalue { float, i32 } %29, i32 %30, 1
  %32 = extractvalue { float, i32 } %31, 0
  %33 = bitcast [32 x float]* %5 to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index
  store float %32, float* %34, align 4
  %35 = extractvalue { float, i32 } %31, 1
  %36 = bitcast [32 x i32]* %7 to i32*
  %37 = getelementptr inbounds i32, i32* %36, i32 %linear_index
  store i32 %35, i32* %37, align 4
  br label %reduce_47.in_bounds-after
}

define internal void @region_1_17(float* dereferenceable(4) %Arg_0.18.typed, i32* dereferenceable(4) %Arg_1.19.typed, float* dereferenceable(4) %Arg_2.20.typed, i32* dereferenceable(4) %Arg_3.21.typed, [2 x i8*]* dereferenceable(16) %output_arg) {
entry:
  %fusion.22.raw5 = alloca [2 x i8*], align 8
  %fusion.22.raw = alloca [2 x i8*], align 8
  %fusion.22.typed = alloca [2 x i8*], align 8
  %tuple.25.raw2 = alloca [2 x i8*], align 8
  %tuple.25.raw = alloca [2 x i8*], align 8
  %tuple.25.typed = alloca [2 x i8*], align 8
  %tuple.25.typed1 = bitcast [2 x i8*]* %tuple.25.raw to float*
  %tuple.25.typed3 = bitcast [2 x i8*]* %tuple.25.raw2 to i32*
  %fusion.22.typed4 = bitcast [2 x i8*]* %fusion.22.raw to i32*
  %fusion.22.typed6 = bitcast [2 x i8*]* %fusion.22.raw5 to float*
  %Arg_0.18 = load float, float* %Arg_0.18.typed, align 4
  %Arg_2.20 = load float, float* %Arg_2.20.typed, align 4
  %compare.10 = fcmp oeq float %Arg_0.18, %Arg_2.20
  %0 = zext i1 %compare.10 to i8
  %Arg_1.19 = load i32, i32* %Arg_1.19.typed, align 4
  %Arg_3.21 = load i32, i32* %Arg_3.21.typed, align 4
  %1 = icmp sle i32 %Arg_1.19, %Arg_3.21
  %2 = select i1 %1, i32 %Arg_1.19, i32 %Arg_3.21
  %Arg_0.187 = load float, float* %Arg_0.18.typed, align 4
  %Arg_2.208 = load float, float* %Arg_2.20.typed, align 4
  %compare.12 = fcmp oge float %Arg_0.187, %Arg_2.208
  %3 = zext i1 %compare.12 to i8
  %Arg_1.199 = load i32, i32* %Arg_1.19.typed, align 4
  %Arg_3.2110 = load i32, i32* %Arg_3.21.typed, align 4
  %4 = trunc i8 %3 to i1
  %5 = select i1 %4, i32 %Arg_1.199, i32 %Arg_3.2110
  %6 = trunc i8 %0 to i1
  %7 = select i1 %6, i32 %2, i32 %5
  %8 = insertvalue { i32, float } undef, i32 %7, 0
  %Arg_0.1811 = load float, float* %Arg_0.18.typed, align 4
  %Arg_2.2012 = load float, float* %Arg_2.20.typed, align 4
  %9 = trunc i8 %3 to i1
  %10 = select i1 %9, float %Arg_0.1811, float %Arg_2.2012
  %11 = insertvalue { i32, float } %8, float %10, 1
  %12 = extractvalue { i32, float } %11, 0
  store i32 %12, i32* %fusion.22.typed4, align 4
  %13 = extractvalue { i32, float } %11, 1
  store float %13, float* %fusion.22.typed6, align 4
  %14 = bitcast i32* %fusion.22.typed4 to i8*
  %15 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.22.typed, i64 0, i64 0
  store i8* %14, i8** %15, align 8
  %16 = bitcast float* %fusion.22.typed6 to i8*
  %17 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.22.typed, i64 0, i64 1
  store i8* %16, i8** %17, align 8
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.22.typed, i64 0, i64 1
  %19 = load i8*, i8** %18, align 8, !dereferenceable !33, !align !34
  %get-tuple-element.24.typed = bitcast i8* %19 to float*
  %20 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.22.typed, i64 0, i64 0
  %21 = load i8*, i8** %20, align 8, !dereferenceable !33, !align !34
  %get-tuple-element.23.typed = bitcast i8* %21 to i32*
  %22 = bitcast float* %get-tuple-element.24.typed to i8*
  %23 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 0
  store i8* %22, i8** %23, align 8
  %24 = bitcast i32* %get-tuple-element.23.typed to i8*
  %25 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 1
  store i8* %24, i8** %25, align 8
  %26 = getelementptr inbounds [2 x i8*], [2 x i8*]* %output_arg, i64 0, i64 0
  %27 = load i8*, i8** %26, align 8, !dereferenceable !33, !align !34
  %28 = bitcast i8* %27 to float*
  %29 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 0
  %30 = load i8*, i8** %29, align 8, !dereferenceable !33, !align !34
  %31 = bitcast i8* %30 to float*
  %32 = load float, float* %31, align 4
  store float %32, float* %28, align 4
  %33 = getelementptr inbounds [2 x i8*], [2 x i8*]* %output_arg, i64 0, i64 1
  %34 = load i8*, i8** %33, align 8, !dereferenceable !33, !align !34
  %35 = bitcast i8* %34 to i32*
  %36 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 1
  %37 = load i8*, i8** %36, align 8, !dereferenceable !33, !align !34
  %38 = bitcast i8* %37 to i32*
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %35, align 4
  ret void
}

define void @input_fusion_reduce_1(i8* noalias align 16 dereferenceable(32) %alloc1, i8* noalias align 128 dereferenceable(4) %alloc10, i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane44 = alloca float, align 4
  %return_buffer43 = alloca float, align 4
  %result_from_other_lane41 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %result_from_other_lane20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 1408
  %1 = bitcast i8* %0 to [32 x i32]*
  %2 = getelementptr inbounds i8, i8* %alloc1, i64 0
  %3 = bitcast i8* %2 to [32 x i8]*
  %4 = getelementptr inbounds i8, i8* %alloc10, i64 0
  %5 = bitcast i8* %4 to float*
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !26
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_14_constant_8 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %8 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  store float %region_0_14_constant_8, float* %8, align 4
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %11 = urem i32 %9, 32
  %12 = udiv i32 %9, 32
  %13 = mul i32 %10, 5
  %14 = add i32 %13, %12
  %15 = icmp ult i32 %14, 1
  br i1 %15, label %16, label %early_return

16:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %11, 32
  %thread_id.y = udiv i32 %11, 32
  %lane_id = urem i32 %11, 32
  %17 = udiv i32 %14, 1
  %18 = urem i32 %17, 1
  %19 = udiv i32 %14, 1
  %20 = urem i32 %19, 1
  %21 = udiv i32 %14, 1
  %block_origin.z = mul i32 %21, 1
  %22 = icmp eq i32 %20, 0
  %tile_bound = select i1 %22, i32 1, i32 1
  %23 = icmp eq i32 %18, 0
  %tile_bound1 = select i1 %23, i32 32, i32 512
  %tile_origin.1 = mul i32 %20, 1
  %tile_origin.2 = mul i32 %18, 512
  %24 = mul i32 %thread_id.x, 1
  %25 = add i32 %tile_origin.2, %24
  store i32 %thread_id.y, i32* %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %16
  %y_in_tile.indvar = load i32, i32* %y_in_tile.invar_address, align 4
  %26 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %26, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, i32* %y_in_tile.invar_address, align 4
  %27 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %28 = icmp eq i32 512, %tile_bound1
  br i1 %28, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !36

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, float* %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %29, float* %result_from_other_lane, align 4
  call void @region_1_9(float* %current_output, float* %result_from_other_lane, float* %return_buffer19)
  %30 = load float, float* %return_buffer19, align 4
  store float %30, float* %current_output, align 4
  %partial_reduction_result21 = load float, float* %current_output, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %31, float* %result_from_other_lane20, align 4
  call void @region_1_9(float* %current_output, float* %result_from_other_lane20, float* %return_buffer22)
  %32 = load float, float* %return_buffer22, align 4
  store float %32, float* %current_output, align 4
  %partial_reduction_result24 = load float, float* %current_output, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %33, float* %result_from_other_lane23, align 4
  call void @region_1_9(float* %current_output, float* %result_from_other_lane23, float* %return_buffer25)
  %34 = load float, float* %return_buffer25, align 4
  store float %34, float* %current_output, align 4
  %partial_reduction_result27 = load float, float* %current_output, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %35, float* %result_from_other_lane26, align 4
  call void @region_1_9(float* %current_output, float* %result_from_other_lane26, float* %return_buffer28)
  %36 = load float, float* %return_buffer28, align 4
  store float %36, float* %current_output, align 4
  %partial_reduction_result30 = load float, float* %current_output, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %37, float* %result_from_other_lane29, align 4
  call void @region_1_9(float* %current_output, float* %result_from_other_lane29, float* %return_buffer31)
  %38 = load float, float* %return_buffer31, align 4
  store float %38, float* %current_output, align 4
  %39 = udiv i32 %thread_id.x, 32
  %40 = icmp eq i32 %lane_id, 0
  br i1 %40, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %41 = icmp eq i32 %39, 0
  br i1 %41, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %42 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, i32* %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, i32* %tile_loop.invar_address, align 4
  %43 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %43, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, i32* %tile_loop.invar_address, align 4
  %44 = icmp eq i32 %tile_loop.indvar, 0
  %45 = mul i32 %tile_loop.indvar, 1
  %46 = add i32 %45, 0
  %47 = mul i32 %tile_loop.indvar, 32
  %48 = add i32 %47, 0
  %x_loc = add i32 %48, %24
  %49 = mul i32 %tile_loop.indvar, 32
  %50 = add i32 %49, 0
  %51 = add i32 %25, %50
  %52 = mul nuw nsw i32 %51, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %42, 32
  %55 = add nuw nsw i32 %53, %54
  %56 = mul nuw nsw i32 %block_origin.z, 32
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 1
  %59 = bitcast [32 x i8]* %3 to i8*
  %Arg_1.2 = getelementptr inbounds i8, i8* %59, i32 %57
  %Arg_1.23 = load i8, i8* %Arg_1.2, align 1, !invariant.load !24
  %60 = uitofp i8 %Arg_1.23 to float
  %61 = bitcast [32 x i32]* %1 to i32*
  %Arg_0.1 = getelementptr inbounds i32, i32* %61, i32 %57
  %Arg_0.14 = load i32, i32* %Arg_0.1, align 4, !invariant.load !24
  %62 = sext i32 %Arg_0.14 to i64
  %63 = sitofp i64 %62 to float
  %compare.6 = fcmp oeq float %60, %63
  %64 = zext i1 %compare.6 to i8
  %65 = uitofp i8 %64 to float
  store float %65, float* %reduction_input_address, align 4
  %66 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  call void @region_1_9(float* %66, float* %reduction_input_address, float* %return_buffer)
  %67 = load float, float* %return_buffer, align 4
  store float %67, float* %66, align 4
  br label %tile_loop.loop_header, !llvm.loop !37

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %68 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, i32* %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, i32* %tile_loop.invar_address8, align 4
  %69 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %69, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, i32* %tile_loop.invar_address8, align 4
  %70 = icmp eq i32 %tile_loop.indvar9, 0
  %71 = mul i32 %tile_loop.indvar9, 1
  %72 = add i32 %71, 0
  %73 = mul i32 %tile_loop.indvar9, 32
  %74 = add i32 %73, 0
  %x_loc11 = add i32 %74, %24
  %75 = mul i32 %tile_loop.indvar9, 32
  %76 = add i32 %75, 0
  %77 = add i32 %25, %76
  %78 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %78, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !38

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %79 = mul nuw nsw i32 %77, 1
  %80 = add nuw nsw i32 0, %79
  %81 = mul nuw nsw i32 %68, 32
  %82 = add nuw nsw i32 %80, %81
  %83 = mul nuw nsw i32 %block_origin.z, 32
  %84 = add nuw nsw i32 %82, %83
  %85 = udiv i32 %84, 1
  %86 = bitcast [32 x i8]* %3 to i8*
  %Arg_1.212 = getelementptr inbounds i8, i8* %86, i32 %84
  %Arg_1.213 = load i8, i8* %Arg_1.212, align 1, !invariant.load !24
  %87 = uitofp i8 %Arg_1.213 to float
  %88 = bitcast [32 x i32]* %1 to i32*
  %Arg_0.114 = getelementptr inbounds i32, i32* %88, i32 %84
  %Arg_0.115 = load i32, i32* %Arg_0.114, align 4, !invariant.load !24
  %89 = sext i32 %Arg_0.115 to i64
  %90 = sitofp i64 %89 to float
  %compare.616 = fcmp oeq float %87, %90
  %91 = zext i1 %compare.616 to i8
  %92 = uitofp i8 %91 to float
  store float %92, float* %reduction_input_address, align 4
  %93 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  call void @region_1_9(float* %93, float* %reduction_input_address, float* %return_buffer17)
  %94 = load float, float* %return_buffer17, align 4
  store float %94, float* %93, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %95 = getelementptr inbounds [5 x [1 x [1 x float]]], [5 x [1 x [1 x float]]] addrspace(3)* @shared_cache1, i32 0, i32 %12, i32 0, i32 %39
  %96 = addrspacecast float addrspace(3)* %95 to float*
  %97 = load float, float* %current_output, align 4
  store float %97, float* %96, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %98 = getelementptr inbounds [5 x [1 x [1 x float]]], [5 x [1 x [1 x float]]] addrspace(3)* @shared_cache1, i32 0, i32 %12, i32 0, i32 %lane_id
  %99 = addrspacecast float addrspace(3)* %98 to float*
  store float %region_0_14_constant_8, float* %initial_value_addr, align 4
  %100 = icmp ult i32 %thread_id.x, 1
  %101 = select i1 %100, float* %99, float* %initial_value_addr
  %partial_reduction_result33 = load float, float* %101, align 4
  %102 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 16, i32 31)
  store float %102, float* %result_from_other_lane32, align 4
  call void @region_1_9(float* %101, float* %result_from_other_lane32, float* %return_buffer34)
  %103 = load float, float* %return_buffer34, align 4
  store float %103, float* %101, align 4
  %partial_reduction_result36 = load float, float* %101, align 4
  %104 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 8, i32 31)
  store float %104, float* %result_from_other_lane35, align 4
  call void @region_1_9(float* %101, float* %result_from_other_lane35, float* %return_buffer37)
  %105 = load float, float* %return_buffer37, align 4
  store float %105, float* %101, align 4
  %partial_reduction_result39 = load float, float* %101, align 4
  %106 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 4, i32 31)
  store float %106, float* %result_from_other_lane38, align 4
  call void @region_1_9(float* %101, float* %result_from_other_lane38, float* %return_buffer40)
  %107 = load float, float* %return_buffer40, align 4
  store float %107, float* %101, align 4
  %partial_reduction_result42 = load float, float* %101, align 4
  %108 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result42, i32 2, i32 31)
  store float %108, float* %result_from_other_lane41, align 4
  call void @region_1_9(float* %101, float* %result_from_other_lane41, float* %return_buffer43)
  %109 = load float, float* %return_buffer43, align 4
  store float %109, float* %101, align 4
  %partial_reduction_result45 = load float, float* %101, align 4
  %110 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 1, i32 31)
  store float %110, float* %result_from_other_lane44, align 4
  call void @region_1_9(float* %101, float* %result_from_other_lane44, float* %return_buffer46)
  %111 = load float, float* %return_buffer46, align 4
  store float %111, float* %101, align 4
  %112 = icmp eq i32 %thread_id.x, 0
  br i1 %112, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %113 = mul i32 %thread_id.x, 1
  %114 = add i32 %tile_origin.1, %thread_id.y
  %115 = add i32 %tile_origin.2, %113
  %116 = add i32 %115, 0
  %output = load float, float* %101, align 4
  store float %output, float* %5, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_9(float* dereferenceable(4) %Arg_0.10.typed, float* dereferenceable(4) %Arg_1.11.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, float* %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, float* %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, float* %add.12.typed, align 4
  %load_ret_value = load float, float* %add.12.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_7(i8* noalias align 16 dereferenceable(4) %alloc6, i8* noalias align 16 dereferenceable(4) %alloc7, i8* noalias align 128 dereferenceable(4) %alloc10, i8* noalias align 128 dereferenceable(4) %alloc11, i8* noalias align 128 dereferenceable(17808) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %1 = bitcast i8* %0 to float*
  %2 = getelementptr inbounds i8, i8* %alloc10, i64 0
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc7, i64 0
  %5 = bitcast i8* %4 to float*
  %6 = getelementptr inbounds i8, i8* %alloc11, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc10, i64 0
  %9 = bitcast i8* %8 to [1 x float]*
  %10 = getelementptr inbounds i8, i8* %alloc11, i64 0
  %11 = bitcast i8* %10 to [1 x float]*
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %14 = mul nuw nsw i32 %12, 2
  %linear_index = add nuw nsw i32 %14, %13
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %15 = udiv i32 %linear_index, 1
  %16 = icmp ult i32 %linear_index, 2
  br i1 %16, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %slice1-after, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %17 = phi i32 [ 0, %concatenate.pivot.0. ]
  %18 = sub nsw i32 %15, %17
  %19 = load float, float* %1, align 4, !invariant.load !24
  %20 = load float, float* %3, align 4
  %add.5 = fadd float %19, %20
  br label %concatenate.9.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %21 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %22 = sub nsw i32 %15, %21
  %23 = load float, float* %5, align 4, !invariant.load !24
  %24 = load float, float* %7, align 4
  %add.7 = fadd float %23, %24
  br label %concatenate.9.merge

concatenate.pivot.1.:                             ; preds = %fusion_7.in_bounds-true
  %25 = icmp ult i32 %15, 1
  br i1 %25, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.9.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %26 = phi float [ %add.5, %concat_index_from_operand_id0 ], [ %add.7, %concat_index_from_operand_id1 ]
  %27 = icmp sge i32 %15, 0
  %28 = icmp slt i32 %15, 1
  %29 = and i1 %27, %28
  br i1 %29, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.9.merge
  %30 = icmp sge i32 %15, 1
  %31 = icmp slt i32 %15, 2
  %32 = and i1 %30, %31
  br i1 %32, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_7.in_bounds-after

slice0-true:                                      ; preds = %concatenate.9.merge
  %33 = sub i32 %15, 0
  %34 = getelementptr inbounds [1 x float], [1 x float]* %9, i32 0, i32 0
  store float %26, float* %34, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %35 = sub i32 %15, 1
  %36 = getelementptr inbounds [1 x float], [1 x float]* %11, i32 0, i32 0
  store float %26, float* %36, align 4
  br label %slice1-after
}

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent inaccessiblememonly nounwind }
attributes #4 = { convergent nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20}

!0 = !{void (i8*, i8*)* @broadcast_15, !"kernel", i32 1}
!1 = !{void (i8*, i8*)* @broadcast_15, !"reqntidx", i32 32}
!2 = !{void (i8*, i8*)* @broadcast_15, !"reqntidy", i32 4}
!3 = !{void (i8*)* @fusion_3, !"kernel", i32 1}
!4 = !{void (i8*)* @fusion_3, !"reqntidx", i32 256}
!5 = !{void (i8*, i8*)* @broadcast_22, !"kernel", i32 1}
!6 = !{void (i8*, i8*)* @broadcast_22, !"reqntidx", i32 80}
!7 = !{void (i8*)* @reduce_110, !"kernel", i32 1}
!8 = !{void (i8*)* @reduce_110, !"reqntidx", i32 8}
!9 = !{void (i8*)* @fusion_1, !"kernel", i32 1}
!10 = !{void (i8*)* @fusion_1, !"reqntidx", i32 8}
!11 = !{void (i8*, i8*, i8*)* @input_fusion_reduce, !"kernel", i32 1}
!12 = !{void (i8*, i8*, i8*)* @input_fusion_reduce, !"reqntidx", i32 32}
!13 = !{void (i8*)* @iota_34, !"kernel", i32 1}
!14 = !{void (i8*)* @iota_34, !"reqntidx", i32 80}
!15 = !{void (i8*)* @reduce_47, !"kernel", i32 1}
!16 = !{void (i8*)* @reduce_47, !"reqntidx", i32 32}
!17 = !{void (i8*, i8*, i8*)* @input_fusion_reduce_1, !"kernel", i32 1}
!18 = !{void (i8*, i8*, i8*)* @input_fusion_reduce_1, !"reqntidx", i32 160}
!19 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_7, !"kernel", i32 1}
!20 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_7, !"reqntidx", i32 2}
!21 = !{i32 0, i32 8}
!22 = !{i32 0, i32 32}
!23 = !{i32 0, i32 4}
!24 = !{}
!25 = !{i32 0, i32 256}
!26 = !{i32 0, i32 1}
!27 = !{i32 0, i32 80}
!28 = distinct !{!28, !29}
!29 = !{!"llvm.loop.vectorize.enable", i1 false}
!30 = distinct !{!30, !29, !31}
!31 = !{!"llvm.loop.unroll.full"}
!32 = distinct !{!32, !29, !31}
!33 = !{i64 4}
!34 = !{i64 1}
!35 = !{i32 0, i32 160}
!36 = distinct !{!36, !29}
!37 = distinct !{!37, !29, !31}
!38 = distinct !{!38, !29, !31}
!39 = !{i32 0, i32 2}
