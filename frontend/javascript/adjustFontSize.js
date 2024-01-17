function adjustFontSize() {
  let containers = document.querySelectorAll('.prevent-overflow');

  containers.forEach(function(container) {
      let computedStyle = window.getComputedStyle(container);
      let fontSize = parseFloat(computedStyle.fontSize);
      let maxFontSize = 180;

      container.style.fontSize = fontSize + 'px';

      // Decrease font size until the text fits
      // console.log("scrollHeight", container.scrollHeight, "x", "offsetHeight", container.offsetHeight)
      // console.log("scrollWidth", container.scrollWidth, "x", "offsetWidth", container.offsetWidth)
      console.log(fontSize)
      while (container.scrollHeight > container.offsetHeight || container.scrollWidth > container.offsetWidth) {
          fontSize--;
          container.style.fontSize = fontSize + 'px';

          if (fontSize <= 1) break; // Prevents an infinite loop
          if (fontSize >= maxFontSize) break; // Optional: Prevents font from becoming too large
      }
  });
}


window.addEventListener('load', adjustFontSize);
window.addEventListener('resize', adjustFontSize);
