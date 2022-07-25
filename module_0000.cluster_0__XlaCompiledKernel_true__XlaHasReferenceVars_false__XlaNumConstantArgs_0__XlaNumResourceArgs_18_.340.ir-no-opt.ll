target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_306 = constant [4 x i8] c"\00\00\00B", align 128
@buffer_for_constant_151 = constant [4 x i8] c"\00\00\00\80", align 128
@buffer_for_constant_61 = constant [4 x i8] zeroinitializer, align 128
@buffer_for_constant_60 = constant [4 x i8] c"\00\00\80\FF", align 128
@0 = private unnamed_addr constant [8 x i8] c"\01\00\00\00\00\00\00\00"
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@2 = private unnamed_addr constant [4 x i8] c"\CD\CCL>"
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@4 = private unnamed_addr constant [4 x i8] c"\00\00\A0?"
@5 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [5 x [1 x [1 x float]]] undef
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@8 = private unnamed_addr constant [4 x i8] c"\00\00\C0\7F"
@9 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@10 = private unnamed_addr constant [8 x i8] zeroinitializer
@11 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@12 = private unnamed_addr constant [4 x i8] c"\00\00\C0\7F"
@13 = private unnamed_addr constant [4 x i8] zeroinitializer
@14 = private unnamed_addr constant [8 x i8] c"\0A\00\00\00\00\00\00\00"
@15 = private unnamed_addr constant [8 x i8] zeroinitializer
@16 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@17 = private unnamed_addr constant [4 x i8] c"\00\00\00="
@18 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@19 = private unnamed_addr constant [4 x i8] c"\95\BF\D63"
@20 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@21 = private unnamed_addr constant [4 x i8] c"\95\BF\D63"
@22 = private unnamed_addr constant [4 x i8] zeroinitializer
@23 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache2 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@24 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@25 = private unnamed_addr constant [4 x i8] c"\95\BF\D63"
@26 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@27 = private unnamed_addr constant [4 x i8] c"\95\BF\D63"

define void @fusion_12(i8* noalias align 16 dereferenceable(8) %alloc3, i8* noalias align 16 dereferenceable(4) %alloc4, i8* noalias align 16 dereferenceable(4) %alloc5, i8* noalias align 16 dereferenceable(4) %alloc6, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc5, i64 0
  %1 = bitcast i8* %0 to float*
  %2 = getelementptr inbounds i8, i8* %alloc4, i64 0
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %5 = bitcast i8* %4 to float*
  %6 = getelementptr inbounds i8, i8* %alloc3, i64 0
  %7 = bitcast i8* %6 to i64*
  %8 = getelementptr inbounds i8, i8* %temp_buf, i64 4096
  %9 = bitcast i8* %8 to float*
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %12 = mul nuw nsw i32 %10, 1
  %linear_index = add nuw nsw i32 %12, %11
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %13 = icmp ult i32 %linear_index, 1
  br i1 %13, label %fusion_12.in_bounds-true, label %fusion_12.in_bounds-after

fusion_12.in_bounds-after:                        ; preds = %fusion_12.in_bounds-true, %entry
  ret void

fusion_12.in_bounds-true:                         ; preds = %entry
  %14 = load float, float* %3, align 4, !invariant.load !38
  %region_0_16_constant_5 = load float, float* bitcast ([4 x i8]* @1 to float*), align 4
  %15 = load float, float* %5, align 4, !invariant.load !38
  %16 = load i64, i64* %7, align 8, !invariant.load !38
  %region_0_16_constant_6 = load i64, i64* bitcast ([8 x i8]* @0 to i64*), align 8
  %17 = add i64 %16, %region_0_16_constant_6
  %18 = sitofp i64 %17 to float
  %19 = call float @__nv_powf(float %15, float %18)
  %subtract.10 = fsub float %region_0_16_constant_5, %19
  %20 = call float @__nv_sqrtf(float %subtract.10)
  %multiply.12 = fmul float %14, %20
  %region_0_16_constant_51 = load float, float* bitcast ([4 x i8]* @1 to float*), align 4
  %21 = load float, float* %1, align 4, !invariant.load !38
  %22 = call float @__nv_powf(float %21, float %18)
  %subtract.14 = fsub float %region_0_16_constant_51, %22
  %divide.15 = fdiv float %multiply.12, %subtract.14
  store float %divide.15, float* %9, align 4
  br label %fusion_12.in_bounds-after
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nounwind readnone
declare float @__nv_powf(float, float) #2

; Function Attrs: nounwind readnone
declare float @__nv_sqrtf(float) #2

define void @broadcast_57(i8* noalias align 16 dereferenceable(40) %alloc9, i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc9, i64 0
  %1 = bitcast i8* %0 to [10 x float]*
  %2 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %3 = bitcast i8* %2 to [32 x [10 x float]]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
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
  br i1 %19, label %broadcast_57.in_bounds-true, label %broadcast_57.in_bounds-after

broadcast_57.in_bounds-after:                     ; preds = %broadcast_57.in_bounds-true, %entry
  ret void

broadcast_57.in_bounds-true:                      ; preds = %entry
  %20 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %8
  %21 = load float, float* %20, align 4, !invariant.load !38
  %22 = bitcast [32 x [10 x float]]* %3 to float*
  %23 = getelementptr inbounds float, float* %22, i32 %linear_index_base
  store float %21, float* %23, align 4
  %24 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %11
  %25 = load float, float* %24, align 4, !invariant.load !38
  %26 = bitcast [32 x [10 x float]]* %3 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index1
  store float %25, float* %27, align 4
  %28 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %14
  %29 = load float, float* %28, align 4, !invariant.load !38
  %30 = bitcast [32 x [10 x float]]* %3 to float*
  %31 = getelementptr inbounds float, float* %30, i32 %linear_index2
  store float %29, float* %31, align 4
  %32 = getelementptr inbounds [10 x float], [10 x float]* %1, i32 0, i32 %17
  %33 = load float, float* %32, align 4, !invariant.load !38
  %34 = bitcast [32 x [10 x float]]* %3 to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index3
  store float %33, float* %35, align 4
  br label %broadcast_57.in_bounds-after
}

define void @iota_62(i8* noalias align 128 dereferenceable(5120) %alloc25, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc25, i64 0
  %1 = bitcast i8* %0 to [32 x [10 x i32]]*
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
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
  br i1 %17, label %iota_62.in_bounds-true, label %iota_62.in_bounds-after

iota_62.in_bounds-after:                          ; preds = %iota_62.in_bounds-true, %entry
  ret void

iota_62.in_bounds-true:                           ; preds = %entry
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
  br label %iota_62.in_bounds-after
}

define void @broadcast_40(i8* noalias align 16 dereferenceable(512) %alloc7, i8* noalias align 128 dereferenceable(401408) %alloc23, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc7, i64 0
  %1 = bitcast i8* %0 to [128 x float]*
  %2 = getelementptr inbounds i8, i8* %alloc23, i64 0
  %3 = bitcast i8* %2 to [32 x [128 x float]]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %6 = mul nuw nsw i32 %4, 128
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !42
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
  br i1 %22, label %broadcast_40.in_bounds-true, label %broadcast_40.in_bounds-after

broadcast_40.in_bounds-after:                     ; preds = %broadcast_40.in_bounds-true, %entry
  ret void

broadcast_40.in_bounds-true:                      ; preds = %entry
  %23 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index
  %24 = load float, float* %23, align 4, !invariant.load !38
  %25 = bitcast [32 x [128 x float]]* %3 to float*
  %26 = getelementptr inbounds float, float* %25, i32 %linear_index_base
  store float %24, float* %26, align 4
  %27 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index_plus1
  %28 = load float, float* %27, align 4, !invariant.load !38
  %29 = bitcast [32 x [128 x float]]* %3 to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index1
  store float %28, float* %30, align 4
  %31 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index_plus2
  %32 = load float, float* %31, align 4, !invariant.load !38
  %33 = bitcast [32 x [128 x float]]* %3 to float*
  %34 = getelementptr inbounds float, float* %33, i32 %linear_index2
  store float %32, float* %34, align 4
  %35 = getelementptr inbounds [128 x float], [128 x float]* %1, i32 0, i32 %row_index_plus3
  %36 = load float, float* %35, align 4, !invariant.load !38
  %37 = bitcast [32 x [128 x float]]* %3 to float*
  %38 = getelementptr inbounds float, float* %37, i32 %linear_index3
  store float %36, float* %38, align 4
  br label %broadcast_40.in_bounds-after
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

define void @fusion_18(i8* noalias align 16 dereferenceable(16384) %alloc0, i8* noalias align 128 dereferenceable(401408) %alloc22, i8* noalias align 128 dereferenceable(401408) %alloc23, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc23, i64 0
  %1 = bitcast i8* %0 to [32 x [128 x float]]*
  %2 = getelementptr inbounds i8, i8* %alloc0, i64 0
  %3 = bitcast i8* %2 to [32 x [128 x float]]*
  %4 = getelementptr inbounds i8, i8* %alloc22, i64 0
  %5 = bitcast i8* %4 to [32 x [128 x float]]*
  %6 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %7 = bitcast i8* %6 to [32 x [128 x i8]]*
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %10 = mul nuw nsw i32 %8, 256
  %linear_index = add nuw nsw i32 %10, %9
  %linear_index_in_range = icmp ult i32 %linear_index, 1024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %11 = udiv i32 %linear_index_base, 1
  %12 = urem i32 %11, 128
  %13 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %14 = udiv i32 %linear_index1, 1
  %15 = urem i32 %14, 128
  %16 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 128
  %19 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %20 = udiv i32 %linear_index3, 1
  %21 = urem i32 %20, 128
  %22 = udiv i32 %linear_index3, 128
  %23 = icmp ult i32 %linear_index_base, 4096
  br i1 %23, label %fusion_18.in_bounds-true, label %fusion_18.in_bounds-after

fusion_18.in_bounds-after:                        ; preds = %fusion_18.in_bounds-true, %entry
  ret void

fusion_18.in_bounds-true:                         ; preds = %entry
  %24 = bitcast [32 x [128 x float]]* %1 to float*
  %25 = getelementptr inbounds float, float* %24, i32 %linear_index_base
  %26 = load float, float* %25, align 4, !invariant.load !38
  %region_0_14_constant_3 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %27 = fcmp oge float %26, %region_0_14_constant_3
  %28 = fcmp une float %26, %26
  %29 = or i1 %27, %28
  %maximum.5 = select i1 %29, float %26, float %region_0_14_constant_3
  %30 = bitcast [32 x [128 x float]]* %3 to float*
  %31 = getelementptr inbounds float, float* %30, i32 %linear_index_base
  %32 = load float, float* %31, align 4, !invariant.load !38
  %region_0_14_constant_6 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %compare.8 = fcmp oge float %32, %region_0_14_constant_6
  %33 = zext i1 %compare.8 to i8
  %region_0_14_constant_9 = load float, float* bitcast ([4 x i8]* @4 to float*), align 4
  %34 = trunc i8 %33 to i1
  %35 = select i1 %34, float %region_0_14_constant_9, float %region_0_14_constant_3
  %multiply.12 = fmul float %maximum.5, %35
  %36 = insertvalue { float, i8 } undef, float %multiply.12, 0
  %37 = insertvalue { float, i8 } %36, i8 %33, 1
  %38 = extractvalue { float, i8 } %37, 0
  %39 = bitcast [32 x [128 x float]]* %5 to float*
  %40 = getelementptr inbounds float, float* %39, i32 %linear_index_base
  store float %38, float* %40, align 4
  %41 = extractvalue { float, i8 } %37, 1
  %42 = bitcast [32 x [128 x i8]]* %7 to i8*
  %43 = getelementptr inbounds i8, i8* %42, i32 %linear_index_base
  store i8 %41, i8* %43, align 1
  %44 = bitcast [32 x [128 x float]]* %1 to float*
  %45 = getelementptr inbounds float, float* %44, i32 %linear_index1
  %46 = load float, float* %45, align 4, !invariant.load !38
  %region_0_14_constant_31 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %47 = fcmp oge float %46, %region_0_14_constant_31
  %48 = fcmp une float %46, %46
  %49 = or i1 %47, %48
  %maximum.52 = select i1 %49, float %46, float %region_0_14_constant_31
  %50 = bitcast [32 x [128 x float]]* %3 to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index1
  %52 = load float, float* %51, align 4, !invariant.load !38
  %region_0_14_constant_63 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %compare.84 = fcmp oge float %52, %region_0_14_constant_63
  %53 = zext i1 %compare.84 to i8
  %region_0_14_constant_95 = load float, float* bitcast ([4 x i8]* @4 to float*), align 4
  %54 = trunc i8 %53 to i1
  %55 = select i1 %54, float %region_0_14_constant_95, float %region_0_14_constant_31
  %multiply.126 = fmul float %maximum.52, %55
  %56 = insertvalue { float, i8 } undef, float %multiply.126, 0
  %57 = insertvalue { float, i8 } %56, i8 %53, 1
  %58 = extractvalue { float, i8 } %57, 0
  %59 = bitcast [32 x [128 x float]]* %5 to float*
  %60 = getelementptr inbounds float, float* %59, i32 %linear_index1
  store float %58, float* %60, align 4
  %61 = extractvalue { float, i8 } %57, 1
  %62 = bitcast [32 x [128 x i8]]* %7 to i8*
  %63 = getelementptr inbounds i8, i8* %62, i32 %linear_index1
  store i8 %61, i8* %63, align 1
  %64 = bitcast [32 x [128 x float]]* %1 to float*
  %65 = getelementptr inbounds float, float* %64, i32 %linear_index2
  %66 = load float, float* %65, align 4, !invariant.load !38
  %region_0_14_constant_37 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %67 = fcmp oge float %66, %region_0_14_constant_37
  %68 = fcmp une float %66, %66
  %69 = or i1 %67, %68
  %maximum.58 = select i1 %69, float %66, float %region_0_14_constant_37
  %70 = bitcast [32 x [128 x float]]* %3 to float*
  %71 = getelementptr inbounds float, float* %70, i32 %linear_index2
  %72 = load float, float* %71, align 4, !invariant.load !38
  %region_0_14_constant_69 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %compare.810 = fcmp oge float %72, %region_0_14_constant_69
  %73 = zext i1 %compare.810 to i8
  %region_0_14_constant_911 = load float, float* bitcast ([4 x i8]* @4 to float*), align 4
  %74 = trunc i8 %73 to i1
  %75 = select i1 %74, float %region_0_14_constant_911, float %region_0_14_constant_37
  %multiply.1212 = fmul float %maximum.58, %75
  %76 = insertvalue { float, i8 } undef, float %multiply.1212, 0
  %77 = insertvalue { float, i8 } %76, i8 %73, 1
  %78 = extractvalue { float, i8 } %77, 0
  %79 = bitcast [32 x [128 x float]]* %5 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index2
  store float %78, float* %80, align 4
  %81 = extractvalue { float, i8 } %77, 1
  %82 = bitcast [32 x [128 x i8]]* %7 to i8*
  %83 = getelementptr inbounds i8, i8* %82, i32 %linear_index2
  store i8 %81, i8* %83, align 1
  %84 = bitcast [32 x [128 x float]]* %1 to float*
  %85 = getelementptr inbounds float, float* %84, i32 %linear_index3
  %86 = load float, float* %85, align 4, !invariant.load !38
  %region_0_14_constant_313 = load float, float* bitcast ([4 x i8]* @3 to float*), align 4
  %87 = fcmp oge float %86, %region_0_14_constant_313
  %88 = fcmp une float %86, %86
  %89 = or i1 %87, %88
  %maximum.514 = select i1 %89, float %86, float %region_0_14_constant_313
  %90 = bitcast [32 x [128 x float]]* %3 to float*
  %91 = getelementptr inbounds float, float* %90, i32 %linear_index3
  %92 = load float, float* %91, align 4, !invariant.load !38
  %region_0_14_constant_615 = load float, float* bitcast ([4 x i8]* @2 to float*), align 4
  %compare.816 = fcmp oge float %92, %region_0_14_constant_615
  %93 = zext i1 %compare.816 to i8
  %region_0_14_constant_917 = load float, float* bitcast ([4 x i8]* @4 to float*), align 4
  %94 = trunc i8 %93 to i1
  %95 = select i1 %94, float %region_0_14_constant_917, float %region_0_14_constant_313
  %multiply.1218 = fmul float %maximum.514, %95
  %96 = insertvalue { float, i8 } undef, float %multiply.1218, 0
  %97 = insertvalue { float, i8 } %96, i8 %93, 1
  %98 = extractvalue { float, i8 } %97, 0
  %99 = bitcast [32 x [128 x float]]* %5 to float*
  %100 = getelementptr inbounds float, float* %99, i32 %linear_index3
  store float %98, float* %100, align 4
  %101 = extractvalue { float, i8 } %97, 1
  %102 = bitcast [32 x [128 x i8]]* %7 to i8*
  %103 = getelementptr inbounds i8, i8* %102, i32 %linear_index3
  store i8 %101, i8* %103, align 1
  br label %fusion_18.in_bounds-after
}

define void @reduce_75(i8* noalias align 128 dereferenceable(5120) %alloc25, i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(512) %alloc28, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
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
  %0 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %alloc25, i64 0
  %3 = bitcast i8* %2 to [32 x [10 x i32]]*
  %4 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %5 = bitcast i8* %4 to [32 x float]*
  %6 = getelementptr inbounds i8, i8* %alloc28, i64 0
  %7 = bitcast i8* %6 to [32 x i32]*
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %10 = mul nuw nsw i32 %8, 32
  %linear_index = add nuw nsw i32 %10, %9
  %linear_index_in_range = icmp ult i32 %linear_index, 32
  call void @llvm.assume(i1 %linear_index_in_range)
  %11 = udiv i32 %linear_index, 1
  %12 = icmp ult i32 %linear_index, 32
  br i1 %12, label %reduce_75.in_bounds-true, label %reduce_75.in_bounds-after

reduce_75.in_bounds-after:                        ; preds = %reduce.26.inner.loop_exit.reduction_dim.1, %entry
  ret void

reduce_75.in_bounds-true:                         ; preds = %entry
  %13 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_60 to float*), align 4, !invariant.load !38
  store float %13, float* %accumulator_0, align 4
  %14 = load i32, i32* bitcast ([4 x i8]* @buffer_for_constant_61 to i32*), align 4, !invariant.load !38
  store i32 %14, i32* %accumulator_1, align 4
  store i32 0, i32* %reduce.26.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.26.inner.loop_header.reduction_dim.1

reduce.26.inner.loop_header.reduction_dim.1:      ; preds = %reduce.26.inner.loop_body.reduction_dim.1, %reduce_75.in_bounds-true
  %reduce.26.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.26.inner.invar_address.reduction_dim.1, align 4
  %15 = icmp uge i32 %reduce.26.inner.indvar.reduction_dim.1, 10
  br i1 %15, label %reduce.26.inner.loop_exit.reduction_dim.1, label %reduce.26.inner.loop_body.reduction_dim.1

reduce.26.inner.loop_body.reduction_dim.1:        ; preds = %reduce.26.inner.loop_header.reduction_dim.1
  %16 = load float, float* %accumulator_0, align 4
  %17 = load i32, i32* %accumulator_1, align 4
  %18 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %11, i32 %reduce.26.inner.indvar.reduction_dim.1
  %19 = load float, float* %18, align 4, !invariant.load !38
  %20 = getelementptr inbounds [32 x [10 x i32]], [32 x [10 x i32]]* %3, i32 0, i32 %11, i32 %reduce.26.inner.indvar.reduction_dim.1
  %21 = load i32, i32* %20, align 4, !invariant.load !38
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
  br label %reduce_75.in_bounds-after
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
  %19 = load i8*, i8** %18, align 8, !dereferenceable !44, !align !45
  %get-tuple-element.24.typed = bitcast i8* %19 to float*
  %20 = getelementptr inbounds [2 x i8*], [2 x i8*]* %fusion.22.typed, i64 0, i64 0
  %21 = load i8*, i8** %20, align 8, !dereferenceable !44, !align !45
  %get-tuple-element.23.typed = bitcast i8* %21 to i32*
  %22 = bitcast float* %get-tuple-element.24.typed to i8*
  %23 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 0
  store i8* %22, i8** %23, align 8
  %24 = bitcast i32* %get-tuple-element.23.typed to i8*
  %25 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 1
  store i8* %24, i8** %25, align 8
  %26 = getelementptr inbounds [2 x i8*], [2 x i8*]* %output_arg, i64 0, i64 0
  %27 = load i8*, i8** %26, align 8, !dereferenceable !44, !align !45
  %28 = bitcast i8* %27 to float*
  %29 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 0
  %30 = load i8*, i8** %29, align 8, !dereferenceable !44, !align !45
  %31 = bitcast i8* %30 to float*
  %32 = load float, float* %31, align 4
  store float %32, float* %28, align 4
  %33 = getelementptr inbounds [2 x i8*], [2 x i8*]* %output_arg, i64 0, i64 1
  %34 = load i8*, i8** %33, align 8, !dereferenceable !44, !align !45
  %35 = bitcast i8* %34 to i32*
  %36 = getelementptr inbounds [2 x i8*], [2 x i8*]* %tuple.25.typed, i64 0, i64 1
  %37 = load i8*, i8** %36, align 8, !dereferenceable !44, !align !45
  %38 = bitcast i8* %37 to i32*
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %35, align 4
  ret void
}

define void @input_fusion_reduce(i8* noalias align 16 dereferenceable(32) %alloc2, i8* noalias align 128 dereferenceable(512) %alloc28, i8* noalias align 128 dereferenceable(4) %alloc35, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
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
  %0 = getelementptr inbounds i8, i8* %alloc28, i64 0
  %1 = bitcast i8* %0 to [32 x i32]*
  %2 = getelementptr inbounds i8, i8* %alloc2, i64 0
  %3 = bitcast i8* %2 to [32 x i8]*
  %4 = getelementptr inbounds i8, i8* %alloc35, i64 0
  %5 = bitcast i8* %4 to float*
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !37
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_14_constant_8 = load float, float* bitcast ([4 x i8]* @5 to float*), align 4
  %8 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  store float %region_0_14_constant_8, float* %8, align 4
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
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
  br label %y_in_tile.loop_header, !llvm.loop !47

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
  %Arg_1.23 = load i8, i8* %Arg_1.2, align 1, !invariant.load !38
  %60 = uitofp i8 %Arg_1.23 to float
  %61 = bitcast [32 x i32]* %1 to i32*
  %Arg_0.1 = getelementptr inbounds i32, i32* %61, i32 %57
  %Arg_0.14 = load i32, i32* %Arg_0.1, align 4, !invariant.load !38
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
  br label %tile_loop.loop_header, !llvm.loop !49

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
  br label %tile_loop.loop_header6, !llvm.loop !51

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
  %Arg_1.213 = load i8, i8* %Arg_1.212, align 1, !invariant.load !38
  %87 = uitofp i8 %Arg_1.213 to float
  %88 = bitcast [32 x i32]* %1 to i32*
  %Arg_0.114 = getelementptr inbounds i32, i32* %88, i32 %84
  %Arg_0.115 = load i32, i32* %Arg_0.114, align 4, !invariant.load !38
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
  %95 = getelementptr inbounds [5 x [1 x [1 x float]]], [5 x [1 x [1 x float]]] addrspace(3)* @shared_cache, i32 0, i32 %12, i32 0, i32 %39
  %96 = addrspacecast float addrspace(3)* %95 to float*
  %97 = load float, float* %current_output, align 4
  store float %97, float* %96, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %98 = getelementptr inbounds [5 x [1 x [1 x float]]], [5 x [1 x [1 x float]]] addrspace(3)* @shared_cache, i32 0, i32 %12, i32 0, i32 %lane_id
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

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

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

; Function Attrs: convergent inaccessiblememonly nounwind
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #4

define void @reduce_114(i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
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
  %0 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %3 = bitcast i8* %2 to [32 x float]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
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
  br i1 %11, label %reduce_114.in_bounds-true, label %reduce_114.in_bounds-after

reduce_114.in_bounds-after:                       ; preds = %reduce.7.inner.loop_exit.reduction_dim.123, %entry
  ret void

reduce_114.in_bounds-true:                        ; preds = %entry
  %12 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_60 to float*), align 4, !invariant.load !38
  store float %12, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.1

reduce.7.inner.loop_header.reduction_dim.1:       ; preds = %reduce.7.inner.loop_body.reduction_dim.1, %reduce_114.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.1, align 4
  %13 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.1, 10
  br i1 %13, label %reduce.7.inner.loop_exit.reduction_dim.1, label %reduce.7.inner.loop_body.reduction_dim.1

reduce.7.inner.loop_body.reduction_dim.1:         ; preds = %reduce.7.inner.loop_header.reduction_dim.1
  %14 = load float, float* %accumulator_0, align 4
  %15 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %7, i32 %reduce.7.inner.indvar.reduction_dim.1
  %16 = load float, float* %15, align 4, !invariant.load !38
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
  %21 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_60 to float*), align 4, !invariant.load !38
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
  %25 = load float, float* %24, align 4, !invariant.load !38
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
  %30 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_60 to float*), align 4, !invariant.load !38
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
  %34 = load float, float* %33, align 4, !invariant.load !38
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
  %39 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_60 to float*), align 4, !invariant.load !38
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
  %43 = load float, float* %42, align 4, !invariant.load !38
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
  br label %reduce_114.in_bounds-after
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

define void @fusion_22(i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(512) %alloc27, i8* noalias align 128 dereferenceable(512) %alloc28, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
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
  %0 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %3 = bitcast i8* %2 to [32 x float]*
  %4 = getelementptr inbounds i8, i8* %alloc28, i64 0
  %5 = bitcast i8* %4 to [32 x float]*
  %6 = getelementptr inbounds i8, i8* %alloc27, i64 0
  %7 = bitcast i8* %6 to [32 x float]*
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %10 = mul nuw nsw i32 %8, 8
  %linear_index = add nuw nsw i32 %10, %9
  %linear_index_in_range = icmp ult i32 %linear_index, 8
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %11 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %12 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = icmp ult i32 %linear_index_base, 32
  br i1 %15, label %fusion_22.in_bounds-true, label %fusion_22.in_bounds-after

fusion_22.in_bounds-after:                        ; preds = %reduce.11.inner.loop_exit.reduction_dim.128, %entry
  ret void

fusion_22.in_bounds-true:                         ; preds = %entry
  %region_0_14_constant_6 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  store float %region_0_14_constant_6, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_header.reduction_dim.1:      ; preds = %reduce.11.inner.loop_body.reduction_dim.1, %fusion_22.in_bounds-true
  %reduce.11.inner.indvar.reduction_dim.1 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.1, align 4
  %16 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.1, 10
  br i1 %16, label %reduce.11.inner.loop_exit.reduction_dim.1, label %reduce.11.inner.loop_body.reduction_dim.1

reduce.11.inner.loop_body.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %17 = load float, float* %accumulator_0, align 4
  %18 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %11, i32 %reduce.11.inner.indvar.reduction_dim.1
  %19 = load float, float* %18, align 4, !invariant.load !38
  %20 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %11
  %21 = load float, float* %20, align 4, !invariant.load !38
  %subtract.4 = fsub float %19, %21
  %22 = call float @__nv_expf(float %subtract.4)
  store float %17, float* %parameter_buffer, align 4
  store float %22, float* %parameter_buffer1, align 4
  call void @region_1_7(float* %parameter_buffer, float* %parameter_buffer1, float* %return_buffer)
  %23 = load float, float* %return_buffer, align 4
  store float %23, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.1, 1
  store i32 %invar.inc, i32* %reduce.11.inner.invar_address.reduction_dim.1, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.1

reduce.11.inner.loop_exit.reduction_dim.1:        ; preds = %reduce.11.inner.loop_header.reduction_dim.1
  %24 = load float, float* %accumulator_0, align 4
  %25 = call float @__nv_logf(float %24)
  %26 = insertvalue { float, float } undef, float %25, 0
  %27 = insertvalue { float, float } %26, float %24, 1
  %28 = extractvalue { float, float } %27, 0
  %29 = bitcast [32 x float]* %5 to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index_base
  store float %28, float* %30, align 4
  %31 = extractvalue { float, float } %27, 1
  %32 = bitcast [32 x float]* %7 to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index_base
  store float %31, float* %33, align 4
  %region_0_14_constant_63 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  store float %region_0_14_constant_63, float* %accumulator_02, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_header.reduction_dim.15:     ; preds = %reduce.11.inner.loop_body.reduction_dim.16, %reduce.11.inner.loop_exit.reduction_dim.1
  %reduce.11.inner.indvar.reduction_dim.18 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.17, align 4
  %34 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.18, 10
  br i1 %34, label %reduce.11.inner.loop_exit.reduction_dim.14, label %reduce.11.inner.loop_body.reduction_dim.16

reduce.11.inner.loop_body.reduction_dim.16:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %35 = load float, float* %accumulator_02, align 4
  %36 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %12, i32 %reduce.11.inner.indvar.reduction_dim.18
  %37 = load float, float* %36, align 4, !invariant.load !38
  %38 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %12
  %39 = load float, float* %38, align 4, !invariant.load !38
  %subtract.410 = fsub float %37, %39
  %40 = call float @__nv_expf(float %subtract.410)
  store float %35, float* %parameter_buffer11, align 4
  store float %40, float* %parameter_buffer12, align 4
  call void @region_1_7(float* %parameter_buffer11, float* %parameter_buffer12, float* %return_buffer13)
  %41 = load float, float* %return_buffer13, align 4
  store float %41, float* %accumulator_02, align 4
  %invar.inc9 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.18, 1
  store i32 %invar.inc9, i32* %reduce.11.inner.invar_address.reduction_dim.17, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.15

reduce.11.inner.loop_exit.reduction_dim.14:       ; preds = %reduce.11.inner.loop_header.reduction_dim.15
  %42 = load float, float* %accumulator_02, align 4
  %43 = call float @__nv_logf(float %42)
  %44 = insertvalue { float, float } undef, float %43, 0
  %45 = insertvalue { float, float } %44, float %42, 1
  %46 = extractvalue { float, float } %45, 0
  %47 = bitcast [32 x float]* %5 to float*
  %48 = getelementptr inbounds float, float* %47, i32 %linear_index1
  store float %46, float* %48, align 4
  %49 = extractvalue { float, float } %45, 1
  %50 = bitcast [32 x float]* %7 to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index1
  store float %49, float* %51, align 4
  %region_0_14_constant_615 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  store float %region_0_14_constant_615, float* %accumulator_014, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.117

reduce.11.inner.loop_header.reduction_dim.117:    ; preds = %reduce.11.inner.loop_body.reduction_dim.118, %reduce.11.inner.loop_exit.reduction_dim.14
  %reduce.11.inner.indvar.reduction_dim.120 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.119, align 4
  %52 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.120, 10
  br i1 %52, label %reduce.11.inner.loop_exit.reduction_dim.116, label %reduce.11.inner.loop_body.reduction_dim.118

reduce.11.inner.loop_body.reduction_dim.118:      ; preds = %reduce.11.inner.loop_header.reduction_dim.117
  %53 = load float, float* %accumulator_014, align 4
  %54 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %13, i32 %reduce.11.inner.indvar.reduction_dim.120
  %55 = load float, float* %54, align 4, !invariant.load !38
  %56 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %13
  %57 = load float, float* %56, align 4, !invariant.load !38
  %subtract.422 = fsub float %55, %57
  %58 = call float @__nv_expf(float %subtract.422)
  store float %53, float* %parameter_buffer23, align 4
  store float %58, float* %parameter_buffer24, align 4
  call void @region_1_7(float* %parameter_buffer23, float* %parameter_buffer24, float* %return_buffer25)
  %59 = load float, float* %return_buffer25, align 4
  store float %59, float* %accumulator_014, align 4
  %invar.inc21 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.120, 1
  store i32 %invar.inc21, i32* %reduce.11.inner.invar_address.reduction_dim.119, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.117

reduce.11.inner.loop_exit.reduction_dim.116:      ; preds = %reduce.11.inner.loop_header.reduction_dim.117
  %60 = load float, float* %accumulator_014, align 4
  %61 = call float @__nv_logf(float %60)
  %62 = insertvalue { float, float } undef, float %61, 0
  %63 = insertvalue { float, float } %62, float %60, 1
  %64 = extractvalue { float, float } %63, 0
  %65 = bitcast [32 x float]* %5 to float*
  %66 = getelementptr inbounds float, float* %65, i32 %linear_index2
  store float %64, float* %66, align 4
  %67 = extractvalue { float, float } %63, 1
  %68 = bitcast [32 x float]* %7 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index2
  store float %67, float* %69, align 4
  %region_0_14_constant_627 = load float, float* bitcast ([4 x i8]* @6 to float*), align 4
  store float %region_0_14_constant_627, float* %accumulator_026, align 4
  store i32 0, i32* %reduce.11.inner.invar_address.reduction_dim.131, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.129

reduce.11.inner.loop_header.reduction_dim.129:    ; preds = %reduce.11.inner.loop_body.reduction_dim.130, %reduce.11.inner.loop_exit.reduction_dim.116
  %reduce.11.inner.indvar.reduction_dim.132 = load i32, i32* %reduce.11.inner.invar_address.reduction_dim.131, align 4
  %70 = icmp uge i32 %reduce.11.inner.indvar.reduction_dim.132, 10
  br i1 %70, label %reduce.11.inner.loop_exit.reduction_dim.128, label %reduce.11.inner.loop_body.reduction_dim.130

reduce.11.inner.loop_body.reduction_dim.130:      ; preds = %reduce.11.inner.loop_header.reduction_dim.129
  %71 = load float, float* %accumulator_026, align 4
  %72 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %14, i32 %reduce.11.inner.indvar.reduction_dim.132
  %73 = load float, float* %72, align 4, !invariant.load !38
  %74 = getelementptr inbounds [32 x float], [32 x float]* %3, i32 0, i32 %14
  %75 = load float, float* %74, align 4, !invariant.load !38
  %subtract.434 = fsub float %73, %75
  %76 = call float @__nv_expf(float %subtract.434)
  store float %71, float* %parameter_buffer35, align 4
  store float %76, float* %parameter_buffer36, align 4
  call void @region_1_7(float* %parameter_buffer35, float* %parameter_buffer36, float* %return_buffer37)
  %77 = load float, float* %return_buffer37, align 4
  store float %77, float* %accumulator_026, align 4
  %invar.inc33 = add nuw nsw i32 %reduce.11.inner.indvar.reduction_dim.132, 1
  store i32 %invar.inc33, i32* %reduce.11.inner.invar_address.reduction_dim.131, align 4
  br label %reduce.11.inner.loop_header.reduction_dim.129

reduce.11.inner.loop_exit.reduction_dim.128:      ; preds = %reduce.11.inner.loop_header.reduction_dim.129
  %78 = load float, float* %accumulator_026, align 4
  %79 = call float @__nv_logf(float %78)
  %80 = insertvalue { float, float } undef, float %79, 0
  %81 = insertvalue { float, float } %80, float %78, 1
  %82 = extractvalue { float, float } %81, 0
  %83 = bitcast [32 x float]* %5 to float*
  %84 = getelementptr inbounds float, float* %83, i32 %linear_index3
  store float %82, float* %84, align 4
  %85 = extractvalue { float, float } %81, 1
  %86 = bitcast [32 x float]* %7 to float*
  %87 = getelementptr inbounds float, float* %86, i32 %linear_index3
  store float %85, float* %87, align 4
  br label %fusion_22.in_bounds-after
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

define void @input_fusion_reduce_1(i8* noalias align 16 dereferenceable(32) %alloc2, i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(512) %alloc28, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(4) %alloc34, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
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
  %0 = getelementptr inbounds i8, i8* %alloc28, i64 0
  %1 = bitcast i8* %0 to [32 x float]*
  %2 = getelementptr inbounds i8, i8* %alloc2, i64 0
  %3 = bitcast i8* %2 to [32 x i8]*
  %4 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %5 = bitcast i8* %4 to [32 x [10 x float]]*
  %6 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %7 = bitcast i8* %6 to [32 x float]*
  %8 = getelementptr inbounds i8, i8* %alloc34, i64 0
  %9 = bitcast i8* %8 to float*
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !37
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_41_constant_11 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %12 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  store float %region_0_41_constant_11, float* %12, align 4
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
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
  br label %y_in_tile.loop_header, !llvm.loop !52

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
  %Arg_1.23 = load i8, i8* %Arg_1.2, align 1, !invariant.load !38
  %68 = zext i8 %Arg_1.23 to i64
  %69 = mul nuw nsw i32 %65, 1
  %70 = add nuw nsw i32 0, %69
  %71 = zext i32 %70 to i64
  %72 = icmp eq i64 %68, %71
  %73 = zext i1 %72 to i8
  %region_0_41_constant_9 = load float, float* bitcast ([4 x i8]* @11 to float*), align 4
  %region_0_41_constant_114 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %74 = trunc i8 %73 to i1
  %75 = select i1 %74, float %region_0_41_constant_9, float %region_0_41_constant_114
  %region_0_41_constant_14 = load i64, i64* bitcast ([8 x i8]* @10 to i64*), align 8
  %76 = icmp sle i64 %region_0_41_constant_14, %68
  %77 = zext i1 %76 to i8
  %region_0_41_constant_17 = load i64, i64* bitcast ([8 x i8]* @9 to i64*), align 8
  %78 = icmp slt i64 %68, %region_0_41_constant_17
  %79 = zext i1 %78 to i8
  %80 = and i8 %77, %79
  %region_0_41_constant_115 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %region_0_41_constant_22 = load float, float* bitcast ([4 x i8]* @8 to float*), align 4
  %81 = trunc i8 %80 to i1
  %82 = select i1 %81, float %region_0_41_constant_115, float %region_0_41_constant_22
  %add.26 = fadd float %75, %82
  %83 = fneg float %add.26
  %compare.28 = fcmp oeq float %add.26, %region_0_41_constant_114
  %84 = zext i1 %compare.28 to i8
  %85 = bitcast [32 x [10 x float]]* %5 to float*
  %Arg_2.3 = getelementptr inbounds float, float* %85, i32 %61
  %Arg_2.36 = load float, float* %Arg_2.3, align 4, !invariant.load !38
  %Arg_3.4 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %66
  %Arg_3.47 = load float, float* %Arg_3.4, align 4, !invariant.load !38
  %subtract.30 = fsub float %Arg_2.36, %Arg_3.47
  %Arg_0.1 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %66
  %Arg_0.18 = load float, float* %Arg_0.1, align 4, !invariant.load !38
  %subtract.32 = fsub float %subtract.30, %Arg_0.18
  %86 = trunc i8 %84 to i1
  %87 = select i1 %86, float %region_0_41_constant_114, float %subtract.32
  %multiply.34 = fmul float %83, %87
  store float %multiply.34, float* %reduction_input_address, align 4
  %88 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  call void @region_1_36(float* %88, float* %reduction_input_address, float* %return_buffer)
  %89 = load float, float* %return_buffer, align 4
  store float %89, float* %88, align 4
  br label %tile_loop.loop_header, !llvm.loop !53

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
  br label %tile_loop.loop_header10, !llvm.loop !54

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
  %Arg_1.217 = load i8, i8* %Arg_1.216, align 1, !invariant.load !38
  %113 = zext i8 %Arg_1.217 to i64
  %114 = mul nuw nsw i32 %110, 1
  %115 = add nuw nsw i32 0, %114
  %116 = zext i32 %115 to i64
  %117 = icmp eq i64 %113, %116
  %118 = zext i1 %117 to i8
  %region_0_41_constant_918 = load float, float* bitcast ([4 x i8]* @11 to float*), align 4
  %region_0_41_constant_1119 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %119 = trunc i8 %118 to i1
  %120 = select i1 %119, float %region_0_41_constant_918, float %region_0_41_constant_1119
  %region_0_41_constant_1420 = load i64, i64* bitcast ([8 x i8]* @10 to i64*), align 8
  %121 = icmp sle i64 %region_0_41_constant_1420, %113
  %122 = zext i1 %121 to i8
  %region_0_41_constant_1721 = load i64, i64* bitcast ([8 x i8]* @9 to i64*), align 8
  %123 = icmp slt i64 %113, %region_0_41_constant_1721
  %124 = zext i1 %123 to i8
  %125 = and i8 %122, %124
  %region_0_41_constant_1122 = load float, float* bitcast ([4 x i8]* @7 to float*), align 4
  %region_0_41_constant_2223 = load float, float* bitcast ([4 x i8]* @8 to float*), align 4
  %126 = trunc i8 %125 to i1
  %127 = select i1 %126, float %region_0_41_constant_1122, float %region_0_41_constant_2223
  %add.2624 = fadd float %120, %127
  %128 = fneg float %add.2624
  %compare.2825 = fcmp oeq float %add.2624, %region_0_41_constant_1119
  %129 = zext i1 %compare.2825 to i8
  %130 = bitcast [32 x [10 x float]]* %5 to float*
  %Arg_2.326 = getelementptr inbounds float, float* %130, i32 %106
  %Arg_2.327 = load float, float* %Arg_2.326, align 4, !invariant.load !38
  %Arg_3.428 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %111
  %Arg_3.429 = load float, float* %Arg_3.428, align 4, !invariant.load !38
  %subtract.3030 = fsub float %Arg_2.327, %Arg_3.429
  %Arg_0.131 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %111
  %Arg_0.132 = load float, float* %Arg_0.131, align 4, !invariant.load !38
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
  %135 = getelementptr inbounds [1 x [1 x [1 x float]]], [1 x [1 x [1 x float]]] addrspace(3)* @shared_cache1, i32 0, i32 %16, i32 0, i32 %43
  %136 = addrspacecast float addrspace(3)* %135 to float*
  %137 = load float, float* %current_output, align 4
  store float %137, float* %136, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %138 = getelementptr inbounds [1 x [1 x [1 x float]]], [1 x [1 x [1 x float]]] addrspace(3)* @shared_cache1, i32 0, i32 %16, i32 0, i32 %lane_id
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

define void @fusion_15(i8* noalias align 16 dereferenceable(32) %alloc2, i8* noalias align 128 dereferenceable(401408) %alloc21, i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(512) %alloc27, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc27, i64 0
  %1 = bitcast i8* %0 to [32 x float]*
  %2 = getelementptr inbounds i8, i8* %alloc2, i64 0
  %3 = bitcast i8* %2 to [32 x i8]*
  %4 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %5 = bitcast i8* %4 to [32 x [10 x float]]*
  %6 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %7 = bitcast i8* %6 to [32 x float]*
  %8 = getelementptr inbounds i8, i8* %alloc21, i64 0
  %9 = bitcast i8* %8 to [32 x [10 x float]]*
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %12 = mul nuw nsw i32 %10, 80
  %linear_index = add nuw nsw i32 %12, %11
  %linear_index_in_range = icmp ult i32 %linear_index, 80
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %13 = udiv i32 %linear_index_base, 1
  %14 = urem i32 %13, 10
  %15 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %16 = udiv i32 %linear_index1, 1
  %17 = urem i32 %16, 10
  %18 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 10
  %21 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %22 = udiv i32 %linear_index3, 1
  %23 = urem i32 %22, 10
  %24 = udiv i32 %linear_index3, 10
  %25 = icmp ult i32 %linear_index_base, 320
  br i1 %25, label %fusion_15.in_bounds-true, label %fusion_15.in_bounds-after

fusion_15.in_bounds-after:                        ; preds = %fusion_15.in_bounds-true, %entry
  ret void

fusion_15.in_bounds-true:                         ; preds = %entry
  %region_0_36_constant_5 = load float, float* bitcast ([4 x i8]* @17 to float*), align 4
  %26 = bitcast [32 x [10 x float]]* %5 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  %28 = load float, float* %27, align 4, !invariant.load !38
  %29 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %15
  %30 = load float, float* %29, align 4, !invariant.load !38
  %subtract.8 = fsub float %28, %30
  %31 = call float @__nv_expf(float %subtract.8)
  %32 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %15
  %33 = load float, float* %32, align 4, !invariant.load !38
  %divide.11 = fdiv float %31, %33
  %34 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i32 %15
  %35 = load i8, i8* %34, align 1, !invariant.load !38
  %36 = zext i8 %35 to i64
  %37 = mul nuw nsw i32 %14, 1
  %38 = add nuw nsw i32 0, %37
  %39 = zext i32 %38 to i64
  %40 = icmp eq i64 %36, %39
  %41 = zext i1 %40 to i8
  %region_0_36_constant_16 = load float, float* bitcast ([4 x i8]* @16 to float*), align 4
  %region_0_36_constant_18 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %42 = trunc i8 %41 to i1
  %43 = select i1 %42, float %region_0_36_constant_16, float %region_0_36_constant_18
  %region_0_36_constant_21 = load i64, i64* bitcast ([8 x i8]* @15 to i64*), align 8
  %44 = icmp sle i64 %region_0_36_constant_21, %36
  %45 = zext i1 %44 to i8
  %region_0_36_constant_24 = load i64, i64* bitcast ([8 x i8]* @14 to i64*), align 8
  %46 = icmp slt i64 %36, %region_0_36_constant_24
  %47 = zext i1 %46 to i8
  %48 = and i8 %45, %47
  %region_0_36_constant_181 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %region_0_36_constant_29 = load float, float* bitcast ([4 x i8]* @12 to float*), align 4
  %49 = trunc i8 %48 to i1
  %50 = select i1 %49, float %region_0_36_constant_181, float %region_0_36_constant_29
  %add.33 = fadd float %43, %50
  %subtract.34 = fsub float %divide.11, %add.33
  %multiply.35 = fmul float %region_0_36_constant_5, %subtract.34
  %51 = bitcast [32 x [10 x float]]* %9 to float*
  %52 = getelementptr inbounds float, float* %51, i32 %linear_index_base
  store float %multiply.35, float* %52, align 4
  %region_0_36_constant_52 = load float, float* bitcast ([4 x i8]* @17 to float*), align 4
  %53 = bitcast [32 x [10 x float]]* %5 to float*
  %54 = getelementptr inbounds float, float* %53, i32 %linear_index1
  %55 = load float, float* %54, align 4, !invariant.load !38
  %56 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %18
  %57 = load float, float* %56, align 4, !invariant.load !38
  %subtract.83 = fsub float %55, %57
  %58 = call float @__nv_expf(float %subtract.83)
  %59 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %18
  %60 = load float, float* %59, align 4, !invariant.load !38
  %divide.114 = fdiv float %58, %60
  %61 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i32 %18
  %62 = load i8, i8* %61, align 1, !invariant.load !38
  %63 = zext i8 %62 to i64
  %64 = mul nuw nsw i32 %17, 1
  %65 = add nuw nsw i32 0, %64
  %66 = zext i32 %65 to i64
  %67 = icmp eq i64 %63, %66
  %68 = zext i1 %67 to i8
  %region_0_36_constant_165 = load float, float* bitcast ([4 x i8]* @16 to float*), align 4
  %region_0_36_constant_186 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %69 = trunc i8 %68 to i1
  %70 = select i1 %69, float %region_0_36_constant_165, float %region_0_36_constant_186
  %region_0_36_constant_217 = load i64, i64* bitcast ([8 x i8]* @15 to i64*), align 8
  %71 = icmp sle i64 %region_0_36_constant_217, %63
  %72 = zext i1 %71 to i8
  %region_0_36_constant_248 = load i64, i64* bitcast ([8 x i8]* @14 to i64*), align 8
  %73 = icmp slt i64 %63, %region_0_36_constant_248
  %74 = zext i1 %73 to i8
  %75 = and i8 %72, %74
  %region_0_36_constant_189 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %region_0_36_constant_2910 = load float, float* bitcast ([4 x i8]* @12 to float*), align 4
  %76 = trunc i8 %75 to i1
  %77 = select i1 %76, float %region_0_36_constant_189, float %region_0_36_constant_2910
  %add.3311 = fadd float %70, %77
  %subtract.3412 = fsub float %divide.114, %add.3311
  %multiply.3513 = fmul float %region_0_36_constant_52, %subtract.3412
  %78 = bitcast [32 x [10 x float]]* %9 to float*
  %79 = getelementptr inbounds float, float* %78, i32 %linear_index1
  store float %multiply.3513, float* %79, align 4
  %region_0_36_constant_514 = load float, float* bitcast ([4 x i8]* @17 to float*), align 4
  %80 = bitcast [32 x [10 x float]]* %5 to float*
  %81 = getelementptr inbounds float, float* %80, i32 %linear_index2
  %82 = load float, float* %81, align 4, !invariant.load !38
  %83 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %21
  %84 = load float, float* %83, align 4, !invariant.load !38
  %subtract.815 = fsub float %82, %84
  %85 = call float @__nv_expf(float %subtract.815)
  %86 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %21
  %87 = load float, float* %86, align 4, !invariant.load !38
  %divide.1116 = fdiv float %85, %87
  %88 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i32 %21
  %89 = load i8, i8* %88, align 1, !invariant.load !38
  %90 = zext i8 %89 to i64
  %91 = mul nuw nsw i32 %20, 1
  %92 = add nuw nsw i32 0, %91
  %93 = zext i32 %92 to i64
  %94 = icmp eq i64 %90, %93
  %95 = zext i1 %94 to i8
  %region_0_36_constant_1617 = load float, float* bitcast ([4 x i8]* @16 to float*), align 4
  %region_0_36_constant_1818 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %96 = trunc i8 %95 to i1
  %97 = select i1 %96, float %region_0_36_constant_1617, float %region_0_36_constant_1818
  %region_0_36_constant_2119 = load i64, i64* bitcast ([8 x i8]* @15 to i64*), align 8
  %98 = icmp sle i64 %region_0_36_constant_2119, %90
  %99 = zext i1 %98 to i8
  %region_0_36_constant_2420 = load i64, i64* bitcast ([8 x i8]* @14 to i64*), align 8
  %100 = icmp slt i64 %90, %region_0_36_constant_2420
  %101 = zext i1 %100 to i8
  %102 = and i8 %99, %101
  %region_0_36_constant_1821 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %region_0_36_constant_2922 = load float, float* bitcast ([4 x i8]* @12 to float*), align 4
  %103 = trunc i8 %102 to i1
  %104 = select i1 %103, float %region_0_36_constant_1821, float %region_0_36_constant_2922
  %add.3323 = fadd float %97, %104
  %subtract.3424 = fsub float %divide.1116, %add.3323
  %multiply.3525 = fmul float %region_0_36_constant_514, %subtract.3424
  %105 = bitcast [32 x [10 x float]]* %9 to float*
  %106 = getelementptr inbounds float, float* %105, i32 %linear_index2
  store float %multiply.3525, float* %106, align 4
  %region_0_36_constant_526 = load float, float* bitcast ([4 x i8]* @17 to float*), align 4
  %107 = bitcast [32 x [10 x float]]* %5 to float*
  %108 = getelementptr inbounds float, float* %107, i32 %linear_index3
  %109 = load float, float* %108, align 4, !invariant.load !38
  %110 = getelementptr inbounds [32 x float], [32 x float]* %7, i32 0, i32 %24
  %111 = load float, float* %110, align 4, !invariant.load !38
  %subtract.827 = fsub float %109, %111
  %112 = call float @__nv_expf(float %subtract.827)
  %113 = getelementptr inbounds [32 x float], [32 x float]* %1, i32 0, i32 %24
  %114 = load float, float* %113, align 4, !invariant.load !38
  %divide.1128 = fdiv float %112, %114
  %115 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i32 %24
  %116 = load i8, i8* %115, align 1, !invariant.load !38
  %117 = zext i8 %116 to i64
  %118 = mul nuw nsw i32 %23, 1
  %119 = add nuw nsw i32 0, %118
  %120 = zext i32 %119 to i64
  %121 = icmp eq i64 %117, %120
  %122 = zext i1 %121 to i8
  %region_0_36_constant_1629 = load float, float* bitcast ([4 x i8]* @16 to float*), align 4
  %region_0_36_constant_1830 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %123 = trunc i8 %122 to i1
  %124 = select i1 %123, float %region_0_36_constant_1629, float %region_0_36_constant_1830
  %region_0_36_constant_2131 = load i64, i64* bitcast ([8 x i8]* @15 to i64*), align 8
  %125 = icmp sle i64 %region_0_36_constant_2131, %117
  %126 = zext i1 %125 to i8
  %region_0_36_constant_2432 = load i64, i64* bitcast ([8 x i8]* @14 to i64*), align 8
  %127 = icmp slt i64 %117, %region_0_36_constant_2432
  %128 = zext i1 %127 to i8
  %129 = and i8 %126, %128
  %region_0_36_constant_1833 = load float, float* bitcast ([4 x i8]* @13 to float*), align 4
  %region_0_36_constant_2934 = load float, float* bitcast ([4 x i8]* @12 to float*), align 4
  %130 = trunc i8 %129 to i1
  %131 = select i1 %130, float %region_0_36_constant_1833, float %region_0_36_constant_2934
  %add.3335 = fadd float %124, %131
  %subtract.3436 = fsub float %divide.1128, %add.3335
  %multiply.3537 = fmul float %region_0_36_constant_526, %subtract.3436
  %132 = bitcast [32 x [10 x float]]* %9 to float*
  %133 = getelementptr inbounds float, float* %132, i32 %linear_index3
  store float %multiply.3537, float* %133, align 4
  br label %fusion_15.in_bounds-after
}

define void @fusion_25(i8* noalias align 16 dereferenceable(4) %alloc15, i8* noalias align 16 dereferenceable(4) %alloc16, i8* noalias align 128 dereferenceable(4) %alloc34, i8* noalias align 128 dereferenceable(4) %alloc35, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc15, i64 0
  %1 = bitcast i8* %0 to float*
  %2 = getelementptr inbounds i8, i8* %alloc34, i64 0
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc16, i64 0
  %5 = bitcast i8* %4 to float*
  %6 = getelementptr inbounds i8, i8* %alloc35, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc34, i64 0
  %9 = bitcast i8* %8 to [1 x float]*
  %10 = getelementptr inbounds i8, i8* %alloc35, i64 0
  %11 = bitcast i8* %10 to [1 x float]*
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !55
  %14 = mul nuw nsw i32 %12, 2
  %linear_index = add nuw nsw i32 %14, %13
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %15 = udiv i32 %linear_index, 1
  %16 = icmp ult i32 %linear_index, 2
  br i1 %16, label %fusion_25.in_bounds-true, label %fusion_25.in_bounds-after

fusion_25.in_bounds-after:                        ; preds = %slice1-after, %entry
  ret void

fusion_25.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %17 = phi i32 [ 0, %concatenate.pivot.0. ]
  %18 = sub nsw i32 %15, %17
  %19 = load float, float* %1, align 4, !invariant.load !38
  %20 = load float, float* %3, align 4
  %add.5 = fadd float %19, %20
  br label %concatenate.9.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %21 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %22 = sub nsw i32 %15, %21
  %23 = load float, float* %5, align 4, !invariant.load !38
  %24 = load float, float* %7, align 4
  %add.7 = fadd float %23, %24
  br label %concatenate.9.merge

concatenate.pivot.1.:                             ; preds = %fusion_25.in_bounds-true
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
  br label %fusion_25.in_bounds-after

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

define void @reduce_156(i8* noalias align 128 dereferenceable(401408) %alloc21, i8* noalias align 128 dereferenceable(40) %alloc32, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %return_buffer11 = alloca float, align 4
  %parameter_buffer10 = alloca float, align 4
  %parameter_buffer9 = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.06 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.7.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %alloc21, i64 0
  %1 = bitcast i8* %0 to [32 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %alloc32, i64 0
  %3 = bitcast i8* %2 to [10 x float]*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %6 = mul nuw nsw i32 %4, 5
  %linear_index = add nuw nsw i32 %6, %5
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %7 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = icmp ult i32 %linear_index_base, 10
  br i1 %9, label %reduce_156.in_bounds-true, label %reduce_156.in_bounds-after

reduce_156.in_bounds-after:                       ; preds = %reduce.7.inner.loop_exit.reduction_dim.03, %entry
  ret void

reduce_156.in_bounds-true:                        ; preds = %entry
  %10 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_151 to float*), align 4, !invariant.load !38
  store float %10, float* %accumulator_0, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.0

reduce.7.inner.loop_header.reduction_dim.0:       ; preds = %reduce.7.inner.loop_body.reduction_dim.0, %reduce_156.in_bounds-true
  %reduce.7.inner.indvar.reduction_dim.0 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.0, align 4
  %11 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.0, 32
  br i1 %11, label %reduce.7.inner.loop_exit.reduction_dim.0, label %reduce.7.inner.loop_body.reduction_dim.0

reduce.7.inner.loop_body.reduction_dim.0:         ; preds = %reduce.7.inner.loop_header.reduction_dim.0
  %12 = load float, float* %accumulator_0, align 4
  %13 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.0, i32 %7
  %14 = load float, float* %13, align 4, !invariant.load !38
  store float %12, float* %parameter_buffer, align 4
  store float %14, float* %parameter_buffer1, align 4
  call void @region_1_3__1(float* %parameter_buffer, float* %parameter_buffer1, float* %return_buffer)
  %15 = load float, float* %return_buffer, align 4
  store float %15, float* %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, i32* %reduce.7.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.0

reduce.7.inner.loop_exit.reduction_dim.0:         ; preds = %reduce.7.inner.loop_header.reduction_dim.0
  %16 = load float, float* %accumulator_0, align 4
  %17 = bitcast [10 x float]* %3 to float*
  %18 = getelementptr inbounds float, float* %17, i32 %linear_index_base
  store float %16, float* %18, align 4
  %19 = load float, float* bitcast ([4 x i8]* @buffer_for_constant_151 to float*), align 4, !invariant.load !38
  store float %19, float* %accumulator_02, align 4
  store i32 0, i32* %reduce.7.inner.invar_address.reduction_dim.06, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.04

reduce.7.inner.loop_header.reduction_dim.04:      ; preds = %reduce.7.inner.loop_body.reduction_dim.05, %reduce.7.inner.loop_exit.reduction_dim.0
  %reduce.7.inner.indvar.reduction_dim.07 = load i32, i32* %reduce.7.inner.invar_address.reduction_dim.06, align 4
  %20 = icmp uge i32 %reduce.7.inner.indvar.reduction_dim.07, 32
  br i1 %20, label %reduce.7.inner.loop_exit.reduction_dim.03, label %reduce.7.inner.loop_body.reduction_dim.05

reduce.7.inner.loop_body.reduction_dim.05:        ; preds = %reduce.7.inner.loop_header.reduction_dim.04
  %21 = load float, float* %accumulator_02, align 4
  %22 = getelementptr inbounds [32 x [10 x float]], [32 x [10 x float]]* %1, i32 0, i32 %reduce.7.inner.indvar.reduction_dim.07, i32 %8
  %23 = load float, float* %22, align 4, !invariant.load !38
  store float %21, float* %parameter_buffer9, align 4
  store float %23, float* %parameter_buffer10, align 4
  call void @region_1_3__1(float* %parameter_buffer9, float* %parameter_buffer10, float* %return_buffer11)
  %24 = load float, float* %return_buffer11, align 4
  store float %24, float* %accumulator_02, align 4
  %invar.inc8 = add nuw nsw i32 %reduce.7.inner.indvar.reduction_dim.07, 1
  store i32 %invar.inc8, i32* %reduce.7.inner.invar_address.reduction_dim.06, align 4
  br label %reduce.7.inner.loop_header.reduction_dim.04

reduce.7.inner.loop_exit.reduction_dim.03:        ; preds = %reduce.7.inner.loop_header.reduction_dim.04
  %25 = load float, float* %accumulator_02, align 4
  %26 = bitcast [10 x float]* %3 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index1
  store float %25, float* %27, align 4
  br label %reduce_156.in_bounds-after
}

define internal void @region_1_3__1(float* dereferenceable(4) %Arg_0.4.typed, float* dereferenceable(4) %Arg_1.5.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.6.typed = alloca float, align 4
  %Arg_0.4 = load float, float* %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, float* %Arg_1.5.typed, align 4
  %add.6 = fadd float %Arg_0.4, %Arg_1.5
  store float %add.6, float* %add.6.typed, align 4
  %load_ret_value = load float, float* %add.6.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_4(i8* noalias align 16 dereferenceable(4) %alloc5, i8* noalias align 16 dereferenceable(4) %alloc6, i8* noalias align 16 dereferenceable(40) %alloc9, i8* noalias align 16 dereferenceable(40) %alloc11, i8* noalias align 16 dereferenceable(40) %alloc12, i8* noalias align 128 dereferenceable(40) %alloc30, i8* noalias align 128 dereferenceable(40) %alloc31, i8* noalias align 128 dereferenceable(40) %alloc32, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc9, i64 0
  %1 = bitcast i8* %0 to [10 x float]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 4096
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc11, i64 0
  %5 = bitcast i8* %4 to [10 x float]*
  %6 = getelementptr inbounds i8, i8* %alloc5, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc32, i64 0
  %9 = bitcast i8* %8 to [10 x float]*
  %10 = getelementptr inbounds i8, i8* %alloc12, i64 0
  %11 = bitcast i8* %10 to [10 x float]*
  %12 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %13 = bitcast i8* %12 to float*
  %14 = getelementptr inbounds i8, i8* %alloc30, i64 0
  %15 = bitcast i8* %14 to [10 x float]*
  %16 = getelementptr inbounds i8, i8* %alloc31, i64 0
  %17 = bitcast i8* %16 to [10 x float]*
  %18 = getelementptr inbounds i8, i8* %alloc32, i64 0
  %19 = bitcast i8* %18 to [10 x float]*
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %22 = mul nuw nsw i32 %20, 5
  %linear_index = add nuw nsw i32 %22, %21
  %linear_index_in_range = icmp ult i32 %linear_index, 5
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 2
  %23 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %24 = udiv i32 %linear_index1, 1
  %25 = icmp ult i32 %linear_index_base, 10
  br i1 %25, label %fusion_4.in_bounds-true, label %fusion_4.in_bounds-after

fusion_4.in_bounds-after:                         ; preds = %fusion_4.in_bounds-true, %entry
  ret void

fusion_4.in_bounds-true:                          ; preds = %entry
  %26 = bitcast [10 x float]* %1 to float*
  %27 = getelementptr inbounds float, float* %26, i32 %linear_index_base
  %28 = load float, float* %27, align 4, !invariant.load !38
  %29 = bitcast [10 x float]* %5 to float*
  %30 = getelementptr inbounds float, float* %29, i32 %linear_index_base
  %31 = load float, float* %30, align 4, !invariant.load !38
  %32 = bitcast [10 x float]* %9 to float*
  %33 = getelementptr inbounds float, float* %32, i32 %linear_index_base
  %34 = load float, float* %33, align 4
  %35 = bitcast [10 x float]* %5 to float*
  %36 = getelementptr inbounds float, float* %35, i32 %linear_index_base
  %37 = load float, float* %36, align 4, !invariant.load !38
  %subtract.8 = fsub float %34, %37
  %region_0_29_constant_9 = load float, float* bitcast ([4 x i8]* @18 to float*), align 4
  %38 = load float, float* %7, align 4, !invariant.load !38
  %subtract.10 = fsub float %region_0_29_constant_9, %38
  %multiply.12 = fmul float %subtract.8, %subtract.10
  %add.13 = fadd float %31, %multiply.12
  %39 = load float, float* %3, align 4, !invariant.load !38
  %multiply.15 = fmul float %add.13, %39
  %40 = bitcast [10 x float]* %11 to float*
  %41 = getelementptr inbounds float, float* %40, i32 %linear_index_base
  %42 = load float, float* %41, align 4, !invariant.load !38
  %43 = bitcast [10 x float]* %9 to float*
  %44 = getelementptr inbounds float, float* %43, i32 %linear_index_base
  %45 = load float, float* %44, align 4
  %46 = bitcast [10 x float]* %9 to float*
  %47 = getelementptr inbounds float, float* %46, i32 %linear_index_base
  %48 = load float, float* %47, align 4
  %multiply.16 = fmul float %45, %48
  %49 = bitcast [10 x float]* %11 to float*
  %50 = getelementptr inbounds float, float* %49, i32 %linear_index_base
  %51 = load float, float* %50, align 4, !invariant.load !38
  %subtract.17 = fsub float %multiply.16, %51
  %region_0_29_constant_91 = load float, float* bitcast ([4 x i8]* @18 to float*), align 4
  %52 = load float, float* %13, align 4, !invariant.load !38
  %subtract.18 = fsub float %region_0_29_constant_91, %52
  %multiply.20 = fmul float %subtract.17, %subtract.18
  %add.21 = fadd float %42, %multiply.20
  %53 = call float @__nv_sqrtf(float %add.21)
  %region_0_29_constant_23 = load float, float* bitcast ([4 x i8]* @19 to float*), align 4
  %add.25 = fadd float %53, %region_0_29_constant_23
  %divide.26 = fdiv float %multiply.15, %add.25
  %subtract.27 = fsub float %28, %divide.26
  %54 = insertvalue { float, float, float } undef, float %subtract.27, 0
  %55 = insertvalue { float, float, float } %54, float %add.13, 1
  %56 = insertvalue { float, float, float } %55, float %add.21, 2
  %57 = extractvalue { float, float, float } %56, 0
  %58 = bitcast [10 x float]* %15 to float*
  %59 = getelementptr inbounds float, float* %58, i32 %linear_index_base
  store float %57, float* %59, align 4
  %60 = extractvalue { float, float, float } %56, 1
  %61 = bitcast [10 x float]* %17 to float*
  %62 = getelementptr inbounds float, float* %61, i32 %linear_index_base
  store float %60, float* %62, align 4
  %63 = extractvalue { float, float, float } %56, 2
  %64 = bitcast [10 x float]* %19 to float*
  %65 = getelementptr inbounds float, float* %64, i32 %linear_index_base
  store float %63, float* %65, align 4
  %66 = bitcast [10 x float]* %1 to float*
  %67 = getelementptr inbounds float, float* %66, i32 %linear_index1
  %68 = load float, float* %67, align 4, !invariant.load !38
  %69 = bitcast [10 x float]* %5 to float*
  %70 = getelementptr inbounds float, float* %69, i32 %linear_index1
  %71 = load float, float* %70, align 4, !invariant.load !38
  %72 = bitcast [10 x float]* %9 to float*
  %73 = getelementptr inbounds float, float* %72, i32 %linear_index1
  %74 = load float, float* %73, align 4
  %75 = bitcast [10 x float]* %5 to float*
  %76 = getelementptr inbounds float, float* %75, i32 %linear_index1
  %77 = load float, float* %76, align 4, !invariant.load !38
  %subtract.82 = fsub float %74, %77
  %multiply.123 = fmul float %subtract.82, %subtract.10
  %add.134 = fadd float %71, %multiply.123
  %78 = load float, float* %3, align 4, !invariant.load !38
  %multiply.155 = fmul float %add.134, %78
  %79 = bitcast [10 x float]* %11 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index1
  %81 = load float, float* %80, align 4, !invariant.load !38
  %82 = bitcast [10 x float]* %9 to float*
  %83 = getelementptr inbounds float, float* %82, i32 %linear_index1
  %84 = load float, float* %83, align 4
  %85 = bitcast [10 x float]* %9 to float*
  %86 = getelementptr inbounds float, float* %85, i32 %linear_index1
  %87 = load float, float* %86, align 4
  %multiply.166 = fmul float %84, %87
  %88 = bitcast [10 x float]* %11 to float*
  %89 = getelementptr inbounds float, float* %88, i32 %linear_index1
  %90 = load float, float* %89, align 4, !invariant.load !38
  %subtract.177 = fsub float %multiply.166, %90
  %multiply.208 = fmul float %subtract.177, %subtract.18
  %add.219 = fadd float %81, %multiply.208
  %91 = call float @__nv_sqrtf(float %add.219)
  %region_0_29_constant_2310 = load float, float* bitcast ([4 x i8]* @19 to float*), align 4
  %add.2511 = fadd float %91, %region_0_29_constant_2310
  %divide.2612 = fdiv float %multiply.155, %add.2511
  %subtract.2713 = fsub float %68, %divide.2612
  %92 = insertvalue { float, float, float } undef, float %subtract.2713, 0
  %93 = insertvalue { float, float, float } %92, float %add.134, 1
  %94 = insertvalue { float, float, float } %93, float %add.219, 2
  %95 = extractvalue { float, float, float } %94, 0
  %96 = bitcast [10 x float]* %15 to float*
  %97 = getelementptr inbounds float, float* %96, i32 %linear_index1
  store float %95, float* %97, align 4
  %98 = extractvalue { float, float, float } %94, 1
  %99 = bitcast [10 x float]* %17 to float*
  %100 = getelementptr inbounds float, float* %99, i32 %linear_index1
  store float %98, float* %100, align 4
  %101 = extractvalue { float, float, float } %94, 2
  %102 = bitcast [10 x float]* %19 to float*
  %103 = getelementptr inbounds float, float* %102, i32 %linear_index1
  store float %101, float* %103, align 4
  br label %fusion_4.in_bounds-after
}

define void @fusion_1(i8* noalias align 16 dereferenceable(4) %alloc5, i8* noalias align 16 dereferenceable(4) %alloc6, i8* noalias align 16 dereferenceable(5120) %alloc10, i8* noalias align 16 dereferenceable(5120) %alloc13, i8* noalias align 16 dereferenceable(5120) %alloc14, i8* noalias align 128 dereferenceable(5120) %alloc24, i8* noalias align 128 dereferenceable(5120) %alloc25, i8* noalias align 128 dereferenceable(5120) %alloc26, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc10, i64 0
  %1 = bitcast i8* %0 to [128 x [10 x float]]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 4096
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc13, i64 0
  %5 = bitcast i8* %4 to [128 x [10 x float]]*
  %6 = getelementptr inbounds i8, i8* %alloc5, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %9 = bitcast i8* %8 to [128 x [10 x float]]*
  %10 = getelementptr inbounds i8, i8* %alloc14, i64 0
  %11 = bitcast i8* %10 to [128 x [10 x float]]*
  %12 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %13 = bitcast i8* %12 to float*
  %14 = getelementptr inbounds i8, i8* %alloc24, i64 0
  %15 = bitcast i8* %14 to [128 x [10 x float]]*
  %16 = getelementptr inbounds i8, i8* %alloc25, i64 0
  %17 = bitcast i8* %16 to [128 x [10 x float]]*
  %18 = getelementptr inbounds i8, i8* %alloc26, i64 0
  %19 = bitcast i8* %18 to [128 x [10 x float]]*
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %22 = mul nuw nsw i32 %20, 256
  %linear_index = add nuw nsw i32 %22, %21
  %linear_index_in_range = icmp ult i32 %linear_index, 512
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %23 = udiv i32 %linear_index_base, 1
  %24 = urem i32 %23, 10
  %25 = udiv i32 %linear_index_base, 10
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %26 = udiv i32 %linear_index1, 1
  %27 = urem i32 %26, 10
  %28 = udiv i32 %linear_index1, 10
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %29 = udiv i32 %linear_index2, 1
  %30 = urem i32 %29, 10
  %31 = udiv i32 %linear_index2, 10
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %32 = udiv i32 %linear_index3, 1
  %33 = urem i32 %32, 10
  %34 = udiv i32 %linear_index3, 10
  %35 = icmp ult i32 %linear_index_base, 1280
  br i1 %35, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %36 = bitcast [128 x [10 x float]]* %1 to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index_base
  %38 = load float, float* %37, align 4, !invariant.load !38
  %39 = bitcast [128 x [10 x float]]* %5 to float*
  %40 = getelementptr inbounds float, float* %39, i32 %linear_index_base
  %41 = load float, float* %40, align 4, !invariant.load !38
  %42 = bitcast [128 x [10 x float]]* %9 to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index_base
  %44 = load float, float* %43, align 4
  %45 = bitcast [128 x [10 x float]]* %5 to float*
  %46 = getelementptr inbounds float, float* %45, i32 %linear_index_base
  %47 = load float, float* %46, align 4, !invariant.load !38
  %subtract.8 = fsub float %44, %47
  %region_0_29_constant_9 = load float, float* bitcast ([4 x i8]* @20 to float*), align 4
  %48 = load float, float* %7, align 4, !invariant.load !38
  %subtract.10 = fsub float %region_0_29_constant_9, %48
  %multiply.12 = fmul float %subtract.8, %subtract.10
  %add.13 = fadd float %41, %multiply.12
  %49 = load float, float* %3, align 4, !invariant.load !38
  %multiply.15 = fmul float %add.13, %49
  %50 = bitcast [128 x [10 x float]]* %11 to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index_base
  %52 = load float, float* %51, align 4, !invariant.load !38
  %53 = bitcast [128 x [10 x float]]* %9 to float*
  %54 = getelementptr inbounds float, float* %53, i32 %linear_index_base
  %55 = load float, float* %54, align 4
  %56 = bitcast [128 x [10 x float]]* %9 to float*
  %57 = getelementptr inbounds float, float* %56, i32 %linear_index_base
  %58 = load float, float* %57, align 4
  %multiply.16 = fmul float %55, %58
  %59 = bitcast [128 x [10 x float]]* %11 to float*
  %60 = getelementptr inbounds float, float* %59, i32 %linear_index_base
  %61 = load float, float* %60, align 4, !invariant.load !38
  %subtract.17 = fsub float %multiply.16, %61
  %region_0_29_constant_91 = load float, float* bitcast ([4 x i8]* @20 to float*), align 4
  %62 = load float, float* %13, align 4, !invariant.load !38
  %subtract.18 = fsub float %region_0_29_constant_91, %62
  %multiply.20 = fmul float %subtract.17, %subtract.18
  %add.21 = fadd float %52, %multiply.20
  %63 = call float @__nv_sqrtf(float %add.21)
  %region_0_29_constant_23 = load float, float* bitcast ([4 x i8]* @21 to float*), align 4
  %add.25 = fadd float %63, %region_0_29_constant_23
  %divide.26 = fdiv float %multiply.15, %add.25
  %subtract.27 = fsub float %38, %divide.26
  %64 = insertvalue { float, float, float } undef, float %subtract.27, 0
  %65 = insertvalue { float, float, float } %64, float %add.13, 1
  %66 = insertvalue { float, float, float } %65, float %add.21, 2
  %67 = extractvalue { float, float, float } %66, 0
  %68 = bitcast [128 x [10 x float]]* %15 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index_base
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float, float } %66, 1
  %71 = bitcast [128 x [10 x float]]* %17 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index_base
  store float %70, float* %72, align 4
  %73 = extractvalue { float, float, float } %66, 2
  %74 = bitcast [128 x [10 x float]]* %19 to float*
  %75 = getelementptr inbounds float, float* %74, i32 %linear_index_base
  store float %73, float* %75, align 4
  %76 = bitcast [128 x [10 x float]]* %1 to float*
  %77 = getelementptr inbounds float, float* %76, i32 %linear_index1
  %78 = load float, float* %77, align 4, !invariant.load !38
  %79 = bitcast [128 x [10 x float]]* %5 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index1
  %81 = load float, float* %80, align 4, !invariant.load !38
  %82 = bitcast [128 x [10 x float]]* %9 to float*
  %83 = getelementptr inbounds float, float* %82, i32 %linear_index1
  %84 = load float, float* %83, align 4
  %85 = bitcast [128 x [10 x float]]* %5 to float*
  %86 = getelementptr inbounds float, float* %85, i32 %linear_index1
  %87 = load float, float* %86, align 4, !invariant.load !38
  %subtract.82 = fsub float %84, %87
  %multiply.123 = fmul float %subtract.82, %subtract.10
  %add.134 = fadd float %81, %multiply.123
  %88 = load float, float* %3, align 4, !invariant.load !38
  %multiply.155 = fmul float %add.134, %88
  %89 = bitcast [128 x [10 x float]]* %11 to float*
  %90 = getelementptr inbounds float, float* %89, i32 %linear_index1
  %91 = load float, float* %90, align 4, !invariant.load !38
  %92 = bitcast [128 x [10 x float]]* %9 to float*
  %93 = getelementptr inbounds float, float* %92, i32 %linear_index1
  %94 = load float, float* %93, align 4
  %95 = bitcast [128 x [10 x float]]* %9 to float*
  %96 = getelementptr inbounds float, float* %95, i32 %linear_index1
  %97 = load float, float* %96, align 4
  %multiply.166 = fmul float %94, %97
  %98 = bitcast [128 x [10 x float]]* %11 to float*
  %99 = getelementptr inbounds float, float* %98, i32 %linear_index1
  %100 = load float, float* %99, align 4, !invariant.load !38
  %subtract.177 = fsub float %multiply.166, %100
  %multiply.208 = fmul float %subtract.177, %subtract.18
  %add.219 = fadd float %91, %multiply.208
  %101 = call float @__nv_sqrtf(float %add.219)
  %region_0_29_constant_2310 = load float, float* bitcast ([4 x i8]* @21 to float*), align 4
  %add.2511 = fadd float %101, %region_0_29_constant_2310
  %divide.2612 = fdiv float %multiply.155, %add.2511
  %subtract.2713 = fsub float %78, %divide.2612
  %102 = insertvalue { float, float, float } undef, float %subtract.2713, 0
  %103 = insertvalue { float, float, float } %102, float %add.134, 1
  %104 = insertvalue { float, float, float } %103, float %add.219, 2
  %105 = extractvalue { float, float, float } %104, 0
  %106 = bitcast [128 x [10 x float]]* %15 to float*
  %107 = getelementptr inbounds float, float* %106, i32 %linear_index1
  store float %105, float* %107, align 4
  %108 = extractvalue { float, float, float } %104, 1
  %109 = bitcast [128 x [10 x float]]* %17 to float*
  %110 = getelementptr inbounds float, float* %109, i32 %linear_index1
  store float %108, float* %110, align 4
  %111 = extractvalue { float, float, float } %104, 2
  %112 = bitcast [128 x [10 x float]]* %19 to float*
  %113 = getelementptr inbounds float, float* %112, i32 %linear_index1
  store float %111, float* %113, align 4
  %114 = bitcast [128 x [10 x float]]* %1 to float*
  %115 = getelementptr inbounds float, float* %114, i32 %linear_index2
  %116 = load float, float* %115, align 4, !invariant.load !38
  %117 = bitcast [128 x [10 x float]]* %5 to float*
  %118 = getelementptr inbounds float, float* %117, i32 %linear_index2
  %119 = load float, float* %118, align 4, !invariant.load !38
  %120 = bitcast [128 x [10 x float]]* %9 to float*
  %121 = getelementptr inbounds float, float* %120, i32 %linear_index2
  %122 = load float, float* %121, align 4
  %123 = bitcast [128 x [10 x float]]* %5 to float*
  %124 = getelementptr inbounds float, float* %123, i32 %linear_index2
  %125 = load float, float* %124, align 4, !invariant.load !38
  %subtract.814 = fsub float %122, %125
  %multiply.1215 = fmul float %subtract.814, %subtract.10
  %add.1316 = fadd float %119, %multiply.1215
  %126 = load float, float* %3, align 4, !invariant.load !38
  %multiply.1517 = fmul float %add.1316, %126
  %127 = bitcast [128 x [10 x float]]* %11 to float*
  %128 = getelementptr inbounds float, float* %127, i32 %linear_index2
  %129 = load float, float* %128, align 4, !invariant.load !38
  %130 = bitcast [128 x [10 x float]]* %9 to float*
  %131 = getelementptr inbounds float, float* %130, i32 %linear_index2
  %132 = load float, float* %131, align 4
  %133 = bitcast [128 x [10 x float]]* %9 to float*
  %134 = getelementptr inbounds float, float* %133, i32 %linear_index2
  %135 = load float, float* %134, align 4
  %multiply.1618 = fmul float %132, %135
  %136 = bitcast [128 x [10 x float]]* %11 to float*
  %137 = getelementptr inbounds float, float* %136, i32 %linear_index2
  %138 = load float, float* %137, align 4, !invariant.load !38
  %subtract.1719 = fsub float %multiply.1618, %138
  %multiply.2020 = fmul float %subtract.1719, %subtract.18
  %add.2121 = fadd float %129, %multiply.2020
  %139 = call float @__nv_sqrtf(float %add.2121)
  %region_0_29_constant_2322 = load float, float* bitcast ([4 x i8]* @21 to float*), align 4
  %add.2523 = fadd float %139, %region_0_29_constant_2322
  %divide.2624 = fdiv float %multiply.1517, %add.2523
  %subtract.2725 = fsub float %116, %divide.2624
  %140 = insertvalue { float, float, float } undef, float %subtract.2725, 0
  %141 = insertvalue { float, float, float } %140, float %add.1316, 1
  %142 = insertvalue { float, float, float } %141, float %add.2121, 2
  %143 = extractvalue { float, float, float } %142, 0
  %144 = bitcast [128 x [10 x float]]* %15 to float*
  %145 = getelementptr inbounds float, float* %144, i32 %linear_index2
  store float %143, float* %145, align 4
  %146 = extractvalue { float, float, float } %142, 1
  %147 = bitcast [128 x [10 x float]]* %17 to float*
  %148 = getelementptr inbounds float, float* %147, i32 %linear_index2
  store float %146, float* %148, align 4
  %149 = extractvalue { float, float, float } %142, 2
  %150 = bitcast [128 x [10 x float]]* %19 to float*
  %151 = getelementptr inbounds float, float* %150, i32 %linear_index2
  store float %149, float* %151, align 4
  %152 = bitcast [128 x [10 x float]]* %1 to float*
  %153 = getelementptr inbounds float, float* %152, i32 %linear_index3
  %154 = load float, float* %153, align 4, !invariant.load !38
  %155 = bitcast [128 x [10 x float]]* %5 to float*
  %156 = getelementptr inbounds float, float* %155, i32 %linear_index3
  %157 = load float, float* %156, align 4, !invariant.load !38
  %158 = bitcast [128 x [10 x float]]* %9 to float*
  %159 = getelementptr inbounds float, float* %158, i32 %linear_index3
  %160 = load float, float* %159, align 4
  %161 = bitcast [128 x [10 x float]]* %5 to float*
  %162 = getelementptr inbounds float, float* %161, i32 %linear_index3
  %163 = load float, float* %162, align 4, !invariant.load !38
  %subtract.826 = fsub float %160, %163
  %multiply.1227 = fmul float %subtract.826, %subtract.10
  %add.1328 = fadd float %157, %multiply.1227
  %164 = load float, float* %3, align 4, !invariant.load !38
  %multiply.1529 = fmul float %add.1328, %164
  %165 = bitcast [128 x [10 x float]]* %11 to float*
  %166 = getelementptr inbounds float, float* %165, i32 %linear_index3
  %167 = load float, float* %166, align 4, !invariant.load !38
  %168 = bitcast [128 x [10 x float]]* %9 to float*
  %169 = getelementptr inbounds float, float* %168, i32 %linear_index3
  %170 = load float, float* %169, align 4
  %171 = bitcast [128 x [10 x float]]* %9 to float*
  %172 = getelementptr inbounds float, float* %171, i32 %linear_index3
  %173 = load float, float* %172, align 4
  %multiply.1630 = fmul float %170, %173
  %174 = bitcast [128 x [10 x float]]* %11 to float*
  %175 = getelementptr inbounds float, float* %174, i32 %linear_index3
  %176 = load float, float* %175, align 4, !invariant.load !38
  %subtract.1731 = fsub float %multiply.1630, %176
  %multiply.2032 = fmul float %subtract.1731, %subtract.18
  %add.2133 = fadd float %167, %multiply.2032
  %177 = call float @__nv_sqrtf(float %add.2133)
  %region_0_29_constant_2334 = load float, float* bitcast ([4 x i8]* @21 to float*), align 4
  %add.2535 = fadd float %177, %region_0_29_constant_2334
  %divide.2636 = fdiv float %multiply.1529, %add.2535
  %subtract.2737 = fsub float %154, %divide.2636
  %178 = insertvalue { float, float, float } undef, float %subtract.2737, 0
  %179 = insertvalue { float, float, float } %178, float %add.1328, 1
  %180 = insertvalue { float, float, float } %179, float %add.2133, 2
  %181 = extractvalue { float, float, float } %180, 0
  %182 = bitcast [128 x [10 x float]]* %15 to float*
  %183 = getelementptr inbounds float, float* %182, i32 %linear_index3
  store float %181, float* %183, align 4
  %184 = extractvalue { float, float, float } %180, 1
  %185 = bitcast [128 x [10 x float]]* %17 to float*
  %186 = getelementptr inbounds float, float* %185, i32 %linear_index3
  store float %184, float* %186, align 4
  %187 = extractvalue { float, float, float } %180, 2
  %188 = bitcast [128 x [10 x float]]* %19 to float*
  %189 = getelementptr inbounds float, float* %188, i32 %linear_index3
  store float %187, float* %189, align 4
  br label %fusion_1.in_bounds-after
}

define void @input_fusion_reduce_2(i8* noalias align 128 dereferenceable(401408) %alloc21, i8* noalias align 128 dereferenceable(401408) %alloc22, i8* noalias align 128 dereferenceable(401408) %alloc23, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %return_buffer50 = alloca float, align 4
  %result_from_other_lane48 = alloca float, align 4
  %return_buffer47 = alloca float, align 4
  %result_from_other_lane45 = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %result_from_other_lane42 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer26 = alloca float, align 4
  %result_from_other_lane24 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = getelementptr inbounds i8, i8* %temp_buf, i64 0
  %1 = bitcast i8* %0 to [32 x [128 x i8]]*
  %2 = getelementptr inbounds i8, i8* %alloc22, i64 0
  %3 = bitcast i8* %2 to [32 x [128 x float]]*
  %4 = getelementptr inbounds i8, i8* %alloc23, i64 0
  %5 = bitcast i8* %4 to [32 x [128 x float]]*
  %6 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %7 = bitcast i8* %6 to [128 x float]*
  %8 = getelementptr inbounds i8, i8* %alloc21, i64 0
  %9 = bitcast i8* %8 to [32 x [128 x float]]*
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !37
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after52, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, float* bitcast ([4 x i8]* @23 to float*), align 4
  %12 = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, float* %12, align 4
  %13 = getelementptr inbounds float, float* %partial_reduction_result, i32 1
  store float %region_0_17_constant_10, float* %13, align 4
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !57
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %16 = urem i32 %14, 1024
  %17 = udiv i32 %14, 1024
  %18 = mul i32 %15, 1
  %19 = add i32 %18, %17
  %20 = icmp ult i32 %19, 2
  br i1 %20, label %21, label %early_return

21:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %16, 32
  %thread_id.y = udiv i32 %16, 32
  %lane_id = urem i32 %16, 32
  %22 = udiv i32 %19, 1
  %23 = urem i32 %22, 2
  %24 = udiv i32 %19, 2
  %25 = urem i32 %24, 1
  %26 = udiv i32 %19, 2
  %block_origin.z = mul i32 %26, 1
  %27 = icmp eq i32 %25, 0
  %tile_bound = select i1 %27, i32 32, i32 4096
  %28 = icmp eq i32 %23, 1
  %tile_bound1 = select i1 %28, i32 64, i32 64
  %tile_origin.1 = mul i32 %25, 4096
  %tile_origin.2 = mul i32 %23, 64
  %29 = mul i32 %thread_id.x, 2
  %30 = add i32 %tile_origin.2, %29
  store i32 %thread_id.y, i32* %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %21
  %y_in_tile.indvar = load i32, i32* %y_in_tile.invar_address, align 4
  %31 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %31, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, i32* %y_in_tile.invar_address, align 4
  %32 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %33 = add i32 %tile_origin.1, %y_in_tile.indvar
  store i32 0, i32* %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after8, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, i32* %tile_loop.invar_address, align 4
  %34 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %34, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, i32* %tile_loop.invar_address, align 4
  %35 = icmp eq i32 %tile_loop.indvar, 0
  %36 = mul i32 %tile_loop.indvar, 2
  %37 = add i32 %36, 0
  %38 = mul i32 %tile_loop.indvar, 2
  %39 = add i32 %38, 0
  %x_loc = add i32 %39, %29
  %40 = mul i32 %tile_loop.indvar, 2
  %41 = add i32 %40, 0
  %42 = add i32 %30, %41
  %43 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %43, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %44 = mul i32 %tile_loop.indvar, 2
  %45 = add i32 %44, 1
  %46 = mul i32 %tile_loop.indvar, 2
  %47 = add i32 %46, 1
  %x_loc6 = add i32 %47, %29
  %48 = mul i32 %tile_loop.indvar, 2
  %49 = add i32 %48, 1
  %50 = add i32 %30, %49
  %51 = icmp ult i32 %x_loc6, %tile_bound1
  br i1 %51, label %x_in_tile-true7, label %x_in_tile-after8

x_in_tile-after8:                                 ; preds = %x_in_tile-true7, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !58

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !59

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], [1 x [2 x [32 x [33 x float]]]] addrspace(3)* @shared_cache2, i32 0, i32 %17, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %52 = addrspacecast float addrspace(3)* %shmem_output_address to float*
  %current_output = getelementptr inbounds float, float* %partial_reduction_result, i32 0
  %53 = load float, float* %current_output, align 4
  store float %53, float* %52, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], [1 x [2 x [32 x [33 x float]]]] addrspace(3)* @shared_cache2, i32 0, i32 %17, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %54 = addrspacecast float addrspace(3)* %shmem_transposed_addr to float*
  %partial_reduction_result19 = load float, float* %54, align 4
  %55 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 16, i32 31)
  store float %55, float* %result_from_other_lane, align 4
  call void @region_1_11(float* %54, float* %result_from_other_lane, float* %return_buffer20)
  %56 = load float, float* %return_buffer20, align 4
  store float %56, float* %54, align 4
  %partial_reduction_result22 = load float, float* %54, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 8, i32 31)
  store float %57, float* %result_from_other_lane21, align 4
  call void @region_1_11(float* %54, float* %result_from_other_lane21, float* %return_buffer23)
  %58 = load float, float* %return_buffer23, align 4
  store float %58, float* %54, align 4
  %partial_reduction_result25 = load float, float* %54, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 4, i32 31)
  store float %59, float* %result_from_other_lane24, align 4
  call void @region_1_11(float* %54, float* %result_from_other_lane24, float* %return_buffer26)
  %60 = load float, float* %return_buffer26, align 4
  store float %60, float* %54, align 4
  %partial_reduction_result28 = load float, float* %54, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 2, i32 31)
  store float %61, float* %result_from_other_lane27, align 4
  call void @region_1_11(float* %54, float* %result_from_other_lane27, float* %return_buffer29)
  %62 = load float, float* %return_buffer29, align 4
  store float %62, float* %54, align 4
  %partial_reduction_result31 = load float, float* %54, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 1, i32 31)
  store float %63, float* %result_from_other_lane30, align 4
  call void @region_1_11(float* %54, float* %result_from_other_lane30, float* %return_buffer32)
  %64 = load float, float* %return_buffer32, align 4
  store float %64, float* %54, align 4
  %65 = icmp ult i32 %thread_id.x, %tile_bound
  %66 = mul i32 %thread_id.y, 2
  %67 = icmp ult i32 %66, %tile_bound1
  %68 = and i1 %67, %65
  %69 = icmp eq i32 %lane_id, 0
  %70 = and i1 %68, %69
  br i1 %70, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address33 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], [1 x [2 x [32 x [33 x float]]]] addrspace(3)* @shared_cache2, i32 0, i32 %17, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %71 = addrspacecast float addrspace(3)* %shmem_output_address33 to float*
  %current_output34 = getelementptr inbounds float, float* %partial_reduction_result, i32 1
  %72 = load float, float* %current_output34, align 4
  store float %72, float* %71, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr35 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], [1 x [2 x [32 x [33 x float]]]] addrspace(3)* @shared_cache2, i32 0, i32 %17, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %73 = addrspacecast float addrspace(3)* %shmem_transposed_addr35 to float*
  %partial_reduction_result37 = load float, float* %73, align 4
  %74 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 16, i32 31)
  store float %74, float* %result_from_other_lane36, align 4
  call void @region_1_11(float* %73, float* %result_from_other_lane36, float* %return_buffer38)
  %75 = load float, float* %return_buffer38, align 4
  store float %75, float* %73, align 4
  %partial_reduction_result40 = load float, float* %73, align 4
  %76 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 8, i32 31)
  store float %76, float* %result_from_other_lane39, align 4
  call void @region_1_11(float* %73, float* %result_from_other_lane39, float* %return_buffer41)
  %77 = load float, float* %return_buffer41, align 4
  store float %77, float* %73, align 4
  %partial_reduction_result43 = load float, float* %73, align 4
  %78 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 4, i32 31)
  store float %78, float* %result_from_other_lane42, align 4
  call void @region_1_11(float* %73, float* %result_from_other_lane42, float* %return_buffer44)
  %79 = load float, float* %return_buffer44, align 4
  store float %79, float* %73, align 4
  %partial_reduction_result46 = load float, float* %73, align 4
  %80 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result46, i32 2, i32 31)
  store float %80, float* %result_from_other_lane45, align 4
  call void @region_1_11(float* %73, float* %result_from_other_lane45, float* %return_buffer47)
  %81 = load float, float* %return_buffer47, align 4
  store float %81, float* %73, align 4
  %partial_reduction_result49 = load float, float* %73, align 4
  %82 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result49, i32 1, i32 31)
  store float %82, float* %result_from_other_lane48, align 4
  call void @region_1_11(float* %73, float* %result_from_other_lane48, float* %return_buffer50)
  %83 = load float, float* %return_buffer50, align 4
  store float %83, float* %73, align 4
  %84 = icmp ult i32 %thread_id.x, %tile_bound
  %85 = mul i32 %thread_id.y, 2
  %86 = icmp ult i32 %85, %tile_bound1
  %87 = and i1 %86, %84
  %88 = icmp eq i32 %lane_id, 0
  %89 = and i1 %87, %88
  br i1 %89, label %reduction_write_output-true51, label %reduction_write_output-after52

