
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
- I-Type: Estas instrucciones usan dos registros y un valor inmediato. Se utilizan principalmente para operaciones de transferencia de datos y comparación. Tienen un formato de 4 campos.
- J-Type: Son instrucciones de salto incondicional. Utilizan una dirección de destino y tienen un formato de 2 campos.

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/165964044/e80b69c9-a505-46d6-b221-64c1e6c2921b)


# Proyecto Final

Procesador de instrucciones MIPS que decodificará mediante el lenguaje de programacion Python&reg; instrucciones de de lenguaje ensamblador para convertirlas a **Tipo R, Tipo I y Tipo J** y ejecutarlas en el Lenguaje de Descripcion de Hardware Verilog&reg;.

Comenzando con el DataPath basandonos en el siguiente diagrama:

![WhatsApp Image 2024-05-20 at 1 27 45 AM](https://github.com/DeniceMorones/Proyecto-Final-/assets/167491829/95c91c5a-0e92-4a88-8ee6-e78038f5d8a5)

## Decodificador 👨‍💻

El decodificador es un programa hecho con Python&reg; utilizando la librería **tkinter** para crear un interfaz intuitivo para el usuario.
En este programa podemos seleccionar cualquier archivo .asm de nuestro PC para posteriormente decodificar las instrucciones tipo R,I y J  que este contenga. Esto se hace mediante la lectura de un archivo guardando su ruta, la lectura del archivo se hace por líneas, posteriormente crea un archivo de texto instrucciones_r.txt en modo escritura para que se le permita añadir datos.
Las instrucciones de las líneas leídas se separan por partes de 8 en 8 dandonos una intruccion completa en 4 lineas, las instrucciones cambian a binario y el diccionario decodifica la función, se terminan de procesar todas las instrucciones y se almacenan en el archivo de tipo texto.
ademas es capaz de guardar el archivo decodificado con otro nombre en especifico, y pues crear archivos para elñ banco de registros o la memoria 

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/167491829/b31cc4d2-27b9-44fb-8388-99d2eea52a00)

**Archivo de las instrucciones dentro de la carpeta de "Decodificador"**

![Add a little bit of body text](https://github.com/DeniceMorones/Proyecto-Final-/assets/165964044/2f7e6d92-e814-432f-abab-44bfebb8e98b) 

# Fase 1.2

Procesador single datapath de MIPS para la ejecucionde intrucciones tipo R, el cual utiliza un solo camino para la transferencia de datos dentro del procesador, en otras palabras que consta de una ruta única.

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/167491829/187fac50-a40b-41fe-a526-10fe7c022864)

## Decodificador 👨‍💻

Mejoramos el decodificador para lograr la edicion de las intrucciones asi como una busqueda en los archivos de nuestro computador ademas de las nuevas opciones guardar y guardar como, este ya logra manejar instrucciones I, R y J, además de buscar el archivo por todas las carpetas, al guardar se guarda automáticamente en el DataPath de verilog con el nombre de **Instrucciones Tipo R**. 

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/167491829/104172dd-b7c0-4cec-b830-e924eaf2506a)


## Instrucciones ⌨️

Las instruciones enviadas al archivo .txt ahora se muestran divididas en 8 bits por lo que cada 4 lineas tiene una intruccion.

![image](https://github.com/DeniceMorones/Proyecto-Final-/assets/167491829/2043bd28-364e-4ca6-ab61-c5fde7694d92)


