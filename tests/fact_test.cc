
#include <string.h>
#include <gtest/gtest.h>


unsigned long 
fact(int n) 
{
    if (n <= 0 || n == 1) {
      return 1;
    }

    return n * fact(n - 1);
}


TEST(fact, zero) {

    EXPECT_EQ(1, fact(0));
}


TEST(fact, one) {

    EXPECT_EQ(1, fact(1));
}


TEST(fact, negative) {

    EXPECT_EQ(1, fact(-1));
}


TEST(fact, positive) {

    EXPECT_EQ(2, fact(2));
}


TEST(fact, three) {

    EXPECT_EQ(6, fact(3));
}




