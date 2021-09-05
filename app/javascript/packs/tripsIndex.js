const partialJsTripForm = () => {
  partialJsTripForm
  const input1 = document.querySelectorAll('.trip-input-1');
  const input2 = document.querySelectorAll('.trip-input-2');
  const input3 = document.querySelectorAll('.trip-input-3');
  const tripSubmit = document.querySelector('.trip-submit')
  let i = 1;


  const toggleDNone = (element) => {
    element.classList.toggle('d-none');
    console.log('chamou')
  }

  document.addEventListener('keypress', (event) => {
    if (event.key === 'Enter') {
      switch (i) {
        case 1:
          input1.forEach(element => {
            toggleDNone(element)
          });
          input2.forEach(element => {
            toggleDNone(element)
          });
          i++;
        break;
        case 2:
          input2.forEach(element => {
            toggleDNone(element)
          });
          input3.forEach(element => {
            toggleDNone(element)
          });
        break;
        case 3:
          input3.forEach(element => {
            toggleDNone(element)
          });
          toggleDNone(tripSubmit)
        break;
        default:
        console.log('done')
      }
    }
  });

}


export { partialJsTripForm }
