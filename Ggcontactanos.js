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
/*termina codigo tu cuenta */
