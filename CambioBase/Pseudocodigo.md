``````````
CambioDeBase(int n,int a):
    int N = n
    int A = a
    arr_ptr = direccion en memoria de un array donde se guardaran los numeros
    arr_offset = 0  //coincide con el tamano del array, senala a la posicion siguiente a la ultima posicion de memoria de arr_ptr
    si N es 0:
        print N
        return 
    while N > 0:
        arr_ptr[arr_offset] = N % A
        arr_offset = arr_offset + 1
        N = N / A
    while arr_offset > 0:
        arr_offset = arr_offset - 1
        print arr_ptr[arr_offset]
``````````
# Suposiciones:
- N es un valor de 32 bits sin signo
- A es un valor en el intervalo [2,37] para poder imprimirlo usando caracteres 0...9,a..z
- arr_ptr almacena bytes