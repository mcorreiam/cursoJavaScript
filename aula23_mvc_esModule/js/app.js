import { Aluno } from './Model/AlunoModel.js';
import { ListaAlunos } from './Model/ListaAlunosModel.js';
import { ListaAlunosView } from './View/ListaAlunosView.js';
import { FormAdicionarAlunoView } from './View/FormAdicionarAlunoView.js';
import { FormBuscarAlunoView } from './View/FormBuscarAlunoView.js';
import { ListaAlunosController } from './Controller/ListaAlunoController.js';
import { FormAdicionarAlunoController } from './Controller/FormAdicionarAlunoController.js';
import { FormBuscarAlunoController } from './Controller/FormBuscarAlunoController.js';
import { blg } from '../beluga2.js';

//var alunos = ["Daniel", "Maria", "Jose"];
//alunos = alunos.map( aluno => new Aluno(aluno));
//
//alunos[0].adicionarNotas(5,2,3,8);
//alunos[1].adicionarNotas(5,10,3,8);
//alunos[2].adicionarNotas(5,2,8,8);

//var listaAlunos = new ListaAlunos(alunos);
var listaAlunos = new ListaAlunos();
console.log(listaAlunos);

var listaAlunosView = new ListaAlunosView('#listaAlunos');
//listaAlunosView.atualiza(listaAlunos);

var listaAlunosController = new ListaAlunosController(listaAlunos, listaAlunosView);

var formAdicionarAlunoView = new FormAdicionarAlunoView('#form-adiciona')
var formAdicionarAlunoController = new FormAdicionarAlunoController(listaAlunos, formAdicionarAlunoView);

var formBuscarAlunoView = new FormBuscarAlunoView('#form-busca');
var formBuscaAlunoController = new FormBuscarAlunoController(listaAlunos, formBuscarAlunoView); 

blg.$('#form-adiciona form').addEventListener('submit', function(e){
    e.preventDefault();

    var nome = blg.$('#nome').value;
    var notas = [];
    var i = 1;
    while(blg.$('#nota'+i)){
        notas.push(parseFloat(blg.$('#nota'+i).value));
        i++
    }

    listaAlunosController.adicionarAluno(nome, notas);
    formAdicionarAlunoController.limpar();
})

blg.$('#form-busca form').addEventListener('submit', function(e){
    e.preventDefault();

    formBuscaAlunoController.buscarAluno(function(_alunos){
        listaAlunosController.atualizaLista({lista:_alunos});
    });
})
blg.$('#btnLimparFiltro').addEventListener('click', function(e){
    e.preventDefault();

    formBuscaAlunoController.limpaInput();
    listaAlunosController.limparFiltro();
})