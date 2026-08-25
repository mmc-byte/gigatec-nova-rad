# Gigatec Nova: Sistema de Gestión de Productos
Aplicación de escritorio desarrollada en Java y JavaFX para la gestión de productos de una tienda de tecnología, conectada a MySQL mediante JDBC.
## Descripción
Esta es una aplicación de escritorio para la gestión del catálogo de productos de una tienda de tecnología. Permite consultar, registrar, modificar y desactivar productos mediante una interfaz gráfica conectada directamente a una base de datos MySQL. El proyecto se desarrolla de manera incremental dándole peso a la entrega temprana de funcionalidades utilizables.  Presenta un negocio ficticio, pero modelado con base en *negocios reales* del rubro. Gigatec Nova es un e-commerce que vende productos tecnológicos y está conformado por una sola tienda.
## Stack
* Java 25: Elegido por ser el más reciente LTS.
* Java FX: Para tener una interfaz atractiva para el usuario no técnico.
* Maven: Gestión de dependencias y build.
* MySQL 8 (con el JDBC): Provee modelado relacional.
* Docker: Entorno reproducible para la base de datos.
* JUnit: Para pruebas automatizadas.
* Git: Control de versiones e historial incremental
  Opté inicialmente por JDBC en lugar de un ORM para mantener explícito el acceso a datos y reducir la complejidad del proyecto, dado que el objetivo principal era demostrar la construcción de una aplicación CRUD funcional.

## Arquitectura
Arquitectura por capas con separación de responsabilidades, inspirada en MVC.
A diferencia de MVC clásico, agrega una capa Service y una DAO. Le di prioridad a que sea sencillo pero que facilite el mantenimiento y permita cambios en iteraciones rápidas.

## Enfoque Rapid Application Development (RAD): Iteraciones
Actualmente, el proyecto se encuentra en la iteración 1.
### Base técnica
No una iteración, previo a ello.
* Configuración del entorno (JDK, Maven, contenedor de Docker).
* Diseño y creación de la base de datos.
* Conexión JDBC.
* Estructura inicial del proyecto.

### Iteración 1 'Consulta de productos '
Aquí el negocio debe poder usar el sistema para ver la lista de productos de su catálogo, además consultar marcas, SKU, precio y stock.
* Modelo Product.
* Acceso a datos.
* Listado de productos.
* Visualización en JavaFX.

### Iteración 2 'CRUD básico'
El negocio ha de contar con un CRUD básico para sus productos con creación de nuevos productos, modificación y poder 'eliminarlos' (que en realidad es desactivarlos puesto que se está aplicando un soft delete).

### Iteración 3 Mejorar usabilidad
* Búsqueda.
* Filtros.
* Mensajes de éxito/error.
* Mejoras de interacción.

### Iteración 4 'Refinamiento'
* Mejor diseño visual (para lo que se usa JavaFX)
* Manejo de errores.
* Tests.

Las iteraciones se ajustarían durante el desarrollo según problemas encontrados y retroalimentación obtenida.

## Roadmap
### Implementado
- [x] Conexión MySQL
- [x] Consulta de productos
- [x] CRUD de productos
- [x] Validaciones

### Próximas mejoras
- [ ] Búsqueda
- [ ] Procedimientos almacenados e índices
- [ ] Gestión de inventario
- [ ] Gestión de marcas y categorías
- [ ] Autenticación de usuarios
- [ ] Reportes
- [ ] Gestión de pedidos

### Exploración futura
- [ ] Migración a ORM
- [ ] API REST
- [ ] Aplicación web