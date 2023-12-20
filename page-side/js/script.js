console.log('teste')
function open() {
    document.body.style.display = "block";
  }
  
function close() {
    document.body.style.display = "none";
}


window.addEventListener("message", ({data}) => {
    console.log(data.action)
    if (data.action === "open") open();
    if (data.action === "close") close();
})