reduction_write_output-after52:                   ; preds = %reduction_write_output-true51, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %Arg_2.3 = getelementptr inbounds [32 x [128 x float]], [32 x [128 x float]]* %5, i32 0, i32 %33, i32 %42
  %Arg_2.33 = load float, float* %Arg_2.3, align 4, !invariant.load !38
  %region_0_17_constant_4 = load float, float* bitcast ([4 x i8]* @22 to float*), align 4
  %90 = fcmp oge float %Arg_2.33, %region_0_17_constant_4
  %91 = fcmp une float %Arg_2.33, %Arg_2.33
  %92 = or i1 %90, %91
  %maximum.6 = select i1 %92, float %Arg_2.33, float %region_0_17_constant_4
  %compare.7 = fcmp ogt float %maximum.6, %region_0_17_constant_4
  %93 = zext i1 %compare.7 to i8
  %Arg_0.1 = getelementptr inbounds [32 x [128 x i8]], [32 x [128 x i8]]* %1, i32 0, i32 %33, i32 %42
  %Arg_0.14 = load i8, i8* %Arg_0.1, align 1, !invariant.load !38
  %Arg_1.2 = getelementptr inbounds [32 x [128 x float]], [32 x [128 x float]]* %3, i32 0, i32 %33, i32 %42
  %Arg_1.25 = load float, float* %Arg_1.2, align 4, !invariant.load !38
  %94 = trunc i8 %Arg_0.14 to i1
  %95 = select i1 %94, float %Arg_1.25, float %region_0_17_constant_4
  %96 = trunc i8 %93 to i1
  %97 = select i1 %96, float %95, float %region_0_17_constant_4
  store float %97, float* %reduction_input_address, align 4
  %98 = getelementptr inbounds float, float* %partial_reduction_result, i32 %37
  call void @region_1_11(float* %98, float* %reduction_input_address, float* %return_buffer)
  %99 = load float, float* %return_buffer, align 4
  store float %99, float* %98, align 4
  %100 = getelementptr inbounds [32 x [128 x float]], [32 x [128 x float]]* %9, i32 0, i32 %33, i32 %42
  store float %97, float* %100, align 4
  br label %x_in_tile-after

