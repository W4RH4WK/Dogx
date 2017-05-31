% Bar

## Inline math

Foo $x$ bar $y$ baz $= z$

## Display Math

$$ a^2 + y^2 = \frac{1}{2} $$

## Raw Latex

\begin{align*}
    \text{〈1〉:} && l_2 &= f_1(r_0) \oplus l_0 \\
    \text{〈2〉:} && r_2 &= f_2(f_1(r_0) \oplus l_0) \oplus r_0 \\[-0.8em]
    \cline{1-6}
    \text{〈3〉:} && f_2(l_2) \oplus r_2 &= f_2(l_2) \oplus f_2(f_1(r_0) \oplus l_0) \oplus r_0
    && \text{〈2〉 $\oplus$ with $f_2(l_2)$} \\
    \text{〈4〉:} && f_2(f_1(r_0) \oplus l_0) \oplus r_2 &= f_2(f_1(r_0) \oplus l_0) \oplus f_2(f_1(r_0) \oplus l_0) \oplus r_0
    && \text{expand $l_2$ with 〈1〉} \\
    \text{〈5〉:} && f_2(f_1(r_0) \oplus l_0) \oplus r_2 &= r_0
    && \text{reduce right side} \\
    \text{〈6〉:} && f_1(r_0) \oplus l_2 &= f_1(r_0) \oplus f_1(r_0) \oplus l_0
    && \text{〈1〉 $\oplus$ with $f_1(r_0)$} \\
    \text{〈7〉:} && f_1(r_0) \oplus l_2 &= l_0
    && \text{reduce right side} \\
    \text{〈8〉:} && f_2(f_1(r_0) \oplus f_1(r_0) \oplus l_2) \oplus r_2 &= r_0
    && \text{〈5〉 expand $l_0$ with 〈7〉} \\
    \text{〈9〉:} && f_2(l_2) \oplus r_2 &= r_0
    && \text{reduce left side} \\[-0.8em]
    \cline{1-6}
    && f_1(f_2(l_2) \oplus r_2) \oplus l_2 &= l_0 && \text{〈7〉 expand $r_0$ with 〈9〉} \\
    && f_2(l_2) \oplus r_2 &= r_0 && \text{〈9〉}
\end{align*}

## Tikz

![Tikz Picture](gfx/factorial.tikz)

## Code

```c
#include <stdio.h>
#include <stdlib.h>

int main(void) {
    printf("Hello World\n");
    return EXIT_SUCCESS;
}
```
