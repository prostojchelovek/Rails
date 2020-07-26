document.addEventListener("turbolinks:load", function() {
  var form = document.querySelector('.test-passage')

  if (form) {
    var timer = document.querySelector('.timer')
    var timeLeft = parseInt(form.dataset.timeLeft)
    setInterval(function() {
      timer.innerHTML = Math.floor(timeLeft / 60) + ":" + (timeLeft % 60)
      timeLeft -= 1
      if (timeLeft == 0) { form.submit() }
    }, 1000)
  }
})
