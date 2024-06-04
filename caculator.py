def calculator(a, b, c):
    if c == '+':
        return a + b
    elif c == '-':
        return a - b
    elif c == '*':
        return a * b
    elif c == '/':
        return a / b
    print("잘못된 값입니다.")        

print(calculator(1, 7, '+'))