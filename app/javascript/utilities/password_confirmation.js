document.addEventListener('turbolinks:load', function() {
  var passwordConfirmation = document.querySelector('#user_password_confirmation')

  if (passwordConfirmation) { passwordConfirmation.addEventListener('input', comparePasswords) }
})

function comparePasswords() {
  var password = document.querySelector('#user_password')

  if (!this.value) {
    this.parentElement.querySelector('.octicon-check').classList.add('hide')
    this.parentElement.querySelector('.octicon-alert').classList.add('hide')
  }
  else if (this.value == password.value) {
    this.parentElement.querySelector('.octicon-check').classList.remove('hide')
    this.parentElement.querySelector('.octicon-alert').classList.add('hide')
  }
  else {
    this.parentElement.querySelector('.octicon-check').classList.add('hide')
    this.parentElement.querySelector('.octicon-alert').classList.remove('hide')
  }

}