x_in_tile-true7:                                  ; preds = %x_in_tile-after
  %Arg_2.39 = getelementptr inbounds [32 x [128 x float]], [32 x [128 x float]]* %5, i32 0, i32 %33, i32 %50
  %Arg_2.310 = load float, float* %Arg_2.39, align 4, !invariant.load !38
  %region_0_17_constant_411 = load float, float* bitcast ([4 x i8]* @22 to float*), align 4
  %101 = fcmp oge float %Arg_2.310, %region_0_17_constant_411
  %102 = fcmp une float %Arg_2.310, %Arg_2.310
  %103 = or i1 %101, %102
  %maximum.612 = select i1 %103, float %Arg_2.310, float %region_0_17_constant_411
  %compare.713 = fcmp ogt float %maximum.612, %region_0_17_constant_411
  %104 = zext i1 %compare.713 to i8
  %Arg_0.114 = getelementptr inbounds [32 x [128 x i8]], [32 x [128 x i8]]* %1, i32 0, i32 %33, i32 %50
  %Arg_0.115 = load i8, i8* %Arg_0.114, align 1, !invariant.load !38
  %Arg_1.216 = getelementptr inbounds [32 x [128 x float]], [32 x [128 x float]]* %3, i32 0, i32 %33, i32 %50
  %Arg_1.217 = load float, float* %Arg_1.216, align 4, !invariant.load !38
  %105 = trunc i8 %Arg_0.115 to i1
  %106 = select i1 %105, float %Arg_1.217, float %region_0_17_constant_411
  %107 = trunc i8 %104 to i1
  %108 = select i1 %107, float %106, float %region_0_17_constant_411
  store float %108, float* %reduction_input_address, align 4
  %109 = getelementptr inbounds float, float* %partial_reduction_result, i32 %45
  call void @region_1_11(float* %109, float* %reduction_input_address, float* %return_buffer18)
  %110 = load float, float* %return_buffer18, align 4
  store float %110, float* %109, align 4
  %111 = getelementptr inbounds [32 x [128 x float]], [32 x [128 x float]]* %9, i32 0, i32 %33, i32 %50
  store float %108, float* %111, align 4
  br label %x_in_tile-after8

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %112 = mul i32 %thread_id.y, 2
  %113 = add i32 %tile_origin.1, %thread_id.x
  %114 = add i32 %tile_origin.2, %112
  %115 = add i32 %114, 0
  %116 = mul i32 %block_origin.z, 128
  %117 = add i32 %116, %115
  %118 = udiv i32 %117, 1
  %output_element_address = getelementptr inbounds [128 x float], [128 x float]* %7, i32 0, i32 %118
  %output_value = load float, float* %54, align 4
  store float %output_value, float* %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true51:                    ; preds = %reduction_write_output-after
  %119 = mul i32 %thread_id.y, 2
  %120 = add i32 %tile_origin.1, %thread_id.x
  %121 = add i32 %tile_origin.2, %119
  %122 = add i32 %121, 1
  %123 = mul i32 %block_origin.z, 128
  %124 = add i32 %123, %122
  %125 = udiv i32 %124, 1
  %output_element_address53 = getelementptr inbounds [128 x float], [128 x float]* %7, i32 0, i32 %125
  %output_value54 = load float, float* %73, align 4
  store float %output_value54, float* %output_element_address53, align 4
  br label %reduction_write_output-after52
}

