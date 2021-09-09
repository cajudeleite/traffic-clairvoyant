const showFormOnClick = () => {

  const routeOptions = document.querySelectorAll('.route-title')
  const newTripForm = document.querySelector('.new-trip-form')
  const routeForm = document.querySelector('#trip_origin_destination_routes');



  routeOptions.forEach((route) => {
    route.addEventListener('click', (event) => {
      if (newTripForm) {
        newTripForm.classList.add('show')
      }
      routeOptions.forEach((routeToHide) => {
        if (routeToHide != route) {
          // routeToHide.parentElement.parentElement.classList.add('fade')
        }
      });
      if (routeForm){
        routeForm.value = route.dataset.roadDestination
      }
    })
  });

}

export { showFormOnClick }



const paintChartOnClick = () => {

  let chartDataColumns = document.querySelectorAll('rect')

  chartDataColumns.forEach(dataColumn => {
    dataColumn.addEventListener('click', (event) => {
      console.log('clicked');
      findPair(dataColumn);
    })
  });


  let findPair = (element) => {
    let chartColumns = document.querySelectorAll('rect');
    const x = element.attributes['x'].value;
    console.log('entered function')

    chartColumns.forEach(chartColumn => {
      console.log(chartColumn)
      if (chartColumn.attributes['fill'] != undefined && chartColumn.attributes['x'].value != '0'){
        if (chartColumn.attributes['x'].value === x || 1===1) {
          chartColumn.attributes["fill"].value = '#FF0000';
          console.log('hello');
        } else  {
          chartColumn.attributes["fill"].value = '#aa8dd8'
        }
      }
    });
  }


}

export { paintChartOnClick }
