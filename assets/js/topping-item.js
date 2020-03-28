import {LitElement, html} from 'lit-element'
import {SirenElement} from './siren/siren-element'

class ToppingItem extends SirenElement(LitElement) {
	get name() {
		if(!this.entity || !this.entity.properties ) {
			return 'Loading'
		}

		return this.entity.properties.name
	}

	render() {
		return html`
		<h1>${this.name}!</h1>
		`
	}
}

customElements.define('topping-item', ToppingItem)