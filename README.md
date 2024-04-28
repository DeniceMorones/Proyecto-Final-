
# Procesador MIPS 💻
**De las siglas MIPS (siglas de Microprocessor without Interlocked Pipeline Stages)** se le conoce a toda una familia de microprocesadores de arquitectura RISC.

La longitud de sus instrucciones son de 32 bits, y su largo de palabra siempre será de 4 bits (4^8).

## Set de instrucciones 🗒️
**¿Cuáles son las instrucciones más comunes en MIPS?:**

-  Instrucciones aritméticas: ADD, SUB, MUL, DIV
-  Instrucciones lógicas: AND, OR, XOR, NOR
-  Instrucciones de transferencia de datos: LW (Load Word), SW (Store Word)
-  Instrucciones de salto: J (Jump), JAL (Jump and Link)
-  Instrucciones de comparación: SLT (Set Less Than), BEQ (Branch if Equal)

**Características de los Tipos de instrucciones (R, I, J):**

-  R-Type: Son instrucciones que involucran tres registros y se utilizan para operaciones aritméticas y lógicas. Tienen un formato de 6 campos.

- I-Type: Estas instrucciones usan dos registros y un valorinmediato. Se utilizan principalmente para operaciones de transferencia de datos y comparación. Tienen un formato de 4 campos.
- J-Type: Son instrucciones de salto incondicional. Utilizan una dirección de destino y tienen un formato de 2 campos.

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/165964044/e80b69c9-a505-46d6-b221-64c1e6c2921b)


# Proyecto Final

Procesador de instrucciones MIPS que decodificará mediante el lenguaje de programacion Python&reg; instrucciones de de lenguaje ensamblador para convertirlas a **Tipo R, Tipo I y Tipo J** y ejecutarlas en el Lenguaje de Descripcion de Hardware Verilog&reg;.

Comenzando con el DataPath basandonos en el siguiente diagrama:

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/165964044/1fc0d74c-0fdf-48e3-bb35-d91b7660de6e)

El decodificador es un programa hecho con Python utilizando la librería tkinter para crear un interfaz intuitivo para el usuario.
En este programa podemos seleccionar cualquier archivo .asm de nuestro PC para posteriormente decodificar las instrucciones tipo R que este contenga. Esto se hace mediante la lectura de un archivo guardando su ruta, la lectura del archivo se hace por líneas, posteriormente crea un archivo de texto instrucciones_r.txt en modo escritura para que se le permita añadir datos.
Las instrucciones de las líneas leídas se separan por partes, las instrucciones cambian a binario y el diccionario decodifica la función, se terminan de procesar todas las instrucciones y se almacenan en el archivo de tipo texto.




