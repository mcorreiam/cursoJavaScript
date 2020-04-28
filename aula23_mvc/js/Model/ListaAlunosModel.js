class ListaAlunos {
    constructor(_lista){
        this.lista = [].concat(_lista);
    }
    obeterPorId(_id){
        return this.lista.filter( aluno => aluno._id === _id)[0];
    }

    adicionarAluno(aluno){
        this.lista.push(aluno);
    }

    buscarAluno(_nome){
        return this.lista.filter(aluno => aluno.nome.toLowerCase().indexOf(_nome.toLowerCase()) >= 0);
    }
}