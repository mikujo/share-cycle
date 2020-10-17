function pullDown(){

  const pullDownButton = document.getElementById("lists")
  const pullDownContent = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "color:#FFBEDA;")
  })
  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "color:#FFBEDA;")
  })

  pullDownButton.addEventListener('click', function(){
    if (pullDownContent.getAttribute("style") == "display:block;") {
      pullDownContent.removeAttribute("style", "display:block;")
    } else {
      pullDownContent.setAttribute("style", "display:block;")
    }
  })

}

window.addEventListener('load', pullDown)