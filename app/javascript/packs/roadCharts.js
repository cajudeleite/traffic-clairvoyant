const drawChart = () => {

  // Load the Visualization API and the corechart package.
  google.charts.load('current', {'packages':['corechart']});

  // Set a callback to run when the Google Visualization API is loaded.
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {

    for (var road in gon.graph_data) {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Hours');
      data.addColumn('number', 'cars');
      data_array = [];
      graph_data = gon.graph_data[road];
      for (var key in graph_data) {
        array = [key, graph_data[key] * 10];
        data_array.push(array);
      }
      data.addRows(data_array);

      // Set chart options
      var options = {'title':road,
      'width':500,
      'height':300,
      'colors':['#AA8DD8'],
        'backgroundColor':'#c4c1d4',

      vAxis: {
        gridlines: {
          color: 'transparent',
          interval: 0
        }

      },
      animation: {
        startup: true,
        duration: 3000
      }
    }

    elements = document.querySelectorAll(`.chart_div_${road}`)
    elements.forEach(element => {
      var chart = new google.visualization.ColumnChart(element);
      chart.draw(data, options)
    });

  }
}
}


export {drawChart}
