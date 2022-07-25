target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_12 = external local_unnamed_addr addrspace(1) constant [8 x i8], align 128

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define void @add_13(i8* noalias nocapture readonly align 16 dereferenceable(8) %alloc4, i8* noalias nocapture writeonly align 128 dereferenceable(8) %alloc5, i8* noalias nocapture readnone align 128 dereferenceable(16) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc53 = addrspacecast i8* %alloc5 to i8 addrspace(1)*
  %alloc41 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %0 = bitcast i8 addrspace(1)* %alloc53 to i64 addrspace(1)*
  %1 = bitcast i8 addrspace(1)* %alloc41 to i64 addrspace(1)*
  %2 = load i64, i64 addrspace(1)* %1, align 16, !invariant.load !5
  %3 = add i64 %2, 1
  store i64 %3, i64 addrspace(1)* %0, align 128
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_2(i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc0, i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc1, i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc2, i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc3, i8* noalias nocapture writeonly align 128 dereferenceable(4) %alloc7, i8* noalias nocapture writeonly align 128 dereferenceable(4) %alloc8, i8* noalias nocapture readnone align 128 dereferenceable(16) %temp_buf) local_unnamed_addr #2 {
entry:
  %alloc820 = addrspacecast i8* %alloc8 to i8 addrspace(1)*
  %alloc718 = addrspacecast i8* %alloc7 to i8 addrspace(1)*
  %alloc316 = addrspacecast i8* %alloc3 to i8 addrspace(1)*
  %alloc214 = addrspacecast i8* %alloc2 to i8 addrspace(1)*
  %alloc112 = addrspacecast i8* %alloc1 to i8 addrspace(1)*
  %alloc010 = addrspacecast i8* %alloc0 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !6
  %.not = icmp eq i32 %0, 1
  %alloc3.alloc1 = select i1 %.not, i8 addrspace(1)* %alloc316, i8 addrspace(1)* %alloc112
  %alloc2.alloc0 = select i1 %.not, i8 addrspace(1)* %alloc214, i8 addrspace(1)* %alloc010
  %1 = bitcast i8 addrspace(1)* %alloc3.alloc1 to float addrspace(1)*
  %2 = bitcast i8 addrspace(1)* %alloc2.alloc0 to float addrspace(1)*
  %3 = load float, float addrspace(1)* %1, align 16, !invariant.load !5
  %compare.10 = fcmp oeq float %3, 0.000000e+00
  %4 = load float, float addrspace(1)* %2, align 16, !invariant.load !5
  %divide.11 = fdiv float %4, %3
  %5 = select i1 %compare.10, float 0.000000e+00, float %divide.11
  %alloc7.sink = select i1 %.not, i8 addrspace(1)* %alloc820, i8 addrspace(1)* %alloc718
  %6 = bitcast i8 addrspace(1)* %alloc7.sink to float addrspace(1)*
  store float %5, float addrspace(1)* %6, align 128
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn }
attributes #1 = { nofree nosync nounwind readnone speculatable }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{void (i8*, i8*, i8*)* @add_13, !"kernel", i32 1}
!1 = !{void (i8*, i8*, i8*)* @add_13, !"reqntidx", i32 1}
!2 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_2, !"kernel", i32 1}
!3 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_2, !"reqntidx", i32 2}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{}
!6 = !{i32 0, i32 2}
