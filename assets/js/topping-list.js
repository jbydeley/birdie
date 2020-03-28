import {LitElement, html} from 'lit-element'
import {SirenElement} from './siren/siren-element'

import './topping-item'

class ToppingList extends SirenElement(LitElement) {
	get entities() {
		if( !this.entity ) {
			return []
		}

		console.log(this.entity)
		return this.entity.entities
	}

	render() {
		return this.entities.map(entity => html`<topping-item href=${entity.href}></topping-item>`)
	}
}

customElements.define('topping-list', ToppingList)