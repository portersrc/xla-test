target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_7 = constant [8 x i8] c"\01\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] zeroinitializer

define void @fusion_5(i8* noalias align 16 dereferenceable(4) %alloc0, i8* noalias align 16 dereferenceable(4) %alloc1, i8* noalias align 16 dereferenceable(4) %alloc2, i8* noalias align 16 dereferenceable(4) %alloc3, i8* noalias align 128 dereferenceable(4) %alloc9, i8* noalias align 128 dereferenceable(4) %alloc10, i8* noalias align 128 dereferenceable(144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc2, i64 0
  %1 = bitcast i8* %0 to float*
  %2 = getelementptr inbounds i8, i8* %alloc3, i64 0
  %3 = bitcast i8* %2 to float*
  %4 = getelementptr inbounds i8, i8* %alloc0, i64 0
  %5 = bitcast i8* %4 to float*
  %6 = getelementptr inbounds i8, i8* %alloc1, i64 0
  %7 = bitcast i8* %6 to float*
  %8 = getelementptr inbounds i8, i8* %alloc9, i64 0
  %9 = bitcast i8* %8 to [1 x float]*
  %10 = getelementptr inbounds i8, i8* %alloc10, i64 0
  %11 = bitcast i8* %10 to [1 x float]*
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %14 = mul nuw nsw i32 %12, 2
  %linear_index = add nuw nsw i32 %14, %13
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %15 = udiv i32 %linear_index, 1
  %16 = icmp ult i32 %linear_index, 2
  br i1 %16, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %slice1-after, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %17 = phi i32 [ 0, %concatenate.pivot.0. ]
  %18 = sub nsw i32 %15, %17
  %19 = load float, float* %3, align 4, !invariant.load !6
  %region_0_18_constant_5 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %compare.6 = fcmp oeq float %19, %region_0_18_constant_5
  %20 = zext i1 %compare.6 to i8
  %region_0_18_constant_51 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %21 = load float, float* %1, align 4, !invariant.load !6
  %22 = load float, float* %3, align 4, !invariant.load !6
  %divide.7 = fdiv float %21, %22
  %23 = trunc i8 %20 to i1
  %24 = select i1 %23, float %region_0_18_constant_51, float %divide.7
  br label %concatenate.14.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.4
  %25 = phi i32 [ 1, %concatenate.pivot.1.4 ]
  %26 = sub nsw i32 %15, %25
  %27 = load float, float* %7, align 4, !invariant.load !6
  %region_0_18_constant_52 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %compare.10 = fcmp oeq float %27, %region_0_18_constant_52
  %28 = zext i1 %compare.10 to i8
  %region_0_18_constant_53 = load float, float* bitcast ([4 x i8]* @0 to float*), align 4
  %29 = load float, float* %5, align 4, !invariant.load !6
  %30 = load float, float* %7, align 4, !invariant.load !6
  %divide.11 = fdiv float %29, %30
  %31 = trunc i8 %28 to i1
  %32 = select i1 %31, float %region_0_18_constant_53, float %divide.11
  br label %concatenate.14.merge

concatenate.pivot.1.:                             ; preds = %fusion_5.in_bounds-true
  %33 = icmp ult i32 %15, 1
  br i1 %33, label %concatenate.pivot.0., label %concatenate.pivot.1.4

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.4:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.14.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %34 = phi float [ %24, %concat_index_from_operand_id0 ], [ %32, %concat_index_from_operand_id1 ]
  %35 = icmp sge i32 %15, 0
  %36 = icmp slt i32 %15, 1
  %37 = and i1 %35, %36
  br i1 %37, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.14.merge
  %38 = icmp sge i32 %15, 1
  %39 = icmp slt i32 %15, 2
  %40 = and i1 %38, %39
  br i1 %40, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_5.in_bounds-after

slice0-true:                                      ; preds = %concatenate.14.merge
  %41 = sub i32 %15, 0
  %42 = getelementptr inbounds [1 x float], [1 x float]* %9, i32 0, i32 0
  store float %34, float* %42, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %43 = sub i32 %15, 1
  %44 = getelementptr inbounds [1 x float], [1 x float]* %11, i32 0, i32 0
  store float %34, float* %44, align 4
  br label %slice1-after
}

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

define void @fusion_4(i8* noalias align 16 dereferenceable(8) %alloc4, i8* noalias align 16 dereferenceable(8) %alloc5, i8* noalias align 128 dereferenceable(8) %alloc6, i8* noalias align 128 dereferenceable(8) %alloc7, i8* noalias align 128 dereferenceable(144) %temp_buf) {
entry:
  %0 = getelementptr inbounds i8, i8* %alloc4, i64 0
  %1 = bitcast i8* %0 to i64*
  %2 = getelementptr inbounds i8, i8* %alloc5, i64 0
  %3 = bitcast i8* %2 to i64*
  %4 = getelementptr inbounds i8, i8* %alloc6, i64 0
  %5 = bitcast i8* %4 to [1 x i64]*
  %6 = getelementptr inbounds i8, i8* %alloc7, i64 0
  %7 = bitcast i8* %6 to [1 x i64]*
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %10 = mul nuw nsw i32 %8, 2
  %linear_index = add nuw nsw i32 %10, %9
  %linear_index_in_range = icmp ult i32 %linear_index, 2
  call void @llvm.assume(i1 %linear_index_in_range)
  %11 = udiv i32 %linear_index, 1
  %12 = icmp ult i32 %linear_index, 2
  br i1 %12, label %fusion_4.in_bounds-true, label %fusion_4.in_bounds-after

fusion_4.in_bounds-after:                         ; preds = %slice1-after, %entry
  ret void

fusion_4.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %13 = phi i32 [ 0, %concatenate.pivot.0. ]
  %14 = sub nsw i32 %11, %13
  %15 = load i64, i64* %1, align 8, !invariant.load !6
  %16 = load i64, i64* bitcast ([8 x i8]* @buffer_for_constant_7 to i64*), align 8, !invariant.load !6
  %17 = add i64 %15, %16
  br label %concatenate.9.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %18 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %19 = sub nsw i32 %11, %18
  %20 = load i64, i64* %3, align 8, !invariant.load !6
  %21 = load i64, i64* bitcast ([8 x i8]* @buffer_for_constant_7 to i64*), align 8, !invariant.load !6
  %22 = add i64 %20, %21
  br label %concatenate.9.merge

concatenate.pivot.1.:                             ; preds = %fusion_4.in_bounds-true
  %23 = icmp ult i32 %11, 1
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.9.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi i64 [ %17, %concat_index_from_operand_id0 ], [ %22, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %11, 0
  %26 = icmp slt i32 %11, 1
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.9.merge
  %28 = icmp sge i32 %11, 1
  %29 = icmp slt i32 %11, 2
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_4.in_bounds-after

slice0-true:                                      ; preds = %concatenate.9.merge
  %31 = sub i32 %11, 0
  %32 = getelementptr inbounds [1 x i64], [1 x i64]* %5, i32 0, i32 0
  store i64 %24, i64* %32, align 8
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %11, 1
  %34 = getelementptr inbounds [1 x i64], [1 x i64]* %7, i32 0, i32 0
  store i64 %24, i64* %34, align 8
  br label %slice1-after
}

attributes #0 = { nounwind readnone speculatable }
attributes #1 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_5, !"kernel", i32 1}
!1 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_5, !"reqntidx", i32 2}
!2 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_4, !"kernel", i32 1}
!3 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_4, !"reqntidx", i32 2}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 2}
!6 = !{}
