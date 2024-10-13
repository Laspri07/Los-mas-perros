// Simulación de base de datos de usuarios con sus nombres y número de compras
let usuarios = [
  { id: 1, nombre: "Juan", cachos: 15 },
  { id: 2, nombre: "Ana", cachos: 20 },
  { id: 3, nombre: "Luis", cachos: 18 },
  { id: 4, nombre: "Marta", cachos: 10 },
  { id: 5, nombre: "Carlos", cachos: 8 },
  { id: 6, nombre: "Lucía", cachos: 12 },
  { id: 7, nombre: "Pedro", cachos: 22 },
  { id: 8, nombre: "María", cachos: 17 },
  { id: 9, nombre: "Elena", cachos: 14 },
  { id: 10, nombre: "Diego", cachos: 19 }
];

// Función para ordenar los usuarios por número de cachos y mostrarlos en el ranking
function actualizarRanking() {
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
        <span>${index + 1}. ${usuario.nombre}</span>
      </div>
      <span class="cachos">${usuario.cachos} Cachos</span>
    `;

    rankingList.appendChild(listItem);
  });
}

// Llamar a la función para mostrar el ranking al cargar la página
window.onload = actualizarRanking;
