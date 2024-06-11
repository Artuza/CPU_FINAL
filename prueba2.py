# Inicialización de los vectores
vector_a = [1, 2, 3, 4]
vector_b = [5, 6, 7, 8]
vector_c = [3, 2, 1, 1]

# X = Vector A + Vector B
x = [a + b for a, b in zip(vector_a, vector_b)]

# Y = X + Vector C
y = [x_val + c_val for x_val, c_val in zip(x, vector_c)]

# W = Vector A[0] + Vector B[1]
w = vector_a[0] + vector_b[1]

# Z = W + Y[3]
z = w + y[3]

print("Resultado final (Z):", z)
