import {LitElement, html} from 'lit-element'
import {SirenElement} from './siren/siren-element'
import {getProperty} from './siren/get-property'

class ToppingItem extends SirenElement(LitElement) {
	render() {
		return html`
		<h1>${getProperty(this.entity, 'name')}</h1>
		`
	}
}

customElements.define('topping-item', ToppingItem)