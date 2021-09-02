



const requestFromApi = (Ubatuba) => {
  const ApiKey = '0917122780fc85b3d5c79495fe8e1fb1'
  const baseUrl = `api.openweathermap.org/data/2.5/weather?q=${Ubatuba}&appid=${ApiKey}`
  fetch(baseUrl)
    .then(function (response) {
      console.log(response.json())
      return response.json();
    })

}

export { requestFromApi }