define internal void @region_1_11(float* dereferenceable(4) %Arg_0.12.typed, float* dereferenceable(4) %Arg_1.13.typed, float* dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, float* %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, float* %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, float* %add.14.typed, align 4
  %load_ret_value = load float, float* %add.14.typed, align 4
  store float %load_ret_value, float* %output_arg, align 4
  ret void
}

define void @fusion_10(i8* noalias align 16 dereferenceable(4) %alloc5, i8* noalias align 16 dereferenceable(4) %alloc6, i8* noalias align 16 dereferenceable(512) %alloc7, i8* noalias align 16 dereferenceable(512) %alloc19, i8* noalias align 16 dereferenceable(512) %alloc20, i8* noalias align 128 dereferenceable(512) %alloc27, i8* noalias align 128 dereferenceable(512) %alloc28, i8* noalias align 128 dereferenceable(512) %alloc29, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc7, i64 0
  %1 = bitcast i8* %0 to [128 x float]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 4096
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc19, i64 0
  %5 = bitcast i8* %4 to [128 x float]*
  %6 = getelementptr inbounds i8, i8* %alloc5, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %9 = bitcast i8* %8 to [128 x float]*
  %10 = getelementptr inbounds i8, i8* %alloc20, i64 0
  %11 = bitcast i8* %10 to [128 x float]*
  %12 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %13 = bitcast i8* %12 to float*
  %14 = getelementptr inbounds i8, i8* %alloc27, i64 0
  %15 = bitcast i8* %14 to [128 x float]*
  %16 = getelementptr inbounds i8, i8* %alloc28, i64 0
  %17 = bitcast i8* %16 to [128 x float]*
  %18 = getelementptr inbounds i8, i8* %alloc29, i64 0
  %19 = bitcast i8* %18 to [128 x float]*
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !41
  %22 = mul nuw nsw i32 %20, 32
  %linear_index = add nuw nsw i32 %22, %21
  %linear_index_in_range = icmp ult i32 %linear_index, 32
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %23 = udiv i32 %linear_index_base, 1
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %24 = udiv i32 %linear_index1, 1
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %25 = udiv i32 %linear_index2, 1
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %26 = udiv i32 %linear_index3, 1
  %27 = icmp ult i32 %linear_index_base, 128
  br i1 %27, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %fusion_10.in_bounds-true, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %28 = bitcast [128 x float]* %1 to float*
  %29 = getelementptr inbounds float, float* %28, i32 %linear_index_base
  %30 = load float, float* %29, align 4, !invariant.load !38
  %31 = bitcast [128 x float]* %5 to float*
  %32 = getelementptr inbounds float, float* %31, i32 %linear_index_base
  %33 = load float, float* %32, align 4, !invariant.load !38
  %34 = bitcast [128 x float]* %9 to float*
  %35 = getelementptr inbounds float, float* %34, i32 %linear_index_base
  %36 = load float, float* %35, align 4
  %37 = bitcast [128 x float]* %5 to float*
  %38 = getelementptr inbounds float, float* %37, i32 %linear_index_base
  %39 = load float, float* %38, align 4, !invariant.load !38
  %subtract.8 = fsub float %36, %39
  %region_0_29_constant_9 = load float, float* bitcast ([4 x i8]* @24 to float*), align 4
  %40 = load float, float* %7, align 4, !invariant.load !38
  %subtract.10 = fsub float %region_0_29_constant_9, %40
  %multiply.12 = fmul float %subtract.8, %subtract.10
  %add.13 = fadd float %33, %multiply.12
  %41 = load float, float* %3, align 4, !invariant.load !38
  %multiply.15 = fmul float %add.13, %41
  %42 = bitcast [128 x float]* %11 to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index_base
  %44 = load float, float* %43, align 4, !invariant.load !38
  %45 = bitcast [128 x float]* %9 to float*
  %46 = getelementptr inbounds float, float* %45, i32 %linear_index_base
  %47 = load float, float* %46, align 4
  %48 = bitcast [128 x float]* %9 to float*
  %49 = getelementptr inbounds float, float* %48, i32 %linear_index_base
  %50 = load float, float* %49, align 4
  %multiply.16 = fmul float %47, %50
  %51 = bitcast [128 x float]* %11 to float*
  %52 = getelementptr inbounds float, float* %51, i32 %linear_index_base
  %53 = load float, float* %52, align 4, !invariant.load !38
  %subtract.17 = fsub float %multiply.16, %53
  %region_0_29_constant_91 = load float, float* bitcast ([4 x i8]* @24 to float*), align 4
  %54 = load float, float* %13, align 4, !invariant.load !38
  %subtract.18 = fsub float %region_0_29_constant_91, %54
  %multiply.20 = fmul float %subtract.17, %subtract.18
  %add.21 = fadd float %44, %multiply.20
  %55 = call float @__nv_sqrtf(float %add.21)
  %region_0_29_constant_23 = load float, float* bitcast ([4 x i8]* @25 to float*), align 4
  %add.25 = fadd float %55, %region_0_29_constant_23
  %divide.26 = fdiv float %multiply.15, %add.25
  %subtract.27 = fsub float %30, %divide.26
  %56 = insertvalue { float, float, float } undef, float %subtract.27, 0
  %57 = insertvalue { float, float, float } %56, float %add.13, 1
  %58 = insertvalue { float, float, float } %57, float %add.21, 2
  %59 = extractvalue { float, float, float } %58, 0
  %60 = bitcast [128 x float]* %15 to float*
  %61 = getelementptr inbounds float, float* %60, i32 %linear_index_base
  store float %59, float* %61, align 4
  %62 = extractvalue { float, float, float } %58, 1
  %63 = bitcast [128 x float]* %17 to float*
  %64 = getelementptr inbounds float, float* %63, i32 %linear_index_base
  store float %62, float* %64, align 4
  %65 = extractvalue { float, float, float } %58, 2
  %66 = bitcast [128 x float]* %19 to float*
  %67 = getelementptr inbounds float, float* %66, i32 %linear_index_base
  store float %65, float* %67, align 4
  %68 = bitcast [128 x float]* %1 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index1
  %70 = load float, float* %69, align 4, !invariant.load !38
  %71 = bitcast [128 x float]* %5 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index1
  %73 = load float, float* %72, align 4, !invariant.load !38
  %74 = bitcast [128 x float]* %9 to float*
  %75 = getelementptr inbounds float, float* %74, i32 %linear_index1
  %76 = load float, float* %75, align 4
  %77 = bitcast [128 x float]* %5 to float*
  %78 = getelementptr inbounds float, float* %77, i32 %linear_index1
  %79 = load float, float* %78, align 4, !invariant.load !38
  %subtract.82 = fsub float %76, %79
  %multiply.123 = fmul float %subtract.82, %subtract.10
  %add.134 = fadd float %73, %multiply.123
  %80 = load float, float* %3, align 4, !invariant.load !38
  %multiply.155 = fmul float %add.134, %80
  %81 = bitcast [128 x float]* %11 to float*
  %82 = getelementptr inbounds float, float* %81, i32 %linear_index1
  %83 = load float, float* %82, align 4, !invariant.load !38
  %84 = bitcast [128 x float]* %9 to float*
  %85 = getelementptr inbounds float, float* %84, i32 %linear_index1
  %86 = load float, float* %85, align 4
  %87 = bitcast [128 x float]* %9 to float*
  %88 = getelementptr inbounds float, float* %87, i32 %linear_index1
  %89 = load float, float* %88, align 4
  %multiply.166 = fmul float %86, %89
  %90 = bitcast [128 x float]* %11 to float*
  %91 = getelementptr inbounds float, float* %90, i32 %linear_index1
  %92 = load float, float* %91, align 4, !invariant.load !38
  %subtract.177 = fsub float %multiply.166, %92
  %multiply.208 = fmul float %subtract.177, %subtract.18
  %add.219 = fadd float %83, %multiply.208
  %93 = call float @__nv_sqrtf(float %add.219)
  %region_0_29_constant_2310 = load float, float* bitcast ([4 x i8]* @25 to float*), align 4
  %add.2511 = fadd float %93, %region_0_29_constant_2310
  %divide.2612 = fdiv float %multiply.155, %add.2511
  %subtract.2713 = fsub float %70, %divide.2612
  %94 = insertvalue { float, float, float } undef, float %subtract.2713, 0
  %95 = insertvalue { float, float, float } %94, float %add.134, 1
  %96 = insertvalue { float, float, float } %95, float %add.219, 2
  %97 = extractvalue { float, float, float } %96, 0
  %98 = bitcast [128 x float]* %15 to float*
  %99 = getelementptr inbounds float, float* %98, i32 %linear_index1
  store float %97, float* %99, align 4
  %100 = extractvalue { float, float, float } %96, 1
  %101 = bitcast [128 x float]* %17 to float*
  %102 = getelementptr inbounds float, float* %101, i32 %linear_index1
  store float %100, float* %102, align 4
  %103 = extractvalue { float, float, float } %96, 2
  %104 = bitcast [128 x float]* %19 to float*
  %105 = getelementptr inbounds float, float* %104, i32 %linear_index1
  store float %103, float* %105, align 4
  %106 = bitcast [128 x float]* %1 to float*
  %107 = getelementptr inbounds float, float* %106, i32 %linear_index2
  %108 = load float, float* %107, align 4, !invariant.load !38
  %109 = bitcast [128 x float]* %5 to float*
  %110 = getelementptr inbounds float, float* %109, i32 %linear_index2
  %111 = load float, float* %110, align 4, !invariant.load !38
  %112 = bitcast [128 x float]* %9 to float*
  %113 = getelementptr inbounds float, float* %112, i32 %linear_index2
  %114 = load float, float* %113, align 4
  %115 = bitcast [128 x float]* %5 to float*
  %116 = getelementptr inbounds float, float* %115, i32 %linear_index2
  %117 = load float, float* %116, align 4, !invariant.load !38
  %subtract.814 = fsub float %114, %117
  %multiply.1215 = fmul float %subtract.814, %subtract.10
  %add.1316 = fadd float %111, %multiply.1215
  %118 = load float, float* %3, align 4, !invariant.load !38
  %multiply.1517 = fmul float %add.1316, %118
  %119 = bitcast [128 x float]* %11 to float*
  %120 = getelementptr inbounds float, float* %119, i32 %linear_index2
  %121 = load float, float* %120, align 4, !invariant.load !38
  %122 = bitcast [128 x float]* %9 to float*
  %123 = getelementptr inbounds float, float* %122, i32 %linear_index2
  %124 = load float, float* %123, align 4
  %125 = bitcast [128 x float]* %9 to float*
  %126 = getelementptr inbounds float, float* %125, i32 %linear_index2
  %127 = load float, float* %126, align 4
  %multiply.1618 = fmul float %124, %127
  %128 = bitcast [128 x float]* %11 to float*
  %129 = getelementptr inbounds float, float* %128, i32 %linear_index2
  %130 = load float, float* %129, align 4, !invariant.load !38
  %subtract.1719 = fsub float %multiply.1618, %130
  %multiply.2020 = fmul float %subtract.1719, %subtract.18
  %add.2121 = fadd float %121, %multiply.2020
  %131 = call float @__nv_sqrtf(float %add.2121)
  %region_0_29_constant_2322 = load float, float* bitcast ([4 x i8]* @25 to float*), align 4
  %add.2523 = fadd float %131, %region_0_29_constant_2322
  %divide.2624 = fdiv float %multiply.1517, %add.2523
  %subtract.2725 = fsub float %108, %divide.2624
  %132 = insertvalue { float, float, float } undef, float %subtract.2725, 0
  %133 = insertvalue { float, float, float } %132, float %add.1316, 1
  %134 = insertvalue { float, float, float } %133, float %add.2121, 2
  %135 = extractvalue { float, float, float } %134, 0
  %136 = bitcast [128 x float]* %15 to float*
  %137 = getelementptr inbounds float, float* %136, i32 %linear_index2
  store float %135, float* %137, align 4
  %138 = extractvalue { float, float, float } %134, 1
  %139 = bitcast [128 x float]* %17 to float*
  %140 = getelementptr inbounds float, float* %139, i32 %linear_index2
  store float %138, float* %140, align 4
  %141 = extractvalue { float, float, float } %134, 2
  %142 = bitcast [128 x float]* %19 to float*
  %143 = getelementptr inbounds float, float* %142, i32 %linear_index2
  store float %141, float* %143, align 4
  %144 = bitcast [128 x float]* %1 to float*
  %145 = getelementptr inbounds float, float* %144, i32 %linear_index3
  %146 = load float, float* %145, align 4, !invariant.load !38
  %147 = bitcast [128 x float]* %5 to float*
  %148 = getelementptr inbounds float, float* %147, i32 %linear_index3
  %149 = load float, float* %148, align 4, !invariant.load !38
  %150 = bitcast [128 x float]* %9 to float*
  %151 = getelementptr inbounds float, float* %150, i32 %linear_index3
  %152 = load float, float* %151, align 4
  %153 = bitcast [128 x float]* %5 to float*
  %154 = getelementptr inbounds float, float* %153, i32 %linear_index3
  %155 = load float, float* %154, align 4, !invariant.load !38
  %subtract.826 = fsub float %152, %155
  %multiply.1227 = fmul float %subtract.826, %subtract.10
  %add.1328 = fadd float %149, %multiply.1227
  %156 = load float, float* %3, align 4, !invariant.load !38
  %multiply.1529 = fmul float %add.1328, %156
  %157 = bitcast [128 x float]* %11 to float*
  %158 = getelementptr inbounds float, float* %157, i32 %linear_index3
  %159 = load float, float* %158, align 4, !invariant.load !38
  %160 = bitcast [128 x float]* %9 to float*
  %161 = getelementptr inbounds float, float* %160, i32 %linear_index3
  %162 = load float, float* %161, align 4
  %163 = bitcast [128 x float]* %9 to float*
  %164 = getelementptr inbounds float, float* %163, i32 %linear_index3
  %165 = load float, float* %164, align 4
  %multiply.1630 = fmul float %162, %165
  %166 = bitcast [128 x float]* %11 to float*
  %167 = getelementptr inbounds float, float* %166, i32 %linear_index3
  %168 = load float, float* %167, align 4, !invariant.load !38
  %subtract.1731 = fsub float %multiply.1630, %168
  %multiply.2032 = fmul float %subtract.1731, %subtract.18
  %add.2133 = fadd float %159, %multiply.2032
  %169 = call float @__nv_sqrtf(float %add.2133)
  %region_0_29_constant_2334 = load float, float* bitcast ([4 x i8]* @25 to float*), align 4
  %add.2535 = fadd float %169, %region_0_29_constant_2334
  %divide.2636 = fdiv float %multiply.1529, %add.2535
  %subtract.2737 = fsub float %146, %divide.2636
  %170 = insertvalue { float, float, float } undef, float %subtract.2737, 0
  %171 = insertvalue { float, float, float } %170, float %add.1328, 1
  %172 = insertvalue { float, float, float } %171, float %add.2133, 2
  %173 = extractvalue { float, float, float } %172, 0
  %174 = bitcast [128 x float]* %15 to float*
  %175 = getelementptr inbounds float, float* %174, i32 %linear_index3
  store float %173, float* %175, align 4
  %176 = extractvalue { float, float, float } %172, 1
  %177 = bitcast [128 x float]* %17 to float*
  %178 = getelementptr inbounds float, float* %177, i32 %linear_index3
  store float %176, float* %178, align 4
  %179 = extractvalue { float, float, float } %172, 2
  %180 = bitcast [128 x float]* %19 to float*
  %181 = getelementptr inbounds float, float* %180, i32 %linear_index3
  store float %179, float* %181, align 4
  br label %fusion_10.in_bounds-after
}

