//===- OpenMPLoweringTest.cpp -- OpenMPLowering unit tests ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "gtest/gtest.h"
#include "mlir/Dialect/OpenMP/OpenMPDialect.h"
#include "mlir/IR/Builders.h"
#include "flang/Parser/parse-tree.h"
#include "llvm/Frontend/OpenMP/OMPConstants.h"

class OpenMPLoweringTest : public testing::Test {
protected:
  void SetUp() override {
    ctx.getOrLoadDialect<mlir::omp::OpenMPDialect>();
    mlirOpBuilder.reset(new mlir::OpBuilder(&ctx));
  }

  void TearDown() override { mlirOpBuilder.reset(); }

  mlir::MLIRContext ctx;
  std::unique_ptr<mlir::OpBuilder> mlirOpBuilder;
};

TEST_F(OpenMPLoweringTest, Barrier) {
  // Construct a dummy parse tree node for `!OMP barrier`.
  struct Fortran::parser::OmpSimpleStandaloneDirective barrierDirective(
      llvm::omp::Directive::OMPD_barrier);

  // Check and lower the `!OMP barrier` node to `BarrierOp` operation of
  // OpenMPDialect.
  EXPECT_EQ(barrierDirective.v, llvm::omp::Directive::OMPD_barrier);
  auto barrierOp = mlirOpBuilder->create<mlir::omp::BarrierOp>(
      mlirOpBuilder->getUnknownLoc());

  EXPECT_EQ(barrierOp.getOperationName(), "omp.barrier");
  EXPECT_EQ(succeeded(barrierOp.verify()), true);
}

TEST_F(OpenMPLoweringTest, TaskWait) {
  // Construct a dummy parse tree node for `!OMP taskwait`.
  struct Fortran::parser::OmpSimpleStandaloneDirective taskWaitDirective(
      llvm::omp::Directive::OMPD_taskwait);

  // Check and lower the `!OMP taskwait` node to `TaskwaitOp` operation of
  // OpenMPDialect.
  EXPECT_EQ(taskWaitDirective.v, llvm::omp::Directive::OMPD_taskwait);
  auto taskWaitOp = mlirOpBuilder->create<mlir::omp::TaskwaitOp>(
      mlirOpBuilder->getUnknownLoc());

  EXPECT_EQ(taskWaitOp.getOperationName(), "omp.taskwait");
  EXPECT_EQ(succeeded(taskWaitOp.verify()), true);
}

TEST_F(OpenMPLoweringTest, TaskYield) {
  // Construct a dummy parse tree node for `!OMP taskyield`.
  struct Fortran::parser::OmpSimpleStandaloneDirective taskYieldDirective(
      llvm::omp::Directive::OMPD_taskyield);

  // Check and lower the `!OMP taskyield` node to `TaskYieldOp` operation of
  // OpenMPDialect.
  EXPECT_EQ(taskYieldDirective.v, llvm::omp::Directive::OMPD_taskyield);
  auto taskYieldOp = mlirOpBuilder->create<mlir::omp::TaskyieldOp>(
      mlirOpBuilder->getUnknownLoc());

  EXPECT_EQ(taskYieldOp.getOperationName(), "omp.taskyield");
  EXPECT_EQ(succeeded(taskYieldOp.verify()), true);
}

TEST_F(OpenMPLoweringTest, EmptyParallel) {
  // Construct a dummy parse tree node for `!OMP parallel`.
  struct Fortran::parser::OmpSimpleStandaloneDirective parallelDirective(
      llvm::omp::Directive::OMPD_parallel);

  // Check and lower the `!OMP parallel` node to `ParallelOp` operation of
  // OpenMPDialect.
  EXPECT_EQ(parallelDirective.v, llvm::omp::Directive::OMPD_parallel);
  auto insertPt = mlirOpBuilder->saveInsertionPoint();
  llvm::ArrayRef<mlir::Type> argTy;
  mlir::ValueRange range;
  llvm::SmallVector<int32_t, 6> operandSegmentSizes(6 /*Size=*/, 0 /*Value=*/);
  // create and insert the operation.
  auto parallelOp = mlirOpBuilder->create<mlir::omp::ParallelOp>(
      mlirOpBuilder->getUnknownLoc(), argTy, range);
  parallelOp.setAttr(mlir::omp::ParallelOp::getOperandSegmentSizeAttr(),
      mlirOpBuilder->getI32VectorAttr(operandSegmentSizes));
  parallelOp.getRegion().push_back(new mlir::Block{});
  auto &block = parallelOp.getRegion().back();
  mlirOpBuilder->setInsertionPointToStart(&block);
  // ensure the block is well-formed.
  mlirOpBuilder->create<mlir::omp::TerminatorOp>(
      mlirOpBuilder->getUnknownLoc());
  mlirOpBuilder->restoreInsertionPoint(insertPt);
  EXPECT_EQ(succeeded(parallelOp.verify()), true);
}

// main() from gtest_main
