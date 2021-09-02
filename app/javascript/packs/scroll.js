 const scrollListen = () => {
   $(window).bind('mousewheel', function (event) {
     if (event.originalEvent.wheelDelta >= 0) {
       console.log('Scroll up');
     }
     else {
       window.location.replace("http://localhost:3000/trips");
     }
   });
 };

 export {scrollListen};
