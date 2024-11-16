import string
string.ascii_lowercase

abc = string.ascii_lowercase

# ============= CIFRAR METODO CESAR ==================
#p = input("Palabra/Frase a cifrar: ")
palabra = "pim pam pum"
cifrado1 = ""
num = 3

def cifrar(palabra, num):
    cifrado = ""
    for i in palabra:
        if i == " ":
            cifrado += " "
            continue
        cifrado += abc[(abc.index(i) + num)]
    return cifrado

cifrado1 = cifrar(palabra, num)

print(cifrado1)

# ============= DESCIFRAR METODO CESAR ==================
pcifrada = "slp sdp sxp"
# c = input("Palabra/Frase a descifrar: ")

def descifrar(pcifrada, num):
    descifrado = ""
    for i in pcifrada:
        if i == " ":
            descifrado += " "
            continue
        descifrado += abc[(abc.index(i) - num)]
    return descifrado

descifrado = descifrar(pcifrada, num)
print(descifrado)

# ========== CIFRADO NUM ===========
def cifrarNum(palabra, num):
    cifrado = ""
    for i in palabra:
        if i == " ":
            cifrado += ", "
            continue
        cifrado += str(abc.index(i) + num) + " " 
    return cifrado

x = cifrarNum(palabra, 2)
print(x)

# ========== DESCIFRADO NUM ===========
ncif = "17 10 14 , 17 2 14 , 17 22 14"

def descifrarNum(ncif, num):
    descifrado = ""
    for i in ncif.split(" "):
        if i == ",":
            descifrado += " "
            continue
        descifrado += abc[int(i) - num]
    return descifrado

y = descifrarNum(ncif, 2)
print(y)
def hola():
    return f"hola"

print(hola())