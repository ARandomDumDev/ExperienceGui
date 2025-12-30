// Passcode guard
const passcode = "CoolDownExperience";
const authBtn = document.getElementById("auth-btn");
const authError = document.getElementById("auth-error");
authBtn.addEventListener("click", () => {
  const input = document.getElementById("pass").value;
  if (input === passcode) {
    document.getElementById("auth-screen").classList.add("hidden");
    document.getElementById("main-content").classList.remove("hidden");
    initScrollReveal();
    loadDownloadLinks();
  } else {
    authError.textContent = "Incorrect passcode 😔";
  }
});

// Scroll reveal logic
function initScrollReveal() {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
      }
    });
  }, { threshold: 0.15 });

  document.querySelectorAll(".reveal").forEach(el => {
    observer.observe(el);
  });
}

// Load download links from JSON
async function loadDownloadLinks() {
  try {
    const res = await fetch("downloads.json");
    const data = await res.json();
    document.querySelectorAll(".dl-btn").forEach(btn => {
      const key = btn.dataset.key;
      btn.addEventListener("click", () => {
        const url = data[key];
        if (url) window.location.href = url;
      });
    });
  } catch (err) {
    console.error("Failed to load downloads", err);
  }
}
