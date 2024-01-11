var categoryTitles = document.querySelectorAll('.break-on-amp');

categoryTitles.forEach(function(title){
  let htmlContent = title.innerHTML;
  htmlContent = htmlContent.replace(/ &amp; /g, '<br>&amp;&nbsp;');
  title.innerHTML = htmlContent;
})