define void @fusion_7(i8* noalias align 16 dereferenceable(4) %alloc5, i8* noalias align 16 dereferenceable(4) %alloc6, i8* noalias align 16 dereferenceable(401408) %alloc8, i8* noalias align 16 dereferenceable(401408) %alloc17, i8* noalias align 16 dereferenceable(401408) %alloc18, i8* noalias align 128 dereferenceable(401408) %alloc21, i8* noalias align 128 dereferenceable(401408) %alloc22, i8* noalias align 128 dereferenceable(401408) %alloc23, i8* noalias align 128 dereferenceable(5272) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc8, i64 0
  %1 = bitcast i8* %0 to [784 x [128 x float]]*
  %2 = getelementptr inbounds i8, i8* %temp_buf, i64 4096
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc17, i64 0
  %5 = bitcast i8* %4 to [784 x [128 x float]]*
  %6 = getelementptr inbounds i8, i8* %alloc5, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc23, i64 0
  %9 = bitcast i8* %8 to [784 x [128 x float]]*
  %10 = getelementptr inbounds i8, i8* %alloc18, i64 0
  %11 = bitcast i8* %10 to [784 x [128 x float]]*
  %12 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %13 = bitcast i8* %12 to float*
  %14 = getelementptr inbounds i8, i8* %alloc21, i64 0
  %15 = bitcast i8* %14 to [784 x [128 x float]]*
  %16 = getelementptr inbounds i8, i8* %alloc22, i64 0
  %17 = bitcast i8* %16 to [784 x [128 x float]]*
  %18 = getelementptr inbounds i8, i8* %alloc23, i64 0
  %19 = bitcast i8* %18 to [784 x [128 x float]]*
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !43
  %22 = mul nuw nsw i32 %20, 256
  %linear_index = add nuw nsw i32 %22, %21
  %linear_index_in_range = icmp ult i32 %linear_index, 25088
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %23 = udiv i32 %linear_index_base, 1
  %24 = urem i32 %23, 128
  %25 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %26 = udiv i32 %linear_index1, 1
  %27 = urem i32 %26, 128
  %28 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %29 = udiv i32 %linear_index2, 1
  %30 = urem i32 %29, 128
  %31 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %32 = udiv i32 %linear_index3, 1
  %33 = urem i32 %32, 128
  %34 = udiv i32 %linear_index3, 128
  %35 = icmp ult i32 %linear_index_base, 100352
  br i1 %35, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %36 = bitcast [784 x [128 x float]]* %1 to float*
  %37 = getelementptr inbounds float, float* %36, i32 %linear_index_base
  %38 = load float, float* %37, align 4, !invariant.load !38
  %39 = bitcast [784 x [128 x float]]* %5 to float*
  %40 = getelementptr inbounds float, float* %39, i32 %linear_index_base
  %41 = load float, float* %40, align 4, !invariant.load !38
  %42 = bitcast [784 x [128 x float]]* %9 to float*
  %43 = getelementptr inbounds float, float* %42, i32 %linear_index_base
  %44 = load float, float* %43, align 4
  %45 = bitcast [784 x [128 x float]]* %5 to float*
  %46 = getelementptr inbounds float, float* %45, i32 %linear_index_base
  %47 = load float, float* %46, align 4, !invariant.load !38
  %subtract.8 = fsub float %44, %47
  %region_0_29_constant_9 = load float, float* bitcast ([4 x i8]* @26 to float*), align 4
  %48 = load float, float* %7, align 4, !invariant.load !38
  %subtract.10 = fsub float %region_0_29_constant_9, %48
  %multiply.12 = fmul float %subtract.8, %subtract.10
  %add.13 = fadd float %41, %multiply.12
  %49 = load float, float* %3, align 4, !invariant.load !38
  %multiply.15 = fmul float %add.13, %49
  %50 = bitcast [784 x [128 x float]]* %11 to float*
  %51 = getelementptr inbounds float, float* %50, i32 %linear_index_base
  %52 = load float, float* %51, align 4, !invariant.load !38
  %53 = bitcast [784 x [128 x float]]* %9 to float*
  %54 = getelementptr inbounds float, float* %53, i32 %linear_index_base
  %55 = load float, float* %54, align 4
  %56 = bitcast [784 x [128 x float]]* %9 to float*
  %57 = getelementptr inbounds float, float* %56, i32 %linear_index_base
  %58 = load float, float* %57, align 4
  %multiply.16 = fmul float %55, %58
  %59 = bitcast [784 x [128 x float]]* %11 to float*
  %60 = getelementptr inbounds float, float* %59, i32 %linear_index_base
  %61 = load float, float* %60, align 4, !invariant.load !38
  %subtract.17 = fsub float %multiply.16, %61
  %region_0_29_constant_91 = load float, float* bitcast ([4 x i8]* @26 to float*), align 4
  %62 = load float, float* %13, align 4, !invariant.load !38
  %subtract.18 = fsub float %region_0_29_constant_91, %62
  %multiply.20 = fmul float %subtract.17, %subtract.18
  %add.21 = fadd float %52, %multiply.20
  %63 = call float @__nv_sqrtf(float %add.21)
  %region_0_29_constant_23 = load float, float* bitcast ([4 x i8]* @27 to float*), align 4
  %add.25 = fadd float %63, %region_0_29_constant_23
  %divide.26 = fdiv float %multiply.15, %add.25
  %subtract.27 = fsub float %38, %divide.26
  %64 = insertvalue { float, float, float } undef, float %subtract.27, 0
  %65 = insertvalue { float, float, float } %64, float %add.13, 1
  %66 = insertvalue { float, float, float } %65, float %add.21, 2
  %67 = extractvalue { float, float, float } %66, 0
  %68 = bitcast [784 x [128 x float]]* %15 to float*
  %69 = getelementptr inbounds float, float* %68, i32 %linear_index_base
  store float %67, float* %69, align 4
  %70 = extractvalue { float, float, float } %66, 1
  %71 = bitcast [784 x [128 x float]]* %17 to float*
  %72 = getelementptr inbounds float, float* %71, i32 %linear_index_base
  store float %70, float* %72, align 4
  %73 = extractvalue { float, float, float } %66, 2
  %74 = bitcast [784 x [128 x float]]* %19 to float*
  %75 = getelementptr inbounds float, float* %74, i32 %linear_index_base
  store float %73, float* %75, align 4
  %76 = bitcast [784 x [128 x float]]* %1 to float*
  %77 = getelementptr inbounds float, float* %76, i32 %linear_index1
  %78 = load float, float* %77, align 4, !invariant.load !38
  %79 = bitcast [784 x [128 x float]]* %5 to float*
  %80 = getelementptr inbounds float, float* %79, i32 %linear_index1
  %81 = load float, float* %80, align 4, !invariant.load !38
  %82 = bitcast [784 x [128 x float]]* %9 to float*
  %83 = getelementptr inbounds float, float* %82, i32 %linear_index1
  %84 = load float, float* %83, align 4
  %85 = bitcast [784 x [128 x float]]* %5 to float*
  %86 = getelementptr inbounds float, float* %85, i32 %linear_index1
  %87 = load float, float* %86, align 4, !invariant.load !38
  %subtract.82 = fsub float %84, %87
  %multiply.123 = fmul float %subtract.82, %subtract.10
  %add.134 = fadd float %81, %multiply.123
  %88 = load float, float* %3, align 4, !invariant.load !38
  %multiply.155 = fmul float %add.134, %88
  %89 = bitcast [784 x [128 x float]]* %11 to float*
  %90 = getelementptr inbounds float, float* %89, i32 %linear_index1
  %91 = load float, float* %90, align 4, !invariant.load !38
  %92 = bitcast [784 x [128 x float]]* %9 to float*
  %93 = getelementptr inbounds float, float* %92, i32 %linear_index1
  %94 = load float, float* %93, align 4
  %95 = bitcast [784 x [128 x float]]* %9 to float*
  %96 = getelementptr inbounds float, float* %95, i32 %linear_index1
  %97 = load float, float* %96, align 4
  %multiply.166 = fmul float %94, %97
  %98 = bitcast [784 x [128 x float]]* %11 to float*
  %99 = getelementptr inbounds float, float* %98, i32 %linear_index1
  %100 = load float, float* %99, align 4, !invariant.load !38
  %subtract.177 = fsub float %multiply.166, %100
  %multiply.208 = fmul float %subtract.177, %subtract.18
  %add.219 = fadd float %91, %multiply.208
  %101 = call float @__nv_sqrtf(float %add.219)
  %region_0_29_constant_2310 = load float, float* bitcast ([4 x i8]* @27 to float*), align 4
  %add.2511 = fadd float %101, %region_0_29_constant_2310
  %divide.2612 = fdiv float %multiply.155, %add.2511
  %subtract.2713 = fsub float %78, %divide.2612
  %102 = insertvalue { float, float, float } undef, float %subtract.2713, 0
  %103 = insertvalue { float, float, float } %102, float %add.134, 1
  %104 = insertvalue { float, float, float } %103, float %add.219, 2
  %105 = extractvalue { float, float, float } %104, 0
  %106 = bitcast [784 x [128 x float]]* %15 to float*
  %107 = getelementptr inbounds float, float* %106, i32 %linear_index1
  store float %105, float* %107, align 4
  %108 = extractvalue { float, float, float } %104, 1
  %109 = bitcast [784 x [128 x float]]* %17 to float*
  %110 = getelementptr inbounds float, float* %109, i32 %linear_index1
  store float %108, float* %110, align 4
  %111 = extractvalue { float, float, float } %104, 2
  %112 = bitcast [784 x [128 x float]]* %19 to float*
  %113 = getelementptr inbounds float, float* %112, i32 %linear_index1
  store float %111, float* %113, align 4
  %114 = bitcast [784 x [128 x float]]* %1 to float*
  %115 = getelementptr inbounds float, float* %114, i32 %linear_index2
  %116 = load float, float* %115, align 4, !invariant.load !38
  %117 = bitcast [784 x [128 x float]]* %5 to float*
  %118 = getelementptr inbounds float, float* %117, i32 %linear_index2
  %119 = load float, float* %118, align 4, !invariant.load !38
  %120 = bitcast [784 x [128 x float]]* %9 to float*
  %121 = getelementptr inbounds float, float* %120, i32 %linear_index2
  %122 = load float, float* %121, align 4
  %123 = bitcast [784 x [128 x float]]* %5 to float*
  %124 = getelementptr inbounds float, float* %123, i32 %linear_index2
  %125 = load float, float* %124, align 4, !invariant.load !38
  %subtract.814 = fsub float %122, %125
  %multiply.1215 = fmul float %subtract.814, %subtract.10
  %add.1316 = fadd float %119, %multiply.1215
  %126 = load float, float* %3, align 4, !invariant.load !38
  %multiply.1517 = fmul float %add.1316, %126
  %127 = bitcast [784 x [128 x float]]* %11 to float*
  %128 = getelementptr inbounds float, float* %127, i32 %linear_index2
  %129 = load float, float* %128, align 4, !invariant.load !38
  %130 = bitcast [784 x [128 x float]]* %9 to float*
  %131 = getelementptr inbounds float, float* %130, i32 %linear_index2
  %132 = load float, float* %131, align 4
  %133 = bitcast [784 x [128 x float]]* %9 to float*
  %134 = getelementptr inbounds float, float* %133, i32 %linear_index2
  %135 = load float, float* %134, align 4
  %multiply.1618 = fmul float %132, %135
  %136 = bitcast [784 x [128 x float]]* %11 to float*
  %137 = getelementptr inbounds float, float* %136, i32 %linear_index2
  %138 = load float, float* %137, align 4, !invariant.load !38
  %subtract.1719 = fsub float %multiply.1618, %138
  %multiply.2020 = fmul float %subtract.1719, %subtract.18
  %add.2121 = fadd float %129, %multiply.2020
  %139 = call float @__nv_sqrtf(float %add.2121)
  %region_0_29_constant_2322 = load float, float* bitcast ([4 x i8]* @27 to float*), align 4
  %add.2523 = fadd float %139, %region_0_29_constant_2322
  %divide.2624 = fdiv float %multiply.1517, %add.2523
  %subtract.2725 = fsub float %116, %divide.2624
  %140 = insertvalue { float, float, float } undef, float %subtract.2725, 0
  %141 = insertvalue { float, float, float } %140, float %add.1316, 1
  %142 = insertvalue { float, float, float } %141, float %add.2121, 2
  %143 = extractvalue { float, float, float } %142, 0
  %144 = bitcast [784 x [128 x float]]* %15 to float*
  %145 = getelementptr inbounds float, float* %144, i32 %linear_index2
  store float %143, float* %145, align 4
  %146 = extractvalue { float, float, float } %142, 1
  %147 = bitcast [784 x [128 x float]]* %17 to float*
  %148 = getelementptr inbounds float, float* %147, i32 %linear_index2
  store float %146, float* %148, align 4
  %149 = extractvalue { float, float, float } %142, 2
  %150 = bitcast [784 x [128 x float]]* %19 to float*
  %151 = getelementptr inbounds float, float* %150, i32 %linear_index2
  store float %149, float* %151, align 4
  %152 = bitcast [784 x [128 x float]]* %1 to float*
  %153 = getelementptr inbounds float, float* %152, i32 %linear_index3
  %154 = load float, float* %153, align 4, !invariant.load !38
  %155 = bitcast [784 x [128 x float]]* %5 to float*
  %156 = getelementptr inbounds float, float* %155, i32 %linear_index3
  %157 = load float, float* %156, align 4, !invariant.load !38
  %158 = bitcast [784 x [128 x float]]* %9 to float*
  %159 = getelementptr inbounds float, float* %158, i32 %linear_index3
  %160 = load float, float* %159, align 4
  %161 = bitcast [784 x [128 x float]]* %5 to float*
  %162 = getelementptr inbounds float, float* %161, i32 %linear_index3
  %163 = load float, float* %162, align 4, !invariant.load !38
  %subtract.826 = fsub float %160, %163
  %multiply.1227 = fmul float %subtract.826, %subtract.10
  %add.1328 = fadd float %157, %multiply.1227
  %164 = load float, float* %3, align 4, !invariant.load !38
  %multiply.1529 = fmul float %add.1328, %164
  %165 = bitcast [784 x [128 x float]]* %11 to float*
  %166 = getelementptr inbounds float, float* %165, i32 %linear_index3
  %167 = load float, float* %166, align 4, !invariant.load !38
  %168 = bitcast [784 x [128 x float]]* %9 to float*
  %169 = getelementptr inbounds float, float* %168, i32 %linear_index3
  %170 = load float, float* %169, align 4
  %171 = bitcast [784 x [128 x float]]* %9 to float*
  %172 = getelementptr inbounds float, float* %171, i32 %linear_index3
  %173 = load float, float* %172, align 4
  %multiply.1630 = fmul float %170, %173
  %174 = bitcast [784 x [128 x float]]* %11 to float*
  %175 = getelementptr inbounds float, float* %174, i32 %linear_index3
  %176 = load float, float* %175, align 4, !invariant.load !38
  %subtract.1731 = fsub float %multiply.1630, %176
  %multiply.2032 = fmul float %subtract.1731, %subtract.18
  %add.2133 = fadd float %167, %multiply.2032
  %177 = call float @__nv_sqrtf(float %add.2133)
  %region_0_29_constant_2334 = load float, float* bitcast ([4 x i8]* @27 to float*), align 4
  %add.2535 = fadd float %177, %region_0_29_constant_2334
  %divide.2636 = fdiv float %multiply.1529, %add.2535
  %subtract.2737 = fsub float %154, %divide.2636
  %178 = insertvalue { float, float, float } undef, float %subtract.2737, 0
  %179 = insertvalue { float, float, float } %178, float %add.1328, 1
  %180 = insertvalue { float, float, float } %179, float %add.2133, 2
  %181 = extractvalue { float, float, float } %180, 0
  %182 = bitcast [784 x [128 x float]]* %15 to float*
  %183 = getelementptr inbounds float, float* %182, i32 %linear_index3
  store float %181, float* %183, align 4
  %184 = extractvalue { float, float, float } %180, 1
  %185 = bitcast [784 x [128 x float]]* %17 to float*
  %186 = getelementptr inbounds float, float* %185, i32 %linear_index3
  store float %184, float* %186, align 4
  %187 = extractvalue { float, float, float } %180, 2
  %188 = bitcast [784 x [128 x float]]* %19 to float*
  %189 = getelementptr inbounds float, float* %188, i32 %linear_index3
  store float %187, float* %189, align 4
  br label %fusion_7.in_bounds-after
}

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent inaccessiblememonly nounwind }
attributes #4 = { convergent nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}

