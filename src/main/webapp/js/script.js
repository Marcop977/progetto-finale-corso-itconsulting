new Swiper("#swiper-1", {
    effect: "fade",
	autoplay: {
		delay: 4000,
	},
	loop: true,
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
});

const userPassword = document.querySelector("#modal-password");
const hiddenEye = document.querySelector("#hiddenEye");

hiddenEye.addEventListener("click", function() {
	const type = userPassword.getAttribute("type") === "password" ? "text" : "password";
	hiddenEye.classList.toggle("bi-eye");
	userPassword.setAttribute("type", type);
});

