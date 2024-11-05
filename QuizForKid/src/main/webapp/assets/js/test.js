// Get all carousel indicator buttons
const indicators = document.querySelectorAll(".carousel-indicators button");

// Function to update the indicator colors
function updateIndicatorColors(activeIndex) {
  indicators.forEach((btn, index) => {
    if (index === activeIndex) {
      btn.classList.add("active");
      btn.classList.remove("bg-white");
    } else {
      btn.classList.remove("active");
      btn.classList.add("bg-white");
    }
  });
}

// Add click event listener to each indicator
indicators.forEach((indicator, index) => {
  indicator.addEventListener("click", () => {
    updateIndicatorColors(index);
  });
});

// Add event listener to handle slide change via prev/next buttons
document
  .getElementById("carouselExampleIndicators")
  .addEventListener("slid.bs.carousel", function (event) {
    const activeIndex = event.to;
    updateIndicatorColors(activeIndex);
  });
