const partialJsTripForm = () => {
  partialJsTripForm
  const input1 = document.querySelectorAll('.trip-input-1');
  const input2 = document.querySelectorAll('.trip-input-2');
  const input3 = document.querySelectorAll('.trip-input-3');
  const tripSubmit = document.querySelector('.trip-submit')
  let i = 1;

  const originInput = document.querySelector('#new_trip_origin')
  const destinationInput = document.querySelector('#new_trip_destination')
  // const dateInput = document.querySelector('#new_trip_day')
  const submitButton = document.querySelector('.trip-submit .btn')
  const nextButton = document.querySelector('.next-button span')

  const toggleShow = (element) => {
    element.classList.toggle('show');
    console.log('chamou')
  }

  const toggleDNone = (element) => {
    element.classList.toggle('d-none');
    console.log('chamou')
  }

  const goToNextStep = (event) => {
    switch (i) {
      case 1:
      if (originInput.value) {
        input1.forEach(element => {
          toggleDNone(element)
        });
        input2.forEach(element => {
          toggleShow(element)
        });
        i++;
      }
      break;
      case 2:
      if (destinationInput.value) {
        input2.forEach(element => {
          toggleDNone(element)
        });
        input3.forEach(element => {
          toggleShow(element)
        });
        toggleShow(tripSubmit)
        toggleDNone(nextButton)
        i++;
      }
      break;
      case 3:
      // if (dateInput.value){
      input3.forEach(element => {
        toggleDNone(element)
      });
      toggleDNone(tripSubmit);
      i++;
      submitButton.click();
      // }
      break;
      default:
    }
  }

  if (input1.length > 0) {
    document.addEventListener('keypress', (event) => {
      if (event.key === 'Enter') {
        goToNextStep(event);
      }
    });

    nextButton.addEventListener('click', (event) => {
      goToNextStep(event);
    })
}

}


export { partialJsTripForm }
