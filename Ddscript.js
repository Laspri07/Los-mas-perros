let productos = [
    { id: 1, nombre: 'Hamburguesa Clásica', descripcion: 'Una hamburguesa con carne de res, lechuga, tomate y queso.', precio: '$5.00' },
    { id: 2, nombre: 'Perro Caliente', descripcion: 'Perro caliente con salchicha, mostaza y ketchup.', precio: '$3.00' },
    // Añade mas productos
];

// Mostrar Productos en el Menú
function mostrarMenu() {
    let cajamenuItemsDiv = document.getElementById('cajamenu-items');
    productos.forEach(producto => {
        let productoDiv = document.createElement('div');
        productoDiv.classList.add('cajamenu-item');
        productoDiv.innerHTML = `
            <h3>${producto.nombre}</h3>
            <p><strong>Descripción:</strong> ${producto.descripcion}</p>
            <p><strong>Precio:</strong> ${producto.precio}</p>
            <button onclick="elegirProducto(${producto.id})">Elegir</button>
        `;
        cajamenuItemsDiv.appendChild(productoDiv);
        //appendChild permite agregar un elemento a una lista en orden
    });
}

// Elegir Producto
function elegirProducto(id) {
    let producto = productos.find(p => p.id === id);
    if (producto) {
        document.getElementById('menu').style.display = 'none';
        document.getElementById('pedido').style.display = 'block';
        document.getElementById('pedido-form').setAttribute('data-producto', JSON.stringify(producto));
        //JSON es un formato de datos basado en texto. Se puede armar de forma local o externa
        //stringify permite volver un objeto en una cadena de texto con formato JSON
        //parse hace que una cadena de texto se vuelva un objeto JavaScript
    }
}



// Mostrar Resumen del Pedido
function mostrarResumen() {
    let producto = JSON.parse(document.getElementById('pedido-form').getAttribute('data-producto'));
    let papas = document.getElementById('papas').value;
    let salsa = document.getElementById('salsa').value;
    let carne = document.getElementById('carne').value;

    let resumen = `
        <h3>Producto Seleccionado:</h3>
        <p><strong>Nombre:</strong> ${producto.nombre}</p>
        <p><strong>Descripción:</strong> ${producto.descripcion}</p>
        <p><strong>Precio:</strong> ${producto.precio}</p>
        <p><strong>Papas Fritas Adicionales:</strong> ${papas}</p>
        <p><strong>Salsa:</strong> ${salsa}</p>
        <p><strong>Tipo de Carne:</strong> ${carne}</p>
    `;

    document.getElementById('resumen-details').innerHTML = resumen;
    document.getElementById('pedido').style.display = 'none';
    document.getElementById('resumen').style.display = 'block';
}

// Finalizar Compra
function finalizarCompra() {
    alert('¡Gracias por tu compra!');
    document.getElementById('resumen').style.display = 'none';
    document.getElementById('menu').style.display = 'block';
}
