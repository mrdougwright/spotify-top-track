(function() {
  var form = document.getElementsByTagName('form')[0]
  var btn = document.getElementById('submit_button')
  btn.addEventListener('click', function(e){
    e.preventDefault()
    let name  = form.elements[0].value
    let phone = form.elements[1].value
    fetch(`/send_text?name=${name}&phone=${phone}`, {
      'method': 'POST'
    }).then(function(resp) {
      return resp.json()
    }).then(function(data) {
      if (data.msg_sent) {
        alert('Text Message Sent!')
        form.submit()
      } else {
        alert('Something went wrong!')
      }
    }).catch(function(err) {
      console.log("Error with fetching artist and sending text: ", err)
    })
  })
})()
