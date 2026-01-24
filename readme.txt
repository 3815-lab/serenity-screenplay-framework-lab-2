AUTOMATIZACION API PETSTORE - EJERCICIO 2
=========================================

DESCRIPCION GENERAL
-------------------
Este proyecto consiste en pruebas automatizadas para la API de "PetStore" (https://petstore.swagger.io/). La implementación utiliza el framework Karate DSL con Java, permitiendo validar completitud el ciclo de vida de una mascota: creación, consulta, actualización y búsqueda.

PRERREQUISITOS
--------------
Para ejecutar este proyecto, asegúrese de tener instalado:
- Java 17 o superior.
- Maven 3.8 o superior.

INSTRUCCIONES DE EJECUCION (PASO A PASO)
----------------------------------------

1. Clonar o descargar el proyecto:
   Asegúrese de estar en la carpeta raíz del proyecto (donde se encuentra el archivo pom.xml).

2. Abrir una terminal:
   Ubíquese en la ruta del proyecto.

3. Ejecutar las pruebas:
   Corra el siguiente comando para ejecutar el runner específico del ejercicio:
   
   mvn test -Dtest=PetStoreTestRunner
   
4. Ver los reportes:
   Una vez finalizada la ejecución, Karate genera un reporte detallado en HTML. Puede encontrarlo en:
   target/karate-reports/karate-summary.html

5. Integración Continua (CI):
   Este proyecto cuenta con una pipeline de GitHub Actions configurada (.github/workflows/maven.yml). 
   - Ejecución automática: Los tests se ejecutan automáticamente en cada push o pull_request a la rama master.
   - Artefactos: Los reportes de Karate se cargan automáticamente como artefactos del build ("karate-reports") y se retienen por 5 días.

DECISIONES DE ARQUITECTURA
--------------------------
- Karate DSL: Se eligió por su simplicidad para pruebas de API y su capacidad de combinar testing y assertions en un solo archivo.
- Generación Dinámica de Datos: Se implementó la clase `PetDataGenerator` para evitar conflictos de datos (IDs duplicados), simulando un entorno más real y robusto.
- Templates JSON: Se externalizaron los cuerpos de las peticiones (`pet_request.json`) para mantener los archivos `.feature` limpios y legibles.
- Modularidad: El código está organizado en paquetes (`features`, `runners`, `utils`, `data`) facilitando la mantenibilidad.