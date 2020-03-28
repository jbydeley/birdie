export const SirenElement = (superclass) => class SirenElement extends superclass {
	static get properties() {
		return {
			entity: {
				type: Object
			},
			href: {
				type: String
			}
		}
	}

	updated(changedProperties) {
		super.updated(changedProperties)

		if(changedProperties.has('href')) {
			this.__refetch()
		}
	}

	__refetch() {
		if(this.href) {
			fetch(this.href)
				.then(res => res.json())
				.then(entity => this.entity = entity)
		}
	}
}