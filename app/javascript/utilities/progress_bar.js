document.addEventListener('turbolinks:load', () => {
  var progressBar = document.querySelector('.bar')
  var progress = `${progressBar.dataset.percentage}`
  
  if (progressBar) {
    progressBar.style.width = progress + '%'
    progressBar.style.backgroundColor = "hsl("+ progress +",100%,50%)"
  }
})
