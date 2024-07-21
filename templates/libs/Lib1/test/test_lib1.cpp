#include <gtest/gtest.h>
// Define a test fixture class
class QueueTest : public ::testing::Test {
protected:
  // You can remove any or all of the following functions if their bodies would
  // be empty.

  QueueTest() {
    // You can do set-up work for each test here.
  }

  ~QueueTest() override {
    // You can do clean-up work that doesn't throw exceptions here.
  }

  void SetUp() override {
    // Code here will be called immediately after the constructor (right before
    // each test).
  }

  void TearDown() override {
    // Code here will be called immediately after each test (right
    // before the destructor).
  }
};

// Test cases using the test fixture
TEST_F(QueueTest, InitProbably) {}
