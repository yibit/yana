
#include "tap.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


int
main(int argc, char *argv[])
{
    /* plan_no_plan(); */
    plan_tests(5);
    is(1, 1);
    is_int(2, 2);
    is_true(true);
    is_string("test", "test");
    ok(3 == 3, "3 == 3", "ok");

    return 0;
}


