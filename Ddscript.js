

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


/* Carrito y compras*/
// Selecciona los elementos necesarios
let products = document.querySelectorAll('.product');
let cartItems = document.getElementById('cart-items');
let totalPriceElement = document.getElementById('total-price');
let clearCartButton = document.getElementById('clear-cart');
let checkoutButton = document.getElementById('checkout');
let confirmation = document.getElementById('confirmation');

// Variable para almacenar los productos en el carrito
let cart = [];

// Función para actualizar el carrito
function updateCart() {
    // Limpia la lista de elementos
    cartItems.innerHTML = '';

    let total = 0;

    // Itera sobre los productos del carrito y los muestra
    cart.forEach((item, index) => {
        let li = document.createElement('li');
        li.textContent = `${item.name} - $${item.price}`;
        
        // Botón para eliminar el producto
        let removeButton = document.createElement('button');
        removeButton.textContent = 'Eliminar';
        removeButton.classList.add('delete-button'); 
        removeButton.addEventListener('click', () => {
            removeFromCart(index);
        });

        li.appendChild(removeButton);
        cartItems.appendChild(li);

        // Calcula el total
        total += item.price;
    });

    // Muestra el precio total
    totalPriceElement.textContent = total.toFixed(2);
}

// Función para agregar productos al carrito
function addToCart(product) {
    let id = product.getAttribute('data-id');
    let name = product.getAttribute('data-name');
    let price = parseFloat(product.getAttribute('data-price'));

    // Agrega el producto al array del carrito
    cart.push({ id, name, price });

    // Actualiza el carrito visualmente
    updateCart();
}

// Función para eliminar productos del carrito
function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

// Función para vaciar el carrito
function clearCart() {
    cart = [];
    updateCart();
}

// Función para finalizar la compra
function checkout() {
    if (cart.length === 0) {
        alert('Tu carrito está vacío.');
        return;
    }

    // Muestra una alerta de compra exitosa
    alert('Compra exitosa. ¡Gracias por tu compra!');

    // Limpia el carrito
    clearCart();
}

// Añadir eventos a los botones de "Agregar al Carrito"
products.forEach(product => {
    let button = product.querySelector('.add-to-cart');
    button.addEventListener('click', () => {
        addToCart(product);
    });
});

// Añadir evento al botón de "Vaciar Carrito"
clearCartButton.addEventListener('click', clearCart);

// Añadir evento al botón de "Finalizar Compra"
checkoutButton.addEventListener('click', checkout);

/* Funcion de sub pagina */
function toggleCart() {
    const cart = document.getElementById('cartContainer');
    cart.classList.toggle('open');
}
