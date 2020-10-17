function pullDown(){

  const login = document.getElementById("login")
  const signUp = document.getElementById("sign-up")

  login.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:#FFBEDA;")
  })
  login.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:#FFBEDA;")
  })

  signUp.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:#FFBEDA;")
  })
  signUp.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:#FFBEDA;")
  })

}

window.addEventListener('load', pullDown)