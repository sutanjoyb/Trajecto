<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trajecto: The Smartest Line from A to B</title>

    <link
      href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;600;700&family=Inter:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/style.css"
    />

    <style>
      body {
        font-family: "Inter", sans-serif;
        background-color: #070a10;
        color: #f8fafc;
        margin: 0;
        padding: 0;
      }

      h1,
      h2,
      h3,
      .logo span {
        font-family: "Cinzel", serif;
      }

      .btn-primary {
        background: rgba(255, 255, 255, 0.08) !important;
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.25) !important;
        color: #ffffff !important;
        padding: 0.75rem 2rem;
        border-radius: 10px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        transition: all 0.3s ease;
        box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
      }

      .btn-primary:hover {
        background: rgba(255, 255, 255, 0.18) !important;
        border-color: rgba(255, 255, 255, 0.5) !important;
        transform: translateY(-2px);
        box-shadow: 0 12px 40px 0 rgba(0, 0, 0, 0.45);
      }

      .gradient-text {
        background: linear-gradient(135deg, #ffffff 0%, #94a3b8 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
      }

      .social-links a,
      .logo i {
        color: #e2e8f0 !important;
        transition: color 0.2s ease;
      }

      .social-links a:hover {
        color: #ffffff !important;
      }
    </style>
  </head>
  <body>
    <header class="trajecto-header">
      <div class="nav-container">
        <div class="logo">
          <i class="fa-solid fa-train-subway"></i>
          <span>Trajecto</span>
        </div>
        <div class="nav-actions">
          <a href="login" class="btn btn-primary">Login / Register</a>
        </div>
      </div>
    </header>

    <section id="hero" class="hero-section">
      <div class="hero-overlay"></div>
      <div class="hero-content">
        <h1>
          Trajecto: The Smartest Line <br /><span class="gradient-text"
            >from A to B</span
          >
        </h1>
        <p>
          Experience seamless reservations, real-time tracking, and
          lightning-fast booking engineered for modern travelers. Please log in
          or register to book your train tickets.
        </p>
        <div style="margin-top: 1.5rem">
          <a href="login" class="btn btn-primary" style="font-size: 1rem"
            >Get Started</a
          >
        </div>
      </div>
    </section>

    <section
      id="about"
      style="
        padding: 5rem 2rem;
        background: rgba(10, 16, 28, 0.6);
        text-align: center;
      "
    >
      <div class="container" style="max-width: 800px; margin: 0 auto">
        <h2
          style="
            font-size: 2.2rem;
            margin-bottom: 1rem;
            font-weight: 700;
            color: #fff;
          "
        >
          About Trajecto
        </h2>
        <p style="color: #94a3b8; font-size: 1.05rem; line-height: 1.6">
          Trajecto is a modern, lightweight railway reservation system built
          using Spring MVC. Designed to provide a streamlined experience, it
          empowers travelers to manage journeys, view secure PNR-generated
          tickets, and experience efficient scheduling in a clean environment.
        </p>
      </div>
    </section>

    <section id="contact" style="padding: 5rem 2rem; text-align: center">
      <div class="container" style="max-width: 800px; margin: 0 auto">
        <h2
          style="
            font-size: 2.2rem;
            margin-bottom: 1rem;
            font-weight: 700;
            color: #fff;
          "
        >
          Get in Touch
        </h2>
        <p
          style="
            color: #94a3b8;
            font-size: 1.05rem;
            line-height: 1.6;
            margin-bottom: 1.5rem;
          "
        >
          Have questions or want to explore the source code? Connect via the
          developer profiles below.
        </p>
        <div
          class="social-links"
          style="
            font-size: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
          "
        >
          <a href="https://www.github.com/sutanjoyb" target="_blank"
            ><i class="fa-brands fa-github"></i
          ></a>
          <a href="https://www.twitter.com/sutanjoyb" target="_blank"
            ><i class="fa-brands fa-twitter"></i
          ></a>
          <a href="https://www.linkedin.com/in/bsutanjoy" target="_blank"
            ><i class="fa-brands fa-linkedin"></i
          ></a>
        </div>
      </div>
    </section>

    <footer class="trajecto-footer">
      <div class="container footer-content">
        <p>&copy; Built by: Sutanjoy Bhattacharjee</p>
        <div class="social-links">
          <a href="https://www.github.com/sutanjoyb" target="_blank"
            ><i class="fa-brands fa-github"></i
          ></a>
          <a href="https://www.twitter.com/sutanjoyb" target="_blank"
            ><i class="fa-brands fa-twitter"></i
          ></a>
          <a href="https://www.linkedin.com/in/bsutanjoy" target="_blank"
            ><i class="fa-brands fa-linkedin"></i
          ></a>
        </div>
      </div>
    </footer>

    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  </body>
</html>
