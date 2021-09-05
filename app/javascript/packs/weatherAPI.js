const weatherAPI = () => {

  const url = 'https://api.openweathermap.org/data/2.5/weather?q=ubatuba&appid=0917122780fc85b3d5c79495fe8e1fb1&units=metric'

  const city = document.querySelector('#city');
  const description = document.querySelector('#description');
  const temperature = document.querySelector('#temperature');
  const icon = document.querySelector('#icon');
  const card = document.querySelector('.card-category');

  if (city) {
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      const temp = Math.round(data.main.temp);

      console.log(data);
      city.innerText = data.name;
      description.innerText = data.weather[0].description;
      temperature.innerText = `${temp}°C`;
      icon.src = `http://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
      if (temp < 20) {
        card.style.backgroundImage = "url(https://images.unsplash.com/photo-1615716277421-0a35cb41ce96?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80)";
      } else if (temp < 30) {
        card.style.backgroundImage = "url(https://images.unsplash.com/photo-1581224463294-908316338239?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3VufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60)";
      } else {
        card.style.backgroundImage = "url(https://images.unsplash.com/photo-1501436513145-30f24e19fcc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80)";
      }
    });
  }
}

export { weatherAPI }
