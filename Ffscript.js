// Función para obtener los datos del ranking desde el PHP
async function obtenerRanking() {
  try {
    const response = await fetch('Fftopcachones.php'); // Asegúrate de que la ruta sea correcta
    const usuarios = await response.json(); // Se espera que el PHP retorne datos en formato JSON
    actualizarRanking(usuarios);
  } catch (error) {
    console.error('Error al obtener el ranking:', error);
  }
}

// Función para ordenar los usuarios por número de cachos y mostrarlos en el ranking
function actualizarRanking(usuarios) {
  const rankingList = document.getElementById('ranking-list');
  rankingList.innerHTML = ''; // Limpiar el contenido actual

  // Ordenar por cachos de mayor a menor
  usuarios.sort((a, b) => b.cachos - a.cachos);

  // Iterar por los primeros 10 usuarios
  usuarios.slice(0, 10).forEach((usuario, index) => {
    const listItem = document.createElement('li');
    listItem.classList.add('ranking-item');

    listItem.innerHTML = `
      <div class="info">
        <span>${index + 1}. ${usuario.Nombre} ${usuario.Apellido}</span>
      </div>
      <span class="cachos">${usuario.cachos} Cachos</span>
    `;

    rankingList.appendChild(listItem);
  });
}

// Llamar a la función para obtener y mostrar el ranking al cargar la página
window.onload = obtenerRanking;


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