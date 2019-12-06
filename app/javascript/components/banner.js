import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Unique trading experience", "Shipping to and from anywhere"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
