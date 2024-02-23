document.addEventListener("DOMContentLoaded", function () {
  let btnsBack = document.querySelectorAll(".btnBack");
  btnsBack.forEach(function (btnBack) {
    btnBack.addEventListener("click", function () {
      console.log("ciao");
      window.history.back();
    });
  });
});

const alertAggiunto = document.querySelector(".alertAggiunto");
const appelloData = Array.from(document.querySelectorAll(".appelloData"));
const addAppello = Array.from(document.querySelectorAll(".addAppello"));

addAppello.forEach((button, index) => {
  button.addEventListener("click", function (e) {
    const appello = appelloData[index];
    if (appello.value === "") {
      e.preventDefault();
      appello.style.border = "1px solid red";
      setTimeout(() => {
        appello.style.border = "none";
        appello.style.borderBottom = "1px solid grey";
      }, 2000);
    }
  });
});
