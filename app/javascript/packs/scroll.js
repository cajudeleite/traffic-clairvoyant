 const scrollListen = () => {
  if(window.location==='http://trafficlairvoyant.xyz') {
    $(window).bind('mousewheel', function (event) {
      if (event.originalEvent.wheelDelta >= 0) {
        console.log('Scroll up');
      }
      else {
        window.location.replace("http://trafficlairvoyant.xyz/trips");
      }
    });
  }
 };

 export {scrollListen};
