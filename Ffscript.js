document.addEventListener("DOMContentLoaded", function () {
  // Selecciona el elemento donde se mostrará el ranking
  const rankingList = document.getElementById("ranking-list");

  // Función para obtener el ranking desde el servidor
  function obtenerRanking() {
    fetch('Fftopcachones.php')
    .then(response => {
        if (!response.ok) {
            throw new Error('Error al cargar el ranking');
        }
        return response.text(); // Cambiar a text()
    })
    .then(data => {
        const rankingList = document.getElementById('ranking-list');
        rankingList.innerHTML = data; // Inserta el HTML directamente
    })
    .catch(error => {
        console.error('Error al obtener el ranking:', error);
    });

  }

  // Llama a la función para obtener el ranking al cargar la página
  obtenerRanking();
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


