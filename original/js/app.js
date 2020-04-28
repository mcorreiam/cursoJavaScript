var alunos = ["Daniel", "Maria", "Jose"];
alunos = alunos.map( aluno => new Aluno(aluno) );

alunos[0].adicionarNotas(5,2,3,8);
alunos[1].adicionarNotas(5,10,3,8);
alunos[2].adicionarNotas(5,2,8,8);

var listaAlunos = new ListaAlunos(alunos);
console.log(listaAlunos);

var view = new ListaAlunosView('#listaAlunos');
view.atualiza(listaAlunos);
