ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
KEY = 3

"""
    CEASER encryption algorithm
"""
def ceaser_encrypt(plain_text):
    ciphet_text = ''
    plain_text = plain_text.upper()
    for c in plain_text:
        index = ALPHABET.find(c)
        #print(index)
        if index <= -1:
            pass
        else:
            index = (index+KEY) % len(ALPHABET)
        #print("character=c + " index"+index)
        ciphet_text = ciphet_text+(c if index == -1 else ALPHABET[index])
    return ciphet_text

"""
    CEASER decryption algorithm
"""
def ceaser_decrypt(cipher_text):
    plain_text = ''
    for c in cipher_text:
        index = ALPHABET.find(c)
        if index <= -1:
            pass
        else:
            index = ( index - KEY) % len(ALPHABET)
        plain_text = plain_text + (c if index == -1 else ALPHABET[index])
    return plain_text
print(ceaser_decrypt(ceaser_encrypt('THISIS MESSAGE')))
