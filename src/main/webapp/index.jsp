<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
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
    <title>Document</title>
  </head>
  <body>

    <!-- navbar -->
    <div class="container mt-5">
      <div class="row align-items-center">
        <div class="col-6 pb-4">
          <a href="index.jsp"><img src="./img/logo.png" alt="" /></a>
        </div>
        <div class="col-6">
          <ul
            class="d-flex gap-5 d-flex align-items-center"
            style="list-style-type: none"
          >
            <li><a href="index.jsp" style="text-decoration: none">HOME</a></li>
            <li><a href="" style="text-decoration: none">ABOUT US</a></li>
            <li><a href="" style="text-decoration: none">SHORTCODE</a></li>
            <li><a href="" style="text-decoration: none">NEWS</a></li>
            <button
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target="#reg-modal"
            >
              Area personale
            </button>
          </ul>
        </div>
      </div>
    </div>

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
                  style="padding-bottom: 2.5rem; cursor: pointer"
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
                ></span
              >
            </div>
          </div>
        </div>
      </div>
    </form>

    <!-- swiper -->
    <div class="container">
      <div class="swiper" id="swiper-1">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="./img/1.jpg" alt="" class="w-100 rounded-2" />
          </div>
          <div class="swiper-slide">
            <img src="./img/2.jpg" alt="" class="w-100 rounded-2" />
          </div>
          <div class="swiper-slide">
            <img src="./img/3.jpg" alt="" class="w-100 rounded-2" />
          </div>
        </div>
      </div>
    </div>

    <!-- descrizione -->
    <div class="container">
      <div class="text-center mt-5 mb-2 py-5">
        <h2 class="text-muted" style="font-weight: bold">COURSE CATEGORIES</h2>
        <p class="text-secondary">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do <br />
          eiumod tempor incididunt ut labore et.
        </p>
        <i class="icofont icofont-hat-alt fs-3"></i>
      </div>
      <div class="row">
        <div class="col-md-3">
          <img src="./img/c1.png" alt="" class="mb-4" />
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
          <img src="./img/c2.png" alt="" class="mb-4" />
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
          <img src="./img/c3.png" alt="" class="mb-4" />
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
          <img src="./img/c4.png" alt="" class="mb-4" />
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
    <footer
      class="text-center text-lg-start bg-light text-muted pt-4 mt-5"
    >
      <section class="">
        <div class="container text-center text-md-start mt-5">
          <div class="row mt-3">
            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
              <h6 class="text-uppercase fw-bold mb-4">
                <i class="fas fa-gem me-3"></i>Company name
              </h6>
              <p>
                Here you can use rows and columns to organize your footer
                content. Lorem ipsum dolor sit amet, consectetur adipisicing
                elit.
              </p>
            </div>

            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
              <h6 class="text-uppercase fw-bold mb-4">Products</h6>
              <p>
                <a href="#!" class="text-reset">Angular</a>
              </p>
              <p>
                <a href="#!" class="text-reset">React</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Vue</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Laravel</a>
              </p>
            </div>

            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
              <h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
              <p>
                <a href="#!" class="text-reset">Pricing</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Settings</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Orders</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Help</a>
              </p>
            </div>

            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
              <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
              <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
              <p>
                <i class="fas fa-envelope me-3"></i>
                info@example.com
              </p>
              <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
              <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
            </div>
          </div>
        </div>
      </section>
      <div
        class="text-center p-4"
        style="background-color: rgba(0, 0, 0, 0.05)"
      >
        © 2021 Copyright:
        <strong>Itconsulting</strong>
      </div>
    </footer>
    
    
    
    

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="./js/script.js"></script>
  </body>
</html>
