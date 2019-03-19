# Welcome to MkDocs

For full documentation visit [mkdocs.org](http://mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

## Project layout

- mkdocs.yml    # The configuration file.
- docs/
- index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

!!! tip
	These packages can also be used individually


## Lua 

```lua
local r = clrAlarm("1031”, “pmd");
local r= clrAlarm("1031”, “pmd”, “additional");
if r.Retn ~= “0000” then
   logf("Retn=%s, Desc=%s”, r.Retn, r.Desc)
end
```

## C

```c
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
```

## Table

| Tables        | Are           | Cool  |
| ------------- |---------------| ------|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |


```flow
st=>start: Start:>http://www.google.com[blank]
e=>end:>http://www.google.com
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes
or No?:>http://www.google.com
io=>inputoutput: catch something...
st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1
```

```sequence
Title: Here is a title
A->B: Normal line
B-->C: Dashed line
C->>D: Open arrow
D-->>A: Dashed open arrow
```

```flow
st=>start: Start|past:>http://www.google.com[blank]
e=>end: End|future:>http://www.google.com
op1=>operation: My Operation|past
op2=>operation: Stuff|current
sub1=>subroutine: My Subroutine|invalid
cond=>condition: Yes
or No?|approved:>http://www.google.com
c2=>condition: Good idea|rejected
io=>inputoutput: catch something...|future

st->op1(right)->cond
cond(yes, right)->c2
cond(no)->sub1(left)->op1
c2(yes)->io->e
c2(no)->op2->e
```

