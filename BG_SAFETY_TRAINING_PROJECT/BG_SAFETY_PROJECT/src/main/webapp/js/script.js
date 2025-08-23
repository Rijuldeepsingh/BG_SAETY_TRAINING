// Basic helpers for your JSP pages

// Confirm delete clicks on links with data-confirm
document.addEventListener("click", function (e) {
  const el = e.target.closest("[data-confirm]");
  if (!el) return;
  const msg = el.getAttribute("data-confirm") || "Are you sure?";
  if (!confirm(msg)) {
    e.preventDefault();
  }
});

// Simple required-field validation for forms with data-validate="required"
document.addEventListener("submit", function (e) {
  const form = e.target;
  if (form.getAttribute("data-validate") !== "required") return;

  const empty = Array.from(form.querySelectorAll("input[required], select[required]"))
    .find(f => !String(f.value).trim());

  if (empty) {
    e.preventDefault();
    empty.focus();
    alert("Please fill all required fields.");
  }
});

// Flash message auto-hide (elements with .flash)
document.addEventListener("DOMContentLoaded", function () {
  setTimeout(() => {
    document.querySelectorAll(".flash").forEach(el => el.style.display = "none");
  }, 3500);
});
