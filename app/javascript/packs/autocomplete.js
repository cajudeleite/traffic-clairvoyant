const autocomplete = () => {
  const input = document.getElementById('autocomplete');
  input.addEventListener('change', initAutocomplete());
  let autocomplete;
  function initAutocomplete() {
    console.log('To entrando');
    autocomplete = new google.maps.places.Autocomplete(
      input,
      {
        types: ['establishment'],
        componentRestrictions: { 'country': 'BR' },
        fields: ['place_id', 'geometry', 'name', 'address_components']
      });
    autocomplete.addListener('place_changed', onPlaceChanged);
  }

  function onPlaceChanged() {
    let place = autocomplete.getPlace();

    if (!place.geometry) {
      input.placeholder = 'Escreva uma origem';
    } else {
      document.getElementById('details').innerHTML = place.name;
    }
  }
  console.log('to saindo');
}


export {autocomplete}
