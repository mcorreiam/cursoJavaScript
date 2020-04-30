[33mcommit a3980e03d985da76386bf367f1c12efdaf8ba4dd[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: mcorreiam <m.correia.m@gmail.com>
Date:   Tue Apr 28 17:10:46 2020 -0300

    aula mvc

[1mdiff --git a/aula23_mvc/aula23.html b/aula23_mvc/aula23.html[m
[1mindex ca2e786..8851be6 100644[m
[1m--- a/aula23_mvc/aula23.html[m
[1m+++ b/aula23_mvc/aula23.html[m
[36m@@ -53,10 +53,15 @@[m
         </section>[m
 [m
         <script src="beluga2.js"></script>[m
[32m+[m		[32m<script src="js/View/View.js"></script>[m
 		<script src="js/Model/AlunoModel.js"></script>[m
 		<script src="js/Model/ListaAlunosModel.js"></script>[m
 		<script src="js/View/ListaAlunosView.js"></script>[m
[32m+[m		[32m<script src="js/View/FormAdicionarAlunoView.js"></script>[m
 		<script src="js/Controller/ListaAlunoController.js"></script>[m
[32m+[m		[32m<script src="js/Controller/FormAdicionarAlunoController.js"></script>[m
[32m+[m		[32m<script src="js/View/FormBuscarAlunoView.js"></script>[m
[32m+[m		[32m<script src="js/Controller/FormBuscarAlunoController.js"></script>[m
 		<script src="js/app.js"></script>[m
         [m
     </body>[m
[1mdiff --git a/aula23_mvc/js/Controller/FormAdicionarAlunoController.js b/aula23_mvc/js/Controller/FormAdicionarAlunoController.js[m
[1mnew file mode 100644[m
[1mindex 0000000..0ddd703[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/js/Controller/FormAdicionarAlunoController.js[m
[36m@@ -0,0 +1,13 @@[m
[32m+[m[32mclass FormAdicionarAlunoController{[m
[32m+[m[32m    constructor(model, view){[m
[32m+[m[32m        this.model = model;[m
[32m+[m[32m        this.view = view;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    limpar(){[m
[32m+[m[32m        console.log("------------")[m
[32m+[m[32m        let inputs = this.view.$seletor.querySelectorAll('input');[m
[32m+[m[32m        Array.prototype.forEach.call(inputs, input => input.value = '' )[m
[32m+[m[32m        inputs[0].focus();[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/Controller/FormBuscarAlunoController.js b/aula23_mvc/js/Controller/FormBuscarAlunoController.js[m
[1mnew file mode 100644[m
[1mindex 0000000..608fda1[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/js/Controller/FormBuscarAlunoController.js[m
[36m@@ -0,0 +1,18 @@[m
[32m+[m[32mclass FormBuscarAlunoController{[m
[32m+[m[32m    constructor(model, view){[m
[32m+[m[32m        this.model = model;[m
[32m+[m[32m        this.view = view;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    buscarAluno(callback){[m
[32m+[m[32m        var nome = this.view.$seletor.querySelector('input').value;[m
[32m+[m[32m        var filtrados = this.model.buscarAluno(nome);[m
[32m+[m[32m        if(filtrados && typeof callback === 'function'){[m
[32m+[m[32m            callback(filtrados)[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    limpaInput(){[m
[32m+[m[32m        this.view.$seletor.querySelector('input').value = '';[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/Controller/ListaAlunoController.js b/aula23_mvc/js/Controller/ListaAlunoController.js[m
[1mindex 9d8bcd0..dad744a 100644[m
[1m--- a/aula23_mvc/js/Controller/ListaAlunoController.js[m
[1m+++ b/aula23_mvc/js/Controller/ListaAlunoController.js[m
[36m@@ -22,6 +22,33 @@[m [mclass ListaAlunosController{[m
 [m
         console.log('-----')[m
         console.log(target)[m
[32m+[m
[32m+[m[32m        if(target){[m
[32m+[m[32m            let _id = parseInt(target.getAttribute('data-id'));[m
[32m+[m[32m            let _notas = prompt('digite as novas notas separadas por vírgula');[m
[32m+[m[32m            if(!_notas) return;[m
[32m+[m[41m                        [m
[32m+[m[32m            _notas = _notas.split(',').map( nota => parseFloat(nota));[m
[32m+[m[32m            console.log(_notas);[m
[32m+[m
[32m+[m[32m            let aluno = this.model.obeterPorId(_id);[m
[32m+[m[32m            aluno.atualizarNotas(_notas);[m
[32m+[m
[32m+[m[32m            this.view.atualiza(this.model)[m
[32m+[m[32m        }[m
         [m
     }[m
[32m+[m
[32m+[m[32m    adicionarAluno(nome, notas){[m
[32m+[m[32m        this.model.adicionarAluno(new Aluno(nome, notas));[m
[32m+[m[32m        this.view.atualiza(this.model);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    atualizaLista(alunos){[m
[32m+[m[32m        this.view.atualiza(alunos)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    limparFiltro(){[m
[32m+[m[32m        this.view.atualiza(this.model);[m
[32m+[m[32m    }[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/Model/AlunoModel.js b/aula23_mvc/js/Model/AlunoModel.js[m
[1mindex 24b2f85..a5b0a2e 100644[m
[1m--- a/aula23_mvc/js/Model/AlunoModel.js[m
[1m+++ b/aula23_mvc/js/Model/AlunoModel.js[m
[36m@@ -1,13 +1,17 @@[m
 class Aluno {[m
[31m-    constructor(nome){[m
[32m+[m[32m    constructor(nome, notas){[m
         this.nome = nome;[m
[31m-        this._notas = [];[m
[32m+[m[32m        this._notas = (notas) ? [].concat(notas) : [];[m
         this._id = ++Aluno.id[m
     }[m
     [m
     adicionarNotas(){[m
         Array.prototype.forEach.call(arguments, nota => this._notas.push(nota))[m
     }    [m
[32m+[m
[32m+[m[32m    atualizarNotas(arr){[m
[32m+[m[32m        this._notas = [].concat(arr);[m
[32m+[m[32m    }[m
         [m
     recuperarMedia(){[m
         var notas = this._notas;[m
[1mdiff --git a/aula23_mvc/js/Model/ListaAlunosModel.js b/aula23_mvc/js/Model/ListaAlunosModel.js[m
[1mindex 6252131..3531da2 100644[m
[1m--- a/aula23_mvc/js/Model/ListaAlunosModel.js[m
[1m+++ b/aula23_mvc/js/Model/ListaAlunosModel.js[m
[36m@@ -2,4 +2,15 @@[m [mclass ListaAlunos {[m
     constructor(_lista){[m
         this.lista = [].concat(_lista);[m
     }[m
[32m+[m[32m    obeterPorId(_id){[m
[32m+[m[32m        return this.lista.filter( aluno => aluno._id === _id)[0];[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    adicionarAluno(aluno){[m
[32m+[m[32m        this.lista.push(aluno);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    buscarAluno(_nome){[m
[32m+[m[32m        return this.lista.filter(aluno => aluno.nome.toLowerCase().indexOf(_nome.toLowerCase()) >= 0);[m
[32m+[m[32m    }[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/View/FormAdicionarAlunoView.js b/aula23_mvc/js/View/FormAdicionarAlunoView.js[m
[1mnew file mode 100644[m
[1mindex 0000000..e587504[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/js/View/FormAdicionarAlunoView.js[m
[36m@@ -0,0 +1,29 @@[m
[32m+[m[32mclass FormAdicionarAlunoView extends View {[m
[32m+[m[32m    constructor(seletor){[m
[32m+[m[32m        super(seletor);[m
[32m+[m[32m        this.$seletor.innerHTML = this.getTemplate();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    getTemplate(){[m
[32m+[m[32m        return `[m
[32m+[m[32m        <form class="form-inline">[m
[32m+[m[32m          <div class="form-group">[m
[32m+[m[32m            <input type="text" class="form-control" placeholder="Nome" name="nome" id="nome" required>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="form-group">[m
[32m+[m[32m            <input type="number" class="form-control" placeholder="nota1" min="0" max="10" name="nota1" id="nota1" required>[m
[32m+[m[32m          </div>[m
[32m+[m[32m           <div class="form-group">[m
[32m+[m[32m            <input type="number" class="form-control" placeholder="nota2" min="0" max="10" name="nota2" id="nota2" required>[m
[32m+[m[32m          </div>[m
[32m+[m[32m           <div class="form-group">[m
[32m+[m[32m            <input type="number" class="form-control" placeholder="nota3" min="0" max="10" name="nota3" id="nota3" required>[m
[32m+[m[32m          </div>[m
[32m+[m[32m           <div class="form-group">[m
[32m+[m[32m            <input type="number" class="form-control" placeholder="nota4" min="0" max="10" name="nota4" id="nota4" required>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <button type="submit" class="btn btn-default">Adicionar</button>[m
[32m+[m[32m        </form>[m
[32m+[m[32m    `[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/View/FormBuscarAlunoView.js b/aula23_mvc/js/View/FormBuscarAlunoView.js[m
[1mnew file mode 100644[m
[1mindex 0000000..8b9b3d8[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/js/View/FormBuscarAlunoView.js[m
[36m@@ -0,0 +1,19 @@[m
[32m+[m[32mclass FormBuscarAlunoView extends View {[m
[32m+[m[32m    constructor(seletor){[m
[32m+[m[32m        super(seletor);[m
[32m+[m[32m        this.$seletor.innerHTML = this.getTemplate();[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    getTemplate(){[m
[32m+[m[32m        return `[m
[32m+[m[32m        Busca:[m
[32m+[m[32m        <form class="form-inline">[m
[32m+[m[32m            <div class="form-group">[m
[32m+[m[32m                <input type="text" class="form-control" placeholder="Nome" name="nome" id="nome" required>[m
[32m+[m[32m            </div>[m[41m            [m
[32m+[m[32m            <button type="submit" class="btn btn-default" id="btnBuscar">Buscar</button>[m
[32m+[m[32m            <button type="submit" class="btn btn-default" id="btnLimparFiltro">Limpar</button>[m
[32m+[m[32m        </form>[m
[32m+[m[32m        `[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/View/ListaAlunosView.js b/aula23_mvc/js/View/ListaAlunosView.js[m
[1mindex 9d42329..48c07d0 100644[m
[1m--- a/aula23_mvc/js/View/ListaAlunosView.js[m
[1m+++ b/aula23_mvc/js/View/ListaAlunosView.js[m
[36m@@ -1,6 +1,6 @@[m
[31m-class ListaAlunosView {[m
[32m+[m[32mclass ListaAlunosView extends View {[m
     constructor(seletor) {[m
[31m-        this.$seletor = blg.$(seletor);[m
[32m+[m[32m        super(seletor);[m
     }[m
 [m
     getTemplate(model) {[m
[1mdiff --git a/aula23_mvc/js/View/View.js b/aula23_mvc/js/View/View.js[m
[1mnew file mode 100644[m
[1mindex 0000000..63cbecf[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/js/View/View.js[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32mclass View{[m
[32m+[m[32m    constructor(seletor){[m
[32m+[m[32m        this.$seletor = blg.$(seletor);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    getTemplate(){[m
[32m+[m[32m        throw new Error ('metodo getTemplate deve ser implementado.')[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/js/app.js b/aula23_mvc/js/app.js[m
[1mindex 74bada2..0a49658 100644[m
[1m--- a/aula23_mvc/js/app.js[m
[1m+++ b/aula23_mvc/js/app.js[m
[36m@@ -11,4 +11,39 @@[m [mconsole.log(listaAlunos);[m
 var listaAlunosView = new ListaAlunosView('#listaAlunos');[m
 listaAlunosView.atualiza(listaAlunos);[m
 [m
[31m-var listaAlunosController = new ListaAlunosController(listaAlunos, listaAlunosView);[m
\ No newline at end of file[m
[32m+[m[32mvar listaAlunosController = new ListaAlunosController(listaAlunos, listaAlunosView);[m
[32m+[m
[32m+[m[32mvar formAdicionarAlunoView = new FormAdicionarAlunoView('#form-adiciona')[m
[32m+[m[32mvar formAdicionarAlunoController = new FormAdicionarAlunoController(listaAlunos, formAdicionarAlunoView);[m
[32m+[m
[32m+[m[32mvar formBuscarAlunoView = new FormBuscarAlunoView('#form-busca');[m
[32m+[m[32mvar formBuscaAlunoController = new FormBuscarAlunoController(listaAlunos, formBuscarAlunoView);[m[41m [m
[32m+[m
[32m+[m[32mblg.$('#form-adiciona form').addEventListener('submit', function(e){[m
[32m+[m[32m    e.preventDefault();[m
[32m+[m
[32m+[m[32m    var nome = blg.$('#nome').value;[m
[32m+[m[32m    var notas = [];[m
[32m+[m[32m    var i = 1;[m
[32m+[m[32m    while(blg.$('#nota'+i)){[m
[32m+[m[32m        notas.push(parseFloat(blg.$('#nota'+i).value));[m
[32m+[m[32m        i++[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    listaAlunosController.adicionarAluno(nome, notas);[m
[32m+[m[32m    formAdicionarAlunoController.limpar();[m
[32m+[m[32m})[m
[32m+[m
[32m+[m[32mblg.$('#form-busca form').addEventListener('submit', function(e){[m
[32m+[m[32m    e.preventDefault();[m
[32m+[m
[32m+[m[32m    formBuscaAlunoController.buscarAluno(function(_alunos){[m
[32m+[m[32m        listaAlunosController.atualizaLista({lista:_alunos});[m
[32m+[m[32m    });[m
[32m+[m[32m})[m
[32m+[m[32mblg.$('#btnLimparFiltro').addEventListener('click', function(e){[m
[32m+[m[32m    e.preventDefault();[m
[32m+[m
[32m+[m[32m    formBuscaAlunoController.limpaInput();[m
[32m+[m[32m    listaAlunosController.limparFiltro();[m
[32m+[m[32m})[m
\ No newline at end of file[m

[33mcommit 0f4b3db4e9282d0a15a89a4be4440443c803fee8[m
Author: mcorreiam <m.correia.m@gmail.com>
Date:   Mon Apr 27 21:28:18 2020 -0300

    estudo dia 27042020

[1mdiff --git a/aula23_mvc/aula23.html b/aula23_mvc/aula23.html[m
[1mnew file mode 100644[m
[1mindex 0000000..ca2e786[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/aula23.html[m
[36m@@ -0,0 +1,63 @@[m
[32m+[m[32m<!doctype html>[m
[32m+[m[32m<html>[m
[32m+[m[32m    <head>[m
[32m+[m[32m        <title>Curso Javascript Completo 2018</title>[m
[32m+[m[32m        <meta charset="utf-8">[m
[32m+[m[41m        [m
[32m+[m[32m        <link href="css/bootstrap.css" rel="stylesheet">[m
[32m+[m[32m        <link href="css/bootstrap-theme.css" rel="stylesheet">[m
[32m+[m[41m        [m
[32m+[m[32m    </head>[m
[32m+[m[32m    <body>[m
[32m+[m[32m        <div class="container">[m
[32m+[m[32m            <h1>Curso Javascript Completo 2018</h1>[m
[32m+[m[32m        </div>[m
[32m+[m[41m        [m
[32m+[m[41m        [m
[32m+[m[32m        <section>[m
[32m+[m[41m        [m	[32m<div class="container">[m
[32m+[m[41m	        [m
[32m+[m		[41m      [m	[32m<h2>Média dos alunos</h2>[m
[32m+[m
[32m+[m		[41m      [m	[32m<div id="form-adiciona"></div>[m
[32m+[m		[41m      [m	[32m<div id="form-busca"></div>[m
[32m+[m
[32m+[m[41m		      	[m
[32m+[m
[32m+[m				[32m<table class="table js-tabela">[m
[32m+[m					[32m<thead>[m
[32m+[m						[32m<tr>[m
[32m+[m							[32m<th>Nome</th>[m
[32m+[m							[32m<th>Nota 1</th>[m
[32m+[m							[32m<th>Nota 2</th>[m
[32m+[m							[32m<th>Nota 3</th>[m
[32m+[m							[32m<th>Nota 4</th>[m
[32m+[m							[32m<th>Média</th>[m
[32m+[m						[32m</tr>[m
[32m+[m					[32m</thead>[m
[32m+[m					[32m<tbody id="listaAlunos">[m
[32m+[m						[32m<tr class="aluno" >[m
[32m+[m							[32m<td class="aluno-nome">Gertrude</td>[m
[32m+[m							[32m<td class="aluno-n1">10</td>[m
[32m+[m							[32m<td class="aluno-n2">8.5</td>[m
[32m+[m							[32m<td class="aluno-n3">9</td>[m
[32m+[m							[32m<td class="aluno-n4">7.5</td>[m[41m	[m
[32m+[m							[32m<td class="aluno-m"></td>[m
[32m+[m						[32m</tr>[m
[32m+[m
[32m+[m[41m						[m
[32m+[m					[32m</tbody>[m
[32m+[m				[32m</table>[m
[32m+[m[41m	        	[m
[32m+[m[41m        [m	[32m</div>[m[41m	[m
[32m+[m[32m        </section>[m
[32m+[m
[32m+[m[32m        <script src="beluga2.js"></script>[m
[32m+[m		[32m<script src="js/Model/AlunoModel.js"></script>[m
[32m+[m		[32m<script src="js/Model/ListaAlunosModel.js"></script>[m
[32m+[m		[32m<script src="js/View/ListaAlunosView.js"></script>[m
[32m+[m		[32m<script src="js/Controller/ListaAlunoController.js"></script>[m
[32m+[m		[32m<script src="js/app.js"></script>[m
[32m+[m[41m        [m
[32m+[m[32m    </body>[m
[32m+[m[32m</html>[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/beluga2.js b/aula23_mvc/beluga2.js[m
[1mnew file mode 100644[m
[1mindex 0000000..14dac7d[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/beluga2.js[m
[36m@@ -0,0 +1,32 @@[m
[32m+[m[32mvar blg = (function(){[m
[32m+[m[32m    var beluga = {};[m
[32m+[m[41m    [m
[32m+[m[32m    beluga.$ = document.querySelector.bind(document);[m
[32m+[m[32m    beluga.$$ = document.querySelectorAll.bind(document);[m
[32m+[m[41m    [m
[32m+[m[32m    Array.prototype.getMedia = function(){[m
[32m+[m[32m        //return _calcularMedia.apply(this, this);[m
[32m+[m[32m        return _calcularMedia(...this);[m
[32m+[m[32m    };[m
[32m+[m[41m    [m
[32m+[m[32m    function _calcularMedia(){[m[41m        [m
[32m+[m[32m        let _arr = Array.prototype.map.call(arguments, (n) => parseFloat(n) );[m
[32m+[m[32m        let hasNaN = _arr.some( (n) => isNaN(n) );[m[41m [m
[32m+[m[32m        if(hasNaN) throw new Error('somente números');[m[41m       [m
[32m+[m[41m        [m
[32m+[m[32m        let total = (_arr.reduce(function(total, atual, i){[m
[32m+[m[32m            return total + atual;[m
[32m+[m[32m        }) ) / _arr.length;[m
[32m+[m[32m        return total;[m
[32m+[m[32m    }[m
[32m+[m[41m    [m
[32m+[m[32m    beluga.calcularMedia = _calcularMedia;[m
[32m+[m[41m    [m
[32m+[m[32m    function _each(sel, fn){[m
[32m+[m[32m        var _sel = this.$$(sel);[m
[32m+[m[32m        Array.prototype.forEach.call(_sel, fn)[m
[32m+[m[32m    }[m
[32m+[m[32m    beluga.each = _each;[m
[32m+[m[41m    [m
[32m+[m[32m    return beluga;[m
[32m+[m[32m})()[m
\ No newline at end of file[m
[1mdiff --git a/aula23_mvc/css/bootstrap-theme.css b/aula23_mvc/css/bootstrap-theme.css[m
[1mnew file mode 100644[m
[1mindex 0000000..df2d3d9[m
[1m--- /dev/null[m
[1m+++ b/aula23_mvc/css/bootstrap-theme.css[m
[36m@@ -0,0 +1,397 @@[m
[32m+[m[32m/*![m
[32m+[m[32m * Bootstrap v3.0.3 (http://getbootstrap.com)[m
[32m+[m[32m * Copyright 2013 Twitter, Inc.[m
[32m+[m[32m * Licensed under http://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m.btn-default,[m
[32m+[m[32m.btn-primary,[m
[32m+[m[32m.btn-success,[m
[32m+[m[32m.btn-info,[m
[32m+[m[32m.btn-warning,[m
[32m+[m[32m.btn-danger {[m
[32m+[m[32m  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.2);[m
[32m+[m[32m  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px rgba(0, 0, 0, 0.075);[m
[32m+[m[32m          box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px rgba(0, 0, 0, 0.075);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-default:active,[m
[32m+[m[32m.btn-primary:active,[m
[32m+[m[32m.btn-success:active,[m
[32m+[m[32m.btn-info:active,[m
[32m+[m[32m.btn-warning:active,[m
[32m+[m[32m.btn-danger:active,[m
[32m+[m[32m.btn-default.active,[m
[32m+[m[32m.btn-primary.active,[m
[32m+[m[32m.btn-success.active,[m
[32m+[m[32m.btn-info.active,[m
[32m+[m[32m.btn-warning.active,[m
[32m+[m[32m.btn-danger.active {[m
[32m+[m[32m  -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);[m
[32m+[m[32m          box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn:active,[m
[32m+[m[32m.btn.active {[m
[32m+[m[32m  background-image: none;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-default {[m
[32m+[m[32m  text-shadow: 0 1px 0 #fff;[m
[32m+[m[32m  background-image: -webkit-linear-gradient(top, #ffffff 0%, #e0e0e0 100%);[m
[32m+[m[32m  background-image: linear-gradient(to bottom, #ffffff 0%, #e0e0e0 100%);[m
[32m+[m[32m  background-repeat: repeat-x;[m
[32m+[m[32m  border-color: #dbdbdb;[m
[32m+[m[32m  border-color: #ccc;[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe0e0e0', GradientType=0);[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-default:hover,[m
[32m+[m[32m.btn-default:focus {[m
[32m+[m[32m  background-color: #e0e0e0;[m
[32m+[m[32m  background-position: 0 -15px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-default:active,[m
[32m+[m[32m.btn-default.active {[m
[32m+[m[32m  background-color: #e0e0e0;[m
[32m+[m[32m  border-color: #dbdbdb;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-primary {[m
[32m+[m[32m  background-image: -webkit-linear-gradient(top, #428bca 0%, #2d6ca2 100%);[m
[32m+[m[32m  background-image: linear-gradient(to bottom, #428bca 0%, #2d6ca2 100%);[m
[32m+[m[32m  background-repeat: repeat-x;[m
[32m+[m[32m  border-color: #2b669a;[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff428bca', endColorstr='#ff2d6ca2', GradientType=0);[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-primary:hover,[m
[32m+[m[32m.btn-primary:focus {[m
[32m+[m[32m  background-color: #2d6ca2;[m
[32m+[m[32m  background-position: 0 -15px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-primary:active,[m
[32m+[m[32m.btn-primary.active {[m
[32m+[m[32m  background-color: #2d6ca2;[m
[32m+[m[32m  border-color: #2b669a;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-success {[m
[32m+[m[32m  background-image: -webkit-linear-gradient(top, #5cb85c 0%, #419641 100%);[m
[32m+[m[32m  background-image: linear-gradient(to bottom, #5cb85c 0%, #419641 100%);[m
[32m+[m[32m  background-repeat: repeat-x;[m
[32m+[m[32m  border-color: #3e8f3e;[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5cb85c', endColorstr='#ff419641', GradientType=0);[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-success:hover,[m
[32m+[m[32m.btn-success:focus {[m
[32m+[m[32m  background-color: #419641;[m
[32m+[m[32m  background-position: 0 -15px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-success:active,[m
[32m+[m[32m.btn-success.active {[m
[32m+[m[32m  background-color: #419641;[m
[32m+[m[32m  border-color: #3e8f3e;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-warning {[m
[32m+[m[32m  background-image: -webkit-linear-gradient(top, #f0ad4e 0%, #eb9316 100%);[m
[32m+[m[32m  background-image: linear-gradient(to bottom, #f0ad4e 0%, #eb9316 100%);[m
[32m+[m[32m  background-repeat: repeat-x;[m
[32m+[m[32m  border-color: #e38d13;[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff0ad4e', endColorstr='#ffeb9316', GradientType=0);[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-warning:hover,[m
[32m+[m[32m.btn-warning:focus {[m
[32m+[m[32m  background-color: #eb9316;[m
[32m+[m[32m  background-position: 0 -15px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-warning:active,[m
[32m+[m[32m.btn-warning.active {[m
[32m+[m[32m  background-color: #eb9316;[m
[32m+[m[32m  border-color: #e38d13;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-danger {[m
[32m+[m[32m  background-image: -webkit-linear-gradient(top, #d9534f 0%, #c12e2a 100%);[m
[32m+[m[32m  background-image: linear-gradient(to bottom, #d9534f 0%, #c12e2a 100%);[m
[32m+[m[32m  background-repeat: repeat-x;[m
[32m+[m[32m  border-color: #b92c28;[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffd9534f', endColorstr='#ffc12e2a', GradientType=0);[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-danger:hover,[m
[32m+[m[32m.btn-danger:focus {[m
[32m+[m[32m  background-color: #c12e2a;[m
[32m+[m[32m  background-position: 0 -15px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-danger:active,[m
[32m+[m[32m.btn-danger.active {[m
[32m+[m[32m  background-color: #c12e2a;[m
[32m+[m[32m  border-color: #b92c28;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-info {[m
[32m+[m[32m  background-image: -webkit-linear-gradient(top, #5bc0de 0%, #2aabd2 100%);[m
[32m+[m[32m  background-image: linear-gradient(to bottom, #5bc0de 0%, #2aabd2 100%);[m
[32m+[m[32m  background-repeat: repeat-x;[m
[32m+[m[32m  border-color: #28a4c9;[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2aabd2', GradientType=0);[m
[32m+[m[32m  filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-info:hover,[m
[32m+[m[32m.btn-info:focus {[m
[32m+[m[32m  background-color: #2aabd2;[m
[32m+[m[32m  background-position: 0 -15px;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.btn-info:active,[m
[32m+[m[32m.btn-info.active {[m
[32m+[m[32m  background-color: #2aabd2;[m
[32m+[m[32m  border-color: #28a4c9;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.thumbnail,[