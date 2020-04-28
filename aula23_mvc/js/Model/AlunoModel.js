class Aluno {
    constructor(nome){
        this.nome = nome;
        this._notas = [];
        this._id = ++Aluno.id
    }
    
    adicionarNotas(){
        Array.prototype.forEach.call(arguments, nota => this._notas.push(nota))
    }    
        
    recuperarMedia(){
        var notas = this._notas;
        return blg.calcularMedia(...notas);
    }
}
Aluno.id = 0;