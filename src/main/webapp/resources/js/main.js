document.addEventListener("DOMContentLoaded", () => {
  const header = document.querySelector(".trajecto-header");

  if (header) {
    window.addEventListener("scroll", () => {
      if (window.scrollY > 40) {
        header.style.boxShadow = "0 4px 20px rgba(0, 0, 0, 0.08)";
      } else {
        header.style.boxShadow = "none";
      }
    });
  }

  console.log(
    "%c Trajecto Rail Engine Initialized Successfully 🚆 ",
    "background: #38bdf8; color: #090d16; padding: 4px 8px; border-radius: 4px; font-weight: bold;",
  );
});
