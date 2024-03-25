`````
Nth-Fib(int i)
    int a = 0
    int b = 1
    while i > 0
        c = a
        a = b
        b = b + c
        i = i - 1
    return a
`````