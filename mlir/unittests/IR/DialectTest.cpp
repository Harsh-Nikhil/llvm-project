//===- DialectTest.cpp - Dialect unit tests -------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/Dialect.h"
#include "gtest/gtest.h"

using namespace mlir;
using namespace mlir::detail;

namespace {
struct TestDialect : public Dialect {
  static StringRef getDialectNamespace() { return "test"; };
  TestDialect(MLIRContext *context)
      : Dialect(getDialectNamespace(), context, TypeID::get<TestDialect>()) {}
};
struct AnotherTestDialect : public Dialect {
  static StringRef getDialectNamespace() { return "test"; };
  AnotherTestDialect(MLIRContext *context)
      : Dialect(getDialectNamespace(), context,
                TypeID::get<AnotherTestDialect>()) {}
};

TEST(DialectDeathTest, MultipleDialectsWithSameNamespace) {
  MLIRContext context(false);

  // Registering a dialect with the same namespace twice should result in a
  // failure.
  context.getOrLoadDialect<TestDialect>();
  ASSERT_DEATH(context.getOrLoadDialect<AnotherTestDialect>(), "");
}

} // end namespace
