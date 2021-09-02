const initAutocomplete = () => {
  console.log('To entrando');
  document.querySelectorAll('.autocomplete').forEach((input) => {
    new google.maps.places.Autocomplete(
      input,
      {
          types: ['address'],
          componentRestrictions: { 'country': 'BR' },
          fields: ['place_id', 'geometry', 'name', 'address_components']
        });
  })
}

export { initAutocomplete }
