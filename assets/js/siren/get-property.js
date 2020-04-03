export const getProperty = (entity, property) => {
	if(!entity || !entity.properties) {
		return ''
	}

	return entity.properties[property]
}