
#include <gtest/gtest.h>
#include <yana/rdfsa.h>

TEST(rdfsa, array_empty) {
  int* a = NULL;
  EXPECT_EQ(0, rdfsa(a, 0));
}

TEST(rdfsa, array_one_element) {
  int a[1] = {1};
  EXPECT_EQ(1, rdfsa(a, 1));
  rdfsa_print(a, 1);
}

TEST(rdfsa, array_two_elements_diff) {
  int a[2] = {1, 2};
  EXPECT_EQ(2, rdfsa(a, 2));
  rdfsa_print(a, 2);
}

TEST(rdfsa, array_two_elements_same) {
  int a[2] = {1, 1};
  EXPECT_EQ(1, rdfsa(a, 2));
  rdfsa_print(a, 2);
}

TEST(rdfsa, array_three_elements_diff) {
  int a[3] = {1, 2, 3};
  EXPECT_EQ(3, rdfsa(a, 3));
  rdfsa_print(a, 3);
}

TEST(rdfsa, array_three_elements_diff2) {
  int a[3] = {1, 2, 2};
  EXPECT_EQ(2, rdfsa(a, 3));
  rdfsa_print(a, 3);
}

TEST(rdfsa, array_three_elements_same) {
  int a[3] = {1, 1, 1};
  EXPECT_EQ(1, rdfsa(a, 3));
  rdfsa_print(a, 3);
}

TEST(rdfsa, array_four_elements_diff) {
  int a[4] = {6, 9, 100, 200};
  EXPECT_EQ(4, rdfsa(a, 4));
  rdfsa_print(a, 4);
}

TEST(rdfsa, array_four_elements_diff2) {
  int a[4] = {1, 2, 3, 3};
  EXPECT_EQ(3, rdfsa(a, 4));
  rdfsa_print(a, 4);
}

TEST(rdfsa, array_four_elements_diff3) {
  int a[4] = {-1, 234, 234, 789};
  EXPECT_EQ(3, rdfsa(a, 4));
  rdfsa_print(a, 4);
}

TEST(rdfsa, array_four_elements_same) {
  int a[4] = {1, 1, 1, 1};
  // rdfsa_print(a, 4);
  EXPECT_EQ(1, rdfsa(a, 4));
  rdfsa_print(a, 4);
}
