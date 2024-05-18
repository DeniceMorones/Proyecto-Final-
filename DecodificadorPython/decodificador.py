from tkinter import *
from tkinter import messagebox
from tkinter import filedialog

def openFile():
    global path
    path = filedialog.askopenfilename(initialdir = "./",
                                      title = "Selecciona un archivo",
                                      filetypes = [("Todos los archivos", "*.*"),
                                                   ("Archivos de ensamblador", "*.asm*"),
                                                   ("Archivos de texto", "*.txt*")])
      
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

def registerToBinary(register):
    if register.startswith('$'):
        register = register[1:]
    return format(int(register), '05b')

def immediateToBinary(immediate, bits):
    value = int(immediate)
    if value < 0:
        value = (1 << bits) + value  # Convertir a complemento a dos
    return format(value, f'0{bits}b')

def instructionToBinary(instruction):
    parts = instruction.split()
    opcode = parts[0]

    if opcode == 'add':
        return f'000000{registerToBinary(parts[2])}{registerToBinary(parts[3])}{registerToBinary(parts[1])}00000100000'
    elif opcode == 'sub':
        return f'000000{registerToBinary(parts[2])}{registerToBinary(parts[3])}{registerToBinary(parts[1])}00000100010'
    elif opcode == 'or':
        return f'000000{registerToBinary(parts[2])}{registerToBinary(parts[3])}{registerToBinary(parts[1])}00000100101'
    elif opcode == 'and':
        return f'000000{registerToBinary(parts[2])}{registerToBinary(parts[3])}{registerToBinary(parts[1])}00000100100'
    elif opcode == 'slt':
        return f'000000{registerToBinary(parts[2])}{registerToBinary(parts[3])}{registerToBinary(parts[1])}00000101010'
    elif opcode == 'nop':
        return '00000000000000000000000000000000'
    elif opcode == 'addi':
        return f'001000{registerToBinary(parts[2])}{registerToBinary(parts[1])}{immediateToBinary(parts[3], 16)}'
    elif opcode == 'ori':
        return f'001101{registerToBinary(parts[2])}{registerToBinary(parts[1])}{immediateToBinary(parts[3], 16)}'
    elif opcode == 'andi':
        return f'001100{registerToBinary(parts[2])}{registerToBinary(parts[1])}{immediateToBinary(parts[3], 16)}'
    elif opcode == 'slti':
        return f'001010{registerToBinary(parts[2])}{registerToBinary(parts[1])}{immediateToBinary(parts[3], 16)}'
    elif opcode == 'lw':
        offset, register = parts[2].strip(')').split('(')
        return f'100011{registerToBinary(register)}{registerToBinary(parts[1])}{immediateToBinary(offset, 16)}'
    elif opcode == 'sw':
        offset, register = parts[2].strip(')').split('(')
        return f'101011{registerToBinary(register)}{registerToBinary(parts[1])}{immediateToBinary(offset, 16)}'
    elif opcode == 'beq':
        return f'000100{registerToBinary(parts[1])}{registerToBinary(parts[2])}{immediateToBinary(parts[3], 16)}'
    elif opcode == 'j':
        return f'000010{immediateToBinary(parts[1], 26)}'
    else:
        return '00000000000000000000000000000000'

def decodeInstructions():
    biInstructions = ""
    biInstructionsDivided = ""
    asmInstructions = ""
    try:
        with open(path, 'r') as file: #funcion para leer el archivo
            lines = file.readlines()
    except FileNotFoundError:
        print("El archivo especificado no se encontró." + path) #excepcion en caso de no encontrar el archivo
    
    try:
        with open('../DataPathVerilog/instructions.txt', 'w') as instructionsTXT:#funcion para escribir y ordenar el codigo binario que va al txt
            for line in lines:
                asmInstructions = asmInstructions + line
                binaryInstruction = instructionToBinary(line)
                splitInstruction = [binaryInstruction[i:i+8] for i in range(0, len(binaryInstruction), 8)]
                biInstructions = biInstructions + binaryInstruction + '\n'
                for str in splitInstruction:
                    biInstructionsDivided = biInstructionsDivided + str + '\n'
            instructionsTXT.write(biInstructionsDivided)
            assembly_instructions.set(asmInstructions)
            binary_instructions.set(biInstructions)

    except FileNotFoundError:
        print("El archivo especificado a escribir no se encontró.") #excepcion en caso de no encontrar el archivo

def convertToBinary():
    biNumbers = ""
    numbers = ""
    try:
        with open(path, 'r') as file: #funcion para leer el archivo
            lines = file.readlines()
    except FileNotFoundError:
        print("El archivo especificado no se encontró." + path) #excepcion en caso de no encontrar el archivo
    
    try:
        with open('../DataPathVerilog/data.txt', 'w') as dataTXT:#funcion para escribir y ordenar el codigo binario que va al txt
            for line in lines:
                numbers = numbers + line
                binaryNumber = immediateToBinary(line, 32)
                biNumbers = biNumbers + binaryNumber + '\n'
            dataTXT.write(biNumbers)
            assembly_instructions.set(numbers)
            binary_instructions.set(biNumbers)

    except FileNotFoundError:
        print("El archivo especificado a escribir no se encontró.") #excepcion en caso de no encontrar el archivo


window = Tk()
window.title('Decodificador')
window.geometry("700x800")
window.config(background="white")
menu_bar = Menu(window)
window.config(menu=menu_bar)

binary_instructions = StringVar()
binary_instructions.set("")
assembly_instructions = StringVar()
assembly_instructions.set("")

file_menu = Menu(menu_bar, tearoff=0)
menu_bar.add_cascade(label="Archivo", menu=file_menu)
file_menu.add_command(label="Abrir", command=openFile)
file_menu.add_command(label="Guardar", command=saveFile)
file_menu.add_command(label="Guardar como", command=saveFileAs)
file_menu.add_separator()
file_menu.add_command(label="Salir", command=exit) #command=window.quit

label_file_explorer = Label(window,
                            text="Archivo elegido:",
                            width=100, height=5,
                            fg="blue",
                            background="white")
label_file_explorer.grid(column=0, row=0, columnspan=3, sticky='w')

editor = Text(window, wrap=WORD)
editor.grid(column=0, row=1, sticky="nsew", padx=10, pady=10)

button_inst = Button(window,
                  text="Traducir instrucciones a MIPS",
                  command=decodeInstructions)
button_inst.grid(column=0, row=2, columnspan=3, sticky='ew')

button_bi = Button(window,
                  text="Convertir numeros a binario",
                  command=convertToBinary)
button_bi.grid(column=0, row=3, columnspan=3, sticky='ew')


instructions_frame = Frame(window, background="white")
instructions_frame.grid(column=0, row=4, columnspan=3, sticky='ew')
instructions_frame.grid_columnconfigure(0, weight=1)
instructions_frame.grid_columnconfigure(1, weight=1)

label_assembly_instructions = Label(instructions_frame,
                                    textvariable=assembly_instructions,
                                    width=50, height=15,
                                    fg="blue",
                                    background="white",
                                    anchor='nw', justify='left')
label_assembly_instructions.grid(column=0, row=0, sticky='nw', padx=(200, 0), pady=(10, 10))

label_binary_instructions = Label(instructions_frame,
                                  textvariable=binary_instructions,
                                  width=55, height=15,
                                  fg="blue",
                                  background="white",
                                  anchor='nw', justify='left')
label_binary_instructions.grid(column=1, row=0, sticky='nw', padx=(0, 100), pady=(10, 10))

window.grid_columnconfigure(0, weight=1)

window.mainloop()