!0 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_12, !"kernel", i32 1}
!1 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_12, !"reqntidx", i32 1}
!2 = !{void (i8*, i8*, i8*)* @broadcast_57, !"kernel", i32 1}
!3 = !{void (i8*, i8*, i8*)* @broadcast_57, !"reqntidx", i32 80}
!4 = !{void (i8*, i8*)* @iota_62, !"kernel", i32 1}
!5 = !{void (i8*, i8*)* @iota_62, !"reqntidx", i32 80}
!6 = !{void (i8*, i8*, i8*)* @broadcast_40, !"kernel", i32 1}
!7 = !{void (i8*, i8*, i8*)* @broadcast_40, !"reqntidx", i32 32}
!8 = !{void (i8*, i8*, i8*)* @broadcast_40, !"reqntidy", i32 4}
!9 = !{void (i8*, i8*, i8*, i8*)* @fusion_18, !"kernel", i32 1}
!10 = !{void (i8*, i8*, i8*, i8*)* @fusion_18, !"reqntidx", i32 256}
!11 = !{void (i8*, i8*, i8*, i8*, i8*)* @reduce_75, !"kernel", i32 1}
!12 = !{void (i8*, i8*, i8*, i8*, i8*)* @reduce_75, !"reqntidx", i32 32}
!13 = !{void (i8*, i8*, i8*, i8*)* @input_fusion_reduce, !"kernel", i32 1}
!14 = !{void (i8*, i8*, i8*, i8*)* @input_fusion_reduce, !"reqntidx", i32 160}
!15 = !{void (i8*, i8*, i8*)* @reduce_114, !"kernel", i32 1}
!16 = !{void (i8*, i8*, i8*)* @reduce_114, !"reqntidx", i32 8}
!17 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_22, !"kernel", i32 1}
!18 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_22, !"reqntidx", i32 8}
!19 = !{void (i8*, i8*, i8*, i8*, i8*, i8*)* @input_fusion_reduce_1, !"kernel", i32 1}
!20 = !{void (i8*, i8*, i8*, i8*, i8*, i8*)* @input_fusion_reduce_1, !"reqntidx", i32 32}
!21 = !{void (i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_15, !"kernel", i32 1}
!22 = !{void (i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_15, !"reqntidx", i32 80}
!23 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_25, !"kernel", i32 1}
!24 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_25, !"reqntidx", i32 2}
!25 = !{void (i8*, i8*, i8*)* @reduce_156, !"kernel", i32 1}
!26 = !{void (i8*, i8*, i8*)* @reduce_156, !"reqntidx", i32 5}
!27 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_4, !"kernel", i32 1}
!28 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_4, !"reqntidx", i32 5}
!29 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_1, !"kernel", i32 1}
!30 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_1, !"reqntidx", i32 256}
!31 = !{void (i8*, i8*, i8*, i8*, i8*)* @input_fusion_reduce_2, !"kernel", i32 1}
!32 = !{void (i8*, i8*, i8*, i8*, i8*)* @input_fusion_reduce_2, !"reqntidx", i32 1024}
!33 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_10, !"kernel", i32 1}
!34 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_10, !"reqntidx", i32 32}
!35 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_7, !"kernel", i32 1}
!36 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_7, !"reqntidx", i32 256}
!37 = !{i32 0, i32 1}
!38 = !{}
!39 = !{i32 0, i32 80}
!40 = !{i32 0, i32 8}
!41 = !{i32 0, i32 32}
!42 = !{i32 0, i32 4}
!43 = !{i32 0, i32 256}
!44 = !{i64 4}
!45 = !{i64 1}
!46 = !{i32 0, i32 160}
!47 = distinct !{!47, !48}
!48 = !{!"llvm.loop.vectorize.enable", i1 false}
!49 = distinct !{!49, !48, !50}
!50 = !{!"llvm.loop.unroll.full"}
!51 = distinct !{!51, !48, !50}
!52 = distinct !{!52, !48}
!53 = distinct !{!53, !48, !50}
!54 = distinct !{!54, !48, !50}
!55 = !{i32 0, i32 2}
!56 = !{i32 0, i32 5}
!57 = !{i32 0, i32 1024}
!58 = distinct !{!58, !48, !50}
!59 = distinct !{!59, !48}
!60 = !{i32 0, i32 98}
