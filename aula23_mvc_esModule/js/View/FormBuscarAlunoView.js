import { View } from './View.js';
export class FormBuscarAlunoView extends View {
    constructor(seletor){
        super(seletor);
        this.$seletor.innerHTML = this.getTemplate();
    }

    getTemplate(){
        return `
        Busca:
        <form class="form-inline">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Nome" name="nome" id="nome" required>
            </div>            
            <button type="submit" class="btn btn-default" id="btnBuscar">Buscar</button>
            <button type="submit" class="btn btn-default" id="btnLimparFiltro">Limpar</button>
        </form>
        `
    }
}