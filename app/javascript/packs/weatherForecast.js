const weatherForecast= () => {

  const url = 'https://api.openweathermap.org/data/2.5/forecast?q=ubatuba&appid=0917122780fc85b3d5c79495fe8e1fb1'


  const city = document.querySelector('#city');
  const description = document.querySelector('#description');
  const temperature = document.querySelector('#temperature');
  const icon = document.querySelector('#icon');
  const card = document.querySelector('.card-category');



  fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
