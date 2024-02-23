let btnsBack = document.querySelectorAll(".btnBack");

btnsBack.forEach(function (btnBack) {
  btnBack.addEventListener("click", function () {
    window.history.back();
  });
});
