from tkinter import *
from tkinter import messagebox
from tkinter import filedialog


def newFile():
    print('new')


def openFile():
    global filename
    filename = filedialog.askopenfilename(initialdir = "./",
                                          title = "Select a File",
                                          filetypes = (("Assembly files",
                                                        "*.asm*"),
                                                        ("Text files",
                                                        "*.txt*"),
                                                       ("all files",
                                                        "*.*")))
      
    label_file_explorer.configure(text="Archivo elegido: " + filename)

    if filename:
        try:
            with open(filename, "r") as file:
                editor.delete(1.0, END)
                editor.insert(1.0, file.read())
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo abrir el archivo: {filename}")
    return None

def saveFile():
    try:
        if filename:
            try:
                textContent = editor.get(1.0, END)
                with open(filename, "w") as file:
                    file.write(textContent)
                messagebox.showinfo("Guardado", f"El archivo se guardo correctamente en la direccion: {filename}")
            except Exception as e:
                messagebox.showerror("Error", f"No se pudo guardar el archivo: {e}")
    except:
        messagebox.showerror("Error", "No hay ningún archivo seleccionado para guardar")
    return None

def saveFileAs():
    print('saveAs')

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
        with open(filename, 'r') as archivo: #funcion para leer el archivo
            lineas = archivo.readlines()
    except FileNotFoundError:
        print("El archivo especificado no se encontró." + filename) #excepcion en caso de no encontrar el archivo
    
    try:
        with open('../DataPathVerilog/instrucciones_r.txt', 'w') as instrucciones:#funcion para escribir y ordenar el codigo binario que va al txt
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
archivo_menu.add_separator()
archivo_menu.add_command(label="Salir", command=window.quit)

label_file_explorer = Label(window,
                            text="Archivo elegido:",
                            width=100, height=5,
                            fg="blue",
                            background="white")
label_file_explorer.grid(column=0, row=0, columnspan=3, sticky='w')

editor = Text(window, wrap=WORD)
editor.grid(column=0, row=1, sticky="nsew", padx=10, pady=10)

button_R = Button(window,
                  text="Generar instrucciones tipo R",
                  command=instruccionesTipoR)
button_R.grid(column=0, row=2, columnspan=3, sticky='ew')

button_exit = Button(window,
                     text="Salir",
                     command=exit)
button_exit.grid(column=0, row=3, columnspan=3, sticky='ew')

instructions_frame = Frame(window, background="white")
instructions_frame.grid(column=0, row=4, columnspan=3, sticky='ew')
instructions_frame.grid_columnconfigure(0, weight=1)
instructions_frame.grid_columnconfigure(1, weight=1)

label_assembly_instructions = Label(instructions_frame,
                                    textvariable=assemblyInstructions,
                                    width=50, height=12,
                                    fg="blue",
                                    background="white",
                                    anchor='nw', justify='left')
label_assembly_instructions.grid(column=0, row=0, sticky='nw', padx=(200, 0), pady=(10, 10))

label_binary_instructions = Label(instructions_frame,
                                  textvariable=binaryInstructions,
                                  width=50, height=12,
                                  fg="blue",
                                  background="white",
                                  anchor='nw', justify='left')
label_binary_instructions.grid(column=1, row=0, sticky='nw', padx=(0, 100), pady=(10, 10))

window.grid_columnconfigure(0, weight=1)

window.mainloop()
