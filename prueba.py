class Memory:
    def __init__(self):
        self.data = [0] * 256  # Memoria con 256 palabras de 32 bits

    def read(self, address):
        return self.data[address]

    def write(self, address, value):
        self.data[address] = value

class RegisterFile:
    def __init__(self):
        self.registers = [0] * 32  # 32 registros de 32 bits

    def read(self, reg_num):
        return self.registers[reg_num]

    def write(self, reg_num, value):
        self.registers[reg_num] = value

def load_instruction_pipeline(memory, register_file, base_reg, offset, dest_reg):
    base_address = register_file.read(base_reg)
    effective_address = base_address + offset
    data = memory.read(effective_address)
    register_file.write(dest_reg, data)

def add_instruction_pipeline(register_file, reg1, reg2, dest_reg):
    data1 = register_file.read(reg1)
    data2 = register_file.read(reg2)
    result = data1 + data2
    register_file.write(dest_reg, result)

def save_instruction_pipeline(memory, register_file, base_reg, offset, source_reg):
    base_address = register_file.read(base_reg)
    effective_address = base_address + offset
    data = register_file.read(source_reg)
    memory.write(effective_address, data)

# Inicialización de memoria y registros
memory = Memory()
register_file = RegisterFile()

# Inicializar registros para el cálculo de Fibonacci
register_file.write(0, 0)  # R0 = Base address 0
register_file.write(1, 0)  # R1 = F0 = 0
register_file.write(2, 1)  # R2 = F1 = 1

n = 10  # Número de términos de Fibonacci que queremos calcular

# Guardar los valores iniciales en la memoria
save_instruction_pipeline(memory, register_file, 0, 0, 1)  # MEM[0] = R1 (F0)
save_instruction_pipeline(memory, register_file, 0, 1, 2)  # MEM[1] = R2 (F1)

# Calcular los términos de Fibonacci y almacenarlos en la memoria
for i in range(2, n):
    add_instruction_pipeline(register_file, 1, 2, 3)  # R3 = R1 + R2 (F(n) = F(n-1) + F(n-2))
    save_instruction_pipeline(memory, register_file, 0, i, 3)  # MEM[i] = R3
    register_file.write(1, register_file.read(2))  # R1 = R2 (F(n-2) = F(n-1))
    register_file.write(2, register_file.read(3))  # R2 = R3 (F(n-1) = F(n))

# Verificar el resultado
print("Serie de Fibonacci calculada:")
for i in range(n):
    print(f"F{i} = {memory.read(i)}")
