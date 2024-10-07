var swiper1 = new Swiper (".mySwiper-1", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    }
});

var swiper2 = new Swiper (".mySwiper-2", {
    slidesPerView: 3,
    spaceBetween: 20,
    loop: true,
    loopFillGroupWithBlank: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    breakpoints: {
        0: {
            slidesPerView: 1,
        },
        520: {
            slidesPerView: 2,
        },
        950: {
            slidesPerView: 3,
        }
    }
});

let tabInputs = document.querySelectorAll(".tabInput");

tabInputs.forEach(function(input) {
    input.addEventListener('change', function(){
        let id = input.dataset.id;  // Asume que tienes un atributo data-id en los inputs
        let thisSwiper = document.getElementById('swiper' + id);
        thisSwiper.swiper.update();
    });
});



/*Empieza codigo de esconder sesion */
const accountIcon = document.getElementById('account-icon');
const dropdownMenu = document.getElementById('dropdown-menu');

accountIcon.addEventListener('click', () => {
    dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
});

// Cierra el menú desplegable si haces clic fuera del ícono o del menú
window.addEventListener('click', (event) => {
    if (!event.target.matches('#account-icon')) {
        dropdownMenu.style.display = 'none';
    }
});
