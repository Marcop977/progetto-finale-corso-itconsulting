<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="model.Studente"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@icon/icofont@1.0.1-alpha.1/icofont.min.css"
    />
    <link rel="stylesheet" href="./css/style.css" />
    <title>Document</title>
  </head>
  <body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-scroll pb-4 pt-5">
      <div class="container">
        <img src="./img/logo.png" alt="" loading="lazy" />
        <button
          class="navbar-toggler ps-0"
          type="button"
          data-mdb-toggle="collapse"
          data-mdb-target="#navbarExample01"
          aria-controls="navbarExample01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span
            class="navbar-toggler-icon d-flex justify-content-start align-items-center"
          >
            <i class="fas fa-bars"></i>
          </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarExample01">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-3">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#pets">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#adoptions"
                >About Us</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#foundation"
                >Shortcode</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#help">News</a>
            </li>
            <li class="nav-item">
              <a class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#reg-modal"
						style="display: <%=(session.getAttribute("studente") != null && session.getAttribute("professore") != null) ? "none" : "block"%>;">
						Area personale</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- modal -->
    <form action="login" method="post">
      <div
        class="modal fade"
        id="reg-modal"
        tabindex="-1"
        aria-labelledby="modal-title"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content p-4">
            <div class="modal-header border-0 p-0">
              <h5 class="modal-title fs-1" id="modal-title">Sign In</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-mody py-4 mt-4">
              <div class="mb-3">
                <label for="modal-email" class="form-label">Username</label>
                <input
                  type="text"
                  class="form-control"
                  id="modal-email"
                  placeholder="Enter username"
                  name="username"
                />
              </div>
              <div class="mb-3">
                <label for="modal-email" class="form-label">Password</label>
                <input
                  type="password"
                  class="form-control"
                  id="modal-password"
                  placeholder="Enter Password"
                  name="password"
                />
                <i
                  class="bi bi-eye-slash position-absolute top-60 end-0 translate-middle-y me-5"
                  id="hiddenEye"
                  style="padding-bottom: 2.5rem; cursor: pointer; display: block"
                ></i>
              </div>
              <div
                id="campiFeedback"
                class="invalid-feedback"
                style="display: none"
              ></div>
            </div>
            <div class="modal-footer border-0 justify-content-start py-2 px-0">
              <button
                type="button"
                class="btn btn-secondary p-2 px-3"
                data-bs-dismiss="modal"
              >
                Close
              </button>
              <button type="submit" class="btn btn-primary p-2 px-3" id="login">
                Sign In
              </button>
            </div>
            <div class="pt-4 text-center">
              <span class="text-muted"
                >Don't have an account?
                <a
                  href="./registration.html"
                  class="text-primary"
                  style="text-decoration: none"
                  >Sign Up</a
                >
              </span>
            </div>
          </div>
        </div>
      </div>
    </form>

    <!-- swiper -->
      <div class="swiper" id="swiper-1">
        <div class="swiper-wrapper">
          <div class="swiper-slide relative">
            <img src="./img/slide-1.jpg" alt="" class="w-100" />
            <div class="overlay"></div>
            <div class="overlay-text text-center">
              <h3>The Best Learning Institution</h3>
              <h1 class="my-4">WELCOME TO OUR UNIVERSITY</h1>
              <p class="mb-5">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                Commodi, id!
              </p>
              <button class="btn btn-outline-primary text-light border-light">
                READ MORE
              </button>
            </div>
          </div>
          <div class="swiper-slide">
            <img src="./img/slide-2.jpg" alt="" class="w-100 rounded-2" />
            <div class="overlay"></div>
            <div class="overlay-text text-center">
              <h3>The Best Learning Institution</h3>
              <h1 class="my-4">WELCOME TO OUR UNIVERSITY</h1>
              <p class="mb-5">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                Commodi, id!
              </p>
              <button class="btn btn-outline-primary text-light border-light">
                READ MORE
              </button>
            </div>
          </div>
          <div class="swiper-slide">
            <img src="./img/slide-3.jpg" alt="" class="w-100 rounded-2" />
            <div class="overlay"></div>
            <div class="overlay-text text-center">
              <h3>The Best Learning Institution</h3>
              <h1 class="my-4">WELCOME TO OUR UNIVERSITY</h1>
              <p class="mb-5">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                Commodi, id!
              </p>
              <button class="btn btn-outline-primary text-light border-light">
                READ MORE
              </button>
            </div>
          </div>
        </div>

        <div class="swiper-pagination"></div>
      </div>

    <!-- descrizione -->
    <div class="container pb-5 mb-5">
      <div class="text-center mt-5 mb-2 py-5">
        <h2 class="text-muted" style="font-weight: bold">COURSE CATEGORIES</h2>
        <p class="text-secondary">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do <br />
          eiumod tempor incididunt ut labore et.
        </p>
        <div
          class="d-flex align-items-center justify-content-center gap-2 text-muted"
        >
          <div class="d-inline-block line"></div>
          <i class="icofont icofont-hat-alt fs-4"></i>
          <div class="d-inline-block line"></div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3">
          <img src="./img/icona-1.png" alt="" class="mb-4" />
          <h5 class="mb-3">
            <a href="" style="text-decoration: none" class="text-muted"
              >SCIENCE & TECHNOLOGY</a
            >
          </h5>
          <small class="text-secondary">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
            molestias molestiae vero vel libero voluptate.
          </small>
        </div>
        <div class="col-md-3">
          <img src="./img/icona-2.png" alt="" class="mb-4" />
          <h5 class="mb-3">
            <a href="" style="text-decoration: none" class="text-muted"
              >HEALTH & PSYCHOLOGY</a
            >
          </h5>
          <small class="text-secondary">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
            molestias molestiae vero vel libero voluptate.
          </small>
        </div>
        <div class="col-md-3">
          <img src="./img/icona-3.png" alt="" class="mb-4" />
          <h5 class="mb-3">
            <a href="" style="text-decoration: none" class="text-muted"
              >BUSINESS & ACCOUNTING</a
            >
          </h5>
          <small class="text-secondary">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
            molestias molestiae vero vel libero voluptate.
          </small>
        </div>
        <div class="col-md-3">
          <img src="./img/icona-4.png" alt="" class="mb-4" />
          <h5 class="mb-3">
            <a href="" style="text-decoration: none" class="text-muted"
              >REAL ESTATE LAW</a
            >
          </h5>
          <small class="text-secondary">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error
            molestias molestiae vero vel libero voluptate.
          </small>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="text-start text-light" style="background-color: #002046">
      <div class="container p-5">
        <div class="row p-5">
          <div class="col-lg-3">
            <a href=""><img src="./img/logo-2.png" alt="" /></a>
            <small class="d-block mt-3 mb-2" style="line-height: 1.8">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est,
              perferendis aperiam! Adipisci voluptatum similique corporis.
            </small>
            <a href=""><i class="bi bi-facebook fs-5"></i></a>
            <a href=""><i class="bi bi-twitter ms-3 fs-5"></i></a>
            <a href=""><i class="bi bi-instagram ms-3 fs-5"></i></a>
            <a href=""><i class="bi bi-whatsapp ms-3 fs-5"></i></a>
          </div>
          <div class="col-lg-2">
            <h5>Quick Links</h5>
            <ul class="p-0" style="line-height: 2">
              <li>
                <small><a href="">Home</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
            </ul>
          </div>
          <div class="col-lg-2">
            <h5>Pages</h5>
            <ul class="p-0" style="line-height: 2">
              <small><a href="">Home</a></small>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
            </ul>
          </div>
          <div class="col-lg-5">
            <h5>Contact Us</h5>
            <div class="d-flex gap-3 mb-2 mt-3">
              <input
                type="text"
                placeholder="Name*"
                class="custom-input py-2"
              />
              <input
                type="text"
                placeholder="Email*"
                class="custom-input py-2"
              />
            </div>
            <input
              type="text"
              placeholder="Message*"
              class="custom-input pb-4"
              style="width: 83.8%"
            />
            <button type="button" class="btn btn-primary d-block mt-4 px-4">
              SEND
            </button>
          </div>
        </div>
      </div>
      <div class="bg-light py-3">
        <div class="row">
          <div class="col-12 text-center">
            <p class="text-dark m-0">
              © 2024 Copyright: <strong>Itconsulting</strong>
            </p>
          </div>
        </div>
      </div>
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="./js/script.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			document.getElementById("btnArea").addEventListener("click",
					function() {
	<%if (session.getAttribute("studente") != null) {%>
		
	<%request.setAttribute("tabellaAttiva", 1);%>
		location.href = "studente.jsp";
	<%} else if (session.getAttribute("professore") != null) {%>
		location.href = "professore.jsp";
	<%}%>
		});

			document.getElementById("btnLogout").addEventListener("click",
					function() {
	<%session.removeAttribute("studente");%>
		
	<%session.removeAttribute("professore");%>
		});
		})
	</script>
</body>
</html>