target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_7 = external local_unnamed_addr addrspace(1) constant [8 x i8], align 128

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
define void @fusion_5(i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc0, i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc1, i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc2, i8* noalias nocapture readonly align 16 dereferenceable(4) %alloc3, i8* noalias nocapture writeonly align 128 dereferenceable(4) %alloc9, i8* noalias nocapture writeonly align 128 dereferenceable(4) %alloc10, i8* noalias nocapture readnone align 128 dereferenceable(144) %temp_buf) local_unnamed_addr #0 {
entry:
  %alloc1020 = addrspacecast i8* %alloc10 to i8 addrspace(1)*
  %alloc918 = addrspacecast i8* %alloc9 to i8 addrspace(1)*
  %alloc316 = addrspacecast i8* %alloc3 to i8 addrspace(1)*
  %alloc214 = addrspacecast i8* %alloc2 to i8 addrspace(1)*
  %alloc112 = addrspacecast i8* %alloc1 to i8 addrspace(1)*
  %alloc010 = addrspacecast i8* %alloc0 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %.not = icmp eq i32 %0, 1
  %alloc1.alloc3 = select i1 %.not, i8 addrspace(1)* %alloc112, i8 addrspace(1)* %alloc316
  %alloc0.alloc2 = select i1 %.not, i8 addrspace(1)* %alloc010, i8 addrspace(1)* %alloc214
  %1 = bitcast i8 addrspace(1)* %alloc1.alloc3 to float addrspace(1)*
  %2 = bitcast i8 addrspace(1)* %alloc0.alloc2 to float addrspace(1)*
  %3 = load float, float addrspace(1)* %1, align 16, !invariant.load !6
  %compare.10 = fcmp oeq float %3, 0.000000e+00
  %4 = load float, float addrspace(1)* %2, align 16, !invariant.load !6
  %divide.11 = fdiv float %4, %3
  %5 = select i1 %compare.10, float 0.000000e+00, float %divide.11
  %alloc9.sink = select i1 %.not, i8 addrspace(1)* %alloc1020, i8 addrspace(1)* %alloc918
  %6 = bitcast i8 addrspace(1)* %alloc9.sink to float addrspace(1)*
  store float %5, float addrspace(1)* %6, align 128
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define void @fusion_4(i8* noalias nocapture readonly align 16 dereferenceable(8) %alloc4, i8* noalias nocapture readonly align 16 dereferenceable(8) %alloc5, i8* noalias nocapture writeonly align 128 dereferenceable(8) %alloc6, i8* noalias nocapture writeonly align 128 dereferenceable(8) %alloc7, i8* noalias nocapture readnone align 128 dereferenceable(144) %temp_buf) local_unnamed_addr #2 {
entry:
  %alloc710 = addrspacecast i8* %alloc7 to i8 addrspace(1)*
  %alloc68 = addrspacecast i8* %alloc6 to i8 addrspace(1)*
  %alloc56 = addrspacecast i8* %alloc5 to i8 addrspace(1)*
  %alloc44 = addrspacecast i8* %alloc4 to i8 addrspace(1)*
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %.not = icmp eq i32 %0, 1
  %.in.in.in = select i1 %.not, i8 addrspace(1)* %alloc56, i8 addrspace(1)* %alloc44
  %.in.in = bitcast i8 addrspace(1)* %.in.in.in to i64 addrspace(1)*
  %.in = load i64, i64 addrspace(1)* %.in.in, align 16, !invariant.load !6
  %1 = add i64 %.in, 1
  %spec.select = select i1 %.not, i8 addrspace(1)* %alloc710, i8 addrspace(1)* %alloc68
  %2 = bitcast i8 addrspace(1)* %spec.select to i64 addrspace(1)*
  store i64 %1, i64 addrspace(1)* %2, align 128
  ret void
}

attributes #0 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #1 = { nofree nosync nounwind readnone speculatable }
attributes #2 = { mustprogress nofree nosync nounwind willreturn }

!nvvm.annotations = !{!0, !1, !2, !3}
!llvm.module.flags = !{!4}

!0 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_5, !"kernel", i32 1}
!1 = !{void (i8*, i8*, i8*, i8*, i8*, i8*, i8*)* @fusion_5, !"reqntidx", i32 2}
!2 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_4, !"kernel", i32 1}
!3 = !{void (i8*, i8*, i8*, i8*, i8*)* @fusion_4, !"reqntidx", i32 2}
!4 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!5 = !{i32 0, i32 2}
!6 = !{}
