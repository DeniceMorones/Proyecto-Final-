from tkinter import *
from tkinter import filedialog

window = Tk()
window.title('Decodificador')
window.geometry("700x500")
window.config(background="white")

binaryInstructions = StringVar()
binaryInstructions.set("")
assemblyInstructions = StringVar()
assemblyInstructions.set("")

def browseFiles():
    global filename
    filename = filedialog.askopenfilename(initialdir = "./Proyecto-Final-/DecodificadorPython",
                                          title = "Select a File",
                                          filetypes = (("Assembly files",
                                                        "*.asm*"),
                                                        ("Text files",
                                                        "*.txt*"),
                                                       ("all files",
                                                        "*.*")))
      
    label_file_explorer.configure(text="Archivo elegido: " + filename)

def registro(reg):
    return f"{int(reg.replace('$', '')):05b}"#Convierte un registro en su representante numérico.

def instruccionesTipoR():
    biInstructions = ""
    asmInstructions = ""
    funct = {
        'add': '100000',
        'sub': '100010',
        'and': '100100',
        'or': '100101',
        'slt': '101010',
    } #diccionario de las funciones 
    opcode = '000000'  # opcode es siempre 000000 para instrucciones tipo R

    try:
        with open(filename, 'r') as archivo:#funcion para leer el archivo
            lineas = archivo.readlines()
    except FileNotFoundError:
        print("El archivo especificado no se encontró." + filename)#funcion en caso de no encontrar el archivo
    
    try:
        with open('./Proyecto-Final-/DataPathVerilog/intruciones_r.txt', 'w') as instrucciones:#funcion para escribir y ordenar el codigo binario que va al txt
            for linea in lineas:
                asmInstructions = asmInstructions + linea
                partes = linea.split()
                if len(partes) != 4:
                    continue
                instruccion, rd, rs, rt = partes
                if instruccion in funct:
                    rs = registro(rs)
                    rt = registro(rt)
                    rd = registro(rd)
                    shamt = '00000'
                    funcion = funct[instruccion]
                    instruccion_binaria = f"{opcode}{rs}{rt}{rd}{shamt}{funcion}"
                    biInstructions = biInstructions + instruccion_binaria + '\n'
            instrucciones.write(biInstructions)
            assemblyInstructions.set(asmInstructions)
            binaryInstructions.set(biInstructions)
            print(assemblyInstructions.get())
            print(binaryInstructions.get())

    except FileNotFoundError:
        print("El archivo especificado a escribir no se encontró.")#funcion en caso de no encontrar el archivo

instructions_frame = Frame(window, background="white")

label_file_explorer = Label(window,
                            text="Archivo elegido:",
                            width=100, height=5,
                            fg="blue",
                            background="white")
  
button_explore = Button(window,
                        text="Buscar archivo",
                        command=browseFiles)
  
button_R = Button(window,
                  text="Generar instrucciones tipo R",
                  command=instruccionesTipoR)

button_exit = Button(window,
                     text="Salir",
                     command=exit)

label_assembly_instructions = Label(instructions_frame,
                                    textvariable=assemblyInstructions,
                                    width=50, height=12,
                                    fg="blue",
                                    background="white",
                                    anchor='nw', justify='left')

label_binary_instructions = Label(instructions_frame,
                                  textvariable=binaryInstructions,
                                  width=50, height=12,
                                  fg="blue",
                                  background="white",
                                  anchor='nw', justify='left')

label_file_explorer.grid(column=0, row=0, columnspan=3, sticky='w')
button_explore.grid(column=0, row=1, columnspan=3, sticky='ew')
button_R.grid(column=0, row=2, columnspan=3, sticky='ew')
button_exit.grid(column=0, row=3, columnspan=3, sticky='ew')
instructions_frame.grid(column=0, row=4, columnspan=3, sticky='ew')

label_assembly_instructions.grid(column=0, row=0, sticky='nw', padx=(200, 0), pady=(10, 10))
label_binary_instructions.grid(column=1, row=0, sticky='nw', padx=(0, 100), pady=(10, 10))

instructions_frame.grid_columnconfigure(0, weight=1)
instructions_frame.grid_columnconfigure(1, weight=1)

window.grid_columnconfigure(0, weight=1)

window.mainloop()
