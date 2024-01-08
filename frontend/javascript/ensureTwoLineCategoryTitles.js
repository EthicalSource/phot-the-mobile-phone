var categoryTitles = document.querySelectorAll('.default .category-title');

categoryTitles.forEach(function(title){
  var htmlContent = title.innerHTML;
  console.log(htmlContent);
  htmlContent = htmlContent.replace(/ &amp; /g, '<br>&amp;&nbsp;');
  title.innerHTML = htmlContent;
})