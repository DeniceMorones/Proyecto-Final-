from tkinter import *
from tkinter import messagebox
from tkinter import filedialog

def openFile():
    global path
    path = filedialog.askopenfilename(initialdir = "./",
                                          title = "Selecciona un archivo",
                                          filetypes = [("Archivos de ensamblador", "*.asm*"),
                                                       ("Archivos de texto", "*.txt*"),
                                                       ("Todos los archivos", "*.*")])
      
    label_file_explorer.configure(text="Archivo elegido: " + path)

    if path:
        try:
            with open(path, "r") as file:
                editor.delete(1.0, END)
                editor.insert(1.0, file.read())
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo abrir el archivo: {path}")
    return None

def saveFile():
    try:
        if path:
            try:
                textContent = editor.get(1.0, END)
                with open(path, "w") as file:
                    file.write(textContent)
                messagebox.showinfo("Guardado", f"El archivo se guardo correctamente en la direccion: {path}")
            except Exception as e:
                messagebox.showerror("Error", f"No se pudo guardar el archivo: {e}")
    except:
        messagebox.showerror("Error", "No hay ningún archivo seleccionado para guardar")
    return None

def saveFileAs():
    global path
    path = filedialog.asksaveasfilename(defaultextension=".txt",
                                            filetypes=[("Archivos de texto", "*.txt*"),
                                                       ("Archivos de ensamblador", "*.asm*"),
                                                       ("Todos los archivos", "*.*")])
    
    label_file_explorer.configure(text="Archivo elegido: " + path)

    if path:
        try:
            contenido_texto = editor.get(1.0, END)
            with open(path, "w") as archivo:
                archivo.write(contenido_texto)
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo guardar el archivo: {e}")

def toBinary(reg):
    return f"{int(reg.replace('$', '')):05b}"#Convierte un registro en su representante binario.

def instruccionesTipoR():
    biInstructions = ""
    biInstructionsDivided = ""
    asmInstructions = ""
    shamt = ""
    funct = {
        'add': '100000',
        'sub': '100010',
        'and': '100100',
        'or': '100101',
        'slt': '101010',
        'nop': '000000',
        'addi': '001000',
        'ori': '001101',
        'andi': '001100',
        'slti': '001010',
        'lw': '100011',
        'sw': '101011',
        'beq': '000100',
        'j': '000010'
    } #diccionario de las funciones 
    opcode = '000000'  # opcode es siempre 000000 para instrucciones tipo R

    try:
        with open(path, 'r') as archivo: #funcion para leer el archivo
            lines = archivo.readlines()
    except FileNotFoundError:
        print("El archivo especificado no se encontró." + path) #excepcion en caso de no encontrar el archivo
    
    try:
        with open('../DataPathVerilog/instrucciones_r.txt', 'w') as instrucciones:#funcion para escribir y ordenar el codigo binario que va al txt
            for line in lines:
                asmInstructions = asmInstructions + line
                parts = line.split()
                if len(parts) != 4:
                    if len(parts) == 1:
                        if(parts[0] == 'nop'):
                            biInstructions = biInstructions + '00000000000000000000000000000000' + '\n'
                            for i in range(4): biInstructionsDivided = biInstructionsDivided + '00000000' + '\n'
                    continue
                instruccion, rd, rs, rt = parts
                if instruccion in funct:
                    rs = toBinary(rs)
                    rt = toBinary(rt)
                    rd = toBinary(rd)
                    if(instruccion == 'div'):
                        shamt = '00010'
                    else:
                        shamt = '00000'
                    funcion = funct[instruccion]
                    binaryInstruction = f"{opcode}{rs}{rt}{rd}{shamt}{funcion}"
                    splitInstruction = [binaryInstruction[i:i+8] for i in range(0, len(binaryInstruction), 8)]
                    print(splitInstruction)
                    biInstructions = biInstructions + binaryInstruction + '\n'
                    for str in splitInstruction:
                        biInstructionsDivided = biInstructionsDivided + str + '\n'
            instrucciones.write(biInstructionsDivided)
            assemblyInstructions.set(asmInstructions)
            binaryInstructions.set(biInstructions)

    except FileNotFoundError:
        print("El archivo especificado a escribir no se encontró.") #excepcion en caso de no encontrar el archivo

window = Tk()
window.title('Decodificador')
window.geometry("700x800")
window.config(background="white")
menu_bar = Menu(window)
window.config(menu=menu_bar)

binaryInstructions = StringVar()
binaryInstructions.set("")
assemblyInstructions = StringVar()
assemblyInstructions.set("")

archivo_menu = Menu(menu_bar, tearoff=0)
menu_bar.add_cascade(label="Archivo", menu=archivo_menu)
archivo_menu.add_command(label="Abrir", command=openFile)
archivo_menu.add_command(label="Guardar", command=saveFile)
archivo_menu.add_command(label="Guardar como", command=saveFileAs)
archivo_menu.add_separator()
archivo_menu.add_command(label="Salir", command=exit) #command=window.quit

label_file_explorer = Label(window,
                            text="Archivo elegido:",
                            width=100, height=5,
                            fg="blue",
                            background="white")
label_file_explorer.grid(column=0, row=0, columnspan=3, sticky='w')

editor = Text(window, wrap=WORD)
editor.grid(column=0, row=1, sticky="nsew", padx=10, pady=10)

button_R = Button(window,
                  text="Traducir instrucciones a MIPS",
                  command=instruccionesTipoR)
button_R.grid(column=0, row=2, columnspan=3, sticky='ew')


instructions_frame = Frame(window, background="white")
instructions_frame.grid(column=0, row=3, columnspan=3, sticky='ew')
instructions_frame.grid_columnconfigure(0, weight=1)
instructions_frame.grid_columnconfigure(1, weight=1)

label_assembly_instructions = Label(instructions_frame,
                                    textvariable=assemblyInstructions,
                                    width=50, height=15,
                                    fg="blue",
                                    background="white",
                                    anchor='nw', justify='left')
label_assembly_instructions.grid(column=0, row=0, sticky='nw', padx=(200, 0), pady=(10, 10))

label_binary_instructions = Label(instructions_frame,
                                  textvariable=binaryInstructions,
                                  width=55, height=15,
                                  fg="blue",
                                  background="white",
                                  anchor='nw', justify='left')
label_binary_instructions.grid(column=1, row=0, sticky='nw', padx=(0, 100), pady=(10, 10))

window.grid_columnconfigure(0, weight=1)

window.mainloop()
