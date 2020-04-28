class FormBuscarAlunoController{
    constructor(model, view){
        this.model = model;
        this.view = view;
    }

    buscarAluno(callback){
        var nome = this.view.$seletor.querySelector('input').value;
        var filtrados = this.model.buscarAluno(nome);
        if(filtrados && typeof callback === 'function'){
            callback(filtrados)
        }
    }

    limpaInput(){
        this.view.$seletor.querySelector('input').value = '';
    }
}