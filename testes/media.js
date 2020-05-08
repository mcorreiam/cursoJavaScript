function media(...numeros){
    total = numeros.reduce((a, b) => a+b)
    return total / numeros.length;
}