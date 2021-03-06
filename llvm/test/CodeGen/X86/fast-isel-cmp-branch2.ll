; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s                             -mtriple=x86_64-apple-darwin10 | FileCheck %s
; RUN: llc < %s -fast-isel -fast-isel-abort=1 -mtriple=x86_64-apple-darwin10 | FileCheck %s

define i32 @fcmp_oeq(float %x, float %y) {
; CHECK-LABEL: fcmp_oeq:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jne LBB0_1
; CHECK-NEXT:    jp LBB0_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB0_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp oeq float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ogt(float %x, float %y) {
; CHECK-LABEL: fcmp_ogt:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jbe LBB1_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB1_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ogt float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_oge(float %x, float %y) {
; CHECK-LABEL: fcmp_oge:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jb LBB2_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB2_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp oge float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_olt(float %x, float %y) {
; CHECK-LABEL: fcmp_olt:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm0, %xmm1
; CHECK-NEXT:    jbe LBB3_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB3_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp olt float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ole(float %x, float %y) {
; CHECK-LABEL: fcmp_ole:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm0, %xmm1
; CHECK-NEXT:    jb LBB4_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB4_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ole float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_one(float %x, float %y) {
; CHECK-LABEL: fcmp_one:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    je LBB5_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB5_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp one float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ord(float %x, float %y) {
; CHECK-LABEL: fcmp_ord:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jp LBB6_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB6_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ord float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_uno(float %x, float %y) {
; CHECK-LABEL: fcmp_uno:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jp LBB7_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB7_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = fcmp uno float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ueq(float %x, float %y) {
; CHECK-LABEL: fcmp_ueq:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    je LBB8_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB8_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ueq float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ugt(float %x, float %y) {
; CHECK-LABEL: fcmp_ugt:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm0, %xmm1
; CHECK-NEXT:    jae LBB9_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB9_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ugt float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_uge(float %x, float %y) {
; CHECK-LABEL: fcmp_uge:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm0, %xmm1
; CHECK-NEXT:    ja LBB10_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB10_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp uge float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ult(float %x, float %y) {
; CHECK-LABEL: fcmp_ult:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jae LBB11_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB11_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ult float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_ule(float %x, float %y) {
; CHECK-LABEL: fcmp_ule:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    ja LBB12_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB12_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp ule float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @fcmp_une(float %x, float %y) {
; CHECK-LABEL: fcmp_une:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    ucomiss %xmm1, %xmm0
; CHECK-NEXT:    jne LBB13_2
; CHECK-NEXT:    jnp LBB13_1
; CHECK-NEXT:  LBB13_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB13_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = fcmp une float %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_eq(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_eq:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    je LBB14_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB14_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = icmp eq i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_ne(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_ne:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    je LBB15_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB15_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = icmp ne i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_ugt(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_ugt:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jbe LBB16_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB16_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = icmp ugt i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_uge(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_uge:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jae LBB17_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB17_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = icmp uge i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_ult(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_ult:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jae LBB18_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB18_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = icmp ult i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_ule(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_ule:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jbe LBB19_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB19_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = icmp ule i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_sgt(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_sgt:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jle LBB20_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB20_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = icmp sgt i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_sge(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_sge:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jge LBB21_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB21_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = icmp sge i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_slt(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_slt:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jge LBB22_1
; CHECK-NEXT:  ## %bb.2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB22_1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
  %1 = icmp slt i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

define i32 @icmp_sle(i32 %x, i32 %y) {
; CHECK-LABEL: icmp_sle:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpl %esi, %edi
; CHECK-NEXT:    jle LBB23_2
; CHECK-NEXT:  ## %bb.1: ## %bb2
; CHECK-NEXT:    movl $1, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  LBB23_2: ## %bb1
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = icmp sle i32 %x, %y
  br i1 %1, label %bb1, label %bb2
bb2:
  ret i32 1
bb1:
  ret i32 0
}

