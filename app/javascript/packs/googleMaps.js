
let map;

const initMap = () => {


  const mapDiv = document.getElementById("map");
  if (mapDiv) {
    const origins = mapDiv.dataset.origin;
    const destination = mapDiv.dataset.destination;
    console.log(origins)
    console.log(destination)

    const url =  `https://maps.googleapis.com/maps/api/geocode/json?address=${origins}&key=AIzaSyA4pZlhCteWdP_CS0zgmUG8YuFsxPsm9bk`
    console.log(url)

    // const getlat = () => {
    //   fetch(url)
    //   .then(response => response.json())
    //   .then((data) => {
    //     let lat = data.results[0].geometry.location.lat;
    //     return lat
    //   })
    // }


    var latitude = 0
    var longitude = 0


    const printIt = (data) => {
      latitude = data.results[0].geometry.location.lat
      longitude = data.results[0].geometry.location.lng
    }

    fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      console.log(data.results[0].geometry.location.lat);
      map = new google.maps.Map(mapDiv, {
        center: { lat: data.results[0].geometry.location.lat, lng: data.results[0].geometry.location.lng },
        zoom: 12
      })
    })
  }



    // const latitude = getlat();
    // const longitude = getlon();



  }

}

export { initMap }
