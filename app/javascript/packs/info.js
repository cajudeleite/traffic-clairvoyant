const showFormOnClick = () => {

  const routeOptions = document.querySelectorAll('.route-title')
  const newTripForm = document.querySelector('.new-trip-form')
  const routeForm = document.querySelector('#trip_origin_destination_routes');



  routeOptions.forEach((route) => {
    route.addEventListener('click', (event) => {
      newTripForm.classList.add('show')
      routeOptions.forEach((routeToHide) => {
        if (routeToHide != route) {
          routeToHide.parentElement.parentElement.classList.add('fade')
        }
      });
      routeForm.value = route.dataset.roadDestination
    })
  });

}

export { showFormOnClick }
