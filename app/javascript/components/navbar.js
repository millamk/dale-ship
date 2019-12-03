const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-banner');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 530) {
        navbar.classList.add('navbar-banner-white');
      } else {
        navbar.classList.remove('navbar-banner-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
