class ListaAlunosController{
    constructor(model, view){
        this.model = model;
        this.view = view;
        
        this.view.$seletor.addEventListener('click', this.editarAluno.bind(this));
    }

    editarAluno(e){
        console.log(e.target);
        console.log(e.currentTarget);
        console.log(this);

        let target = e.target;

        while(target !== e.currentTarget){
            if(target.getAttribute('data-id')){
                break;
            }
            target = target.parentNode;
        }

        console.log('-----')
        console.log(target)
        
    }
}