function adjustFontSize() {
  let containers = document.querySelectorAll('.prevent-overflow');

  containers.forEach(function(container) {
      let computedStyle = window.getComputedStyle(container);
      let fontSize = parseFloat(computedStyle.fontSize);
      let maxFontSize = 180;

      container.style.fontSize = fontSize + 'px';

      while (container.scrollWidth > container.offsetWidth) { //container.scrollHeight > container.offsetHeight || 
          fontSize--;
          container.style.fontSize = fontSize + 'px';

          if (fontSize <= 1) break; // Prevents an infinite loop
          if (fontSize >= maxFontSize) break; // Optional: Prevents font from becoming too large
      }
  });
}


window.addEventListener('load', adjustFontSize);
window.addEventListener('resize', adjustFontSize);
