// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()

// content = ""
// content += ('<tr><th scope="row">' + "444" + '</th>')
// content += ('<td>' + "무명이" + '</td>')
// content += ('<td>' + "미배정" + '</td>')
// content += ('<td>' + "미배정" + '</td></tr>')
// document.querySelector('#user-list table tbody').innerHTML = content
