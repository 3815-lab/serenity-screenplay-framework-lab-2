# Automatización API PetStore

Este proyecto contiene las pruebas automatizadas para la API de PetStore (Ejercicio 2).

## Prerrequisitos
- Java 17
- Maven

## Estructura del Proyecto
- `src/test/java/com/sofka/petstore/features`: Contiene los archivos Feature de Karate.
- `src/test/java/com/sofka/petstore/runners`: Contiene el ejecutor de pruebas (Runner) de JUnit 5.
- `src/test/java/com/sofka/petstore/utils`: Contiene clases auxiliares de Java para la generación de datos.
- `src/test/java/com/sofka/petstore/data`: Contiene plantillas JSON para las peticiones.

## Cómo Ejecutar
Para ejecutar la prueba específica del ejercicio PetStore, ejecuta el siguiente comando en la terminal:

```bash
mvn test -Dtest=PetStoreTestRunner
```

El reporte de ejecución se generará en: `target/karate-reports/karate-summary.html`

## Integración Continua (CI)
Este proyecto cuenta con un flujo de trabajo de GitHub Actions configurado en `.github/workflows/maven.yml`.
- **Disparador**: Se ejecuta automáticamente en cada `push` o `pull_request` a la rama `master`.
- **Acción**: Configura el entorno Java 17 y ejecuta los tests automatizados con Maven.