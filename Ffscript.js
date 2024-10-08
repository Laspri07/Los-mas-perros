// Simulación de base de datos de usuarios con sus fotos y número de compras
let usuarios = [
    { id: 1, nombre: "Juan", imagen: "https://via.placeholder.com/50", cachos: 15 },
    { id: 2, nombre: "Ana", imagen: "https://via.placeholder.com/50", cachos: 20 },
    { id: 3, nombre: "Luis", imagen: "https://via.placeholder.com/50", cachos: 18 },
    { id: 4, nombre: "Marta", imagen: "https://via.placeholder.com/50", cachos: 10 },
    { id: 5, nombre: "Carlos", imagen: "https://via.placeholder.com/50", cachos: 8 },
    { id: 6, nombre: "Lucía", imagen: "https://via.placeholder.com/50", cachos: 12 },
    { id: 7, nombre: "Pedro", imagen: "https://via.placeholder.com/50", cachos: 22 },
    { id: 8, nombre: "María", imagen: "https://via.placeholder.com/50", cachos: 17 },
    { id: 9, nombre: "Elena", imagen: "https://via.placeholder.com/50", cachos: 14 },
    { id: 10, nombre: "Diego", imagen: "https://via.placeholder.com/50", cachos: 19 }
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
  
      // Incluir el emoji de la corona solo para los primeros 3 puestos
      const coronaEmoji = index < 3 ? '<span class="corona">👑</span>' : '';
  
      listItem.innerHTML = `
        <div class="info">
          <img src="${usuario.imagen}" alt="Foto de ${usuario.nombre}">
          ${coronaEmoji}
          <span>${index + 1}. ${usuario.nombre}</span>
        </div>
        <span class="cachos">${usuario.cachos} Cachos</span>
      `;
  
      rankingList.appendChild(listItem);
    });
  }
  
  // Llamar a la función para mostrar el ranking al cargar la página
  window.onload = actualizarRanking;
  