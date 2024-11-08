import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template", "container", "subForm"]
    static values = { count: Number };

    connect() {
        this.countValue = this.countValue;
    }

    add() {
        this.countValue += 1
        this.containerTarget.innerHTML += this.templateTarget.innerHTML.replaceAll("NEW_RECORD", this.countValue)
    }

    remove(e){
        e.preventDefault()
        if(this.countValue > 1){
            this.subFormTargets.at(-1).remove()
            this.countValue -= 1
        }
    }
}


