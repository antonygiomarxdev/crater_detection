
# Proyecto de Detección de Cráteres

Este proyecto utiliza **inteligencia artificial** y análisis de imágenes geoespaciales para detectar posibles áreas de impacto de meteoritos. Aprovecha bibliotecas como **TensorFlow** y **rasterio** para el análisis de datos de elevación y la identificación de cráteres en imágenes satelitales.

## Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Uso](#uso)
- [Endpoints de la API](#endpoints-de-la-api)
- [Notas sobre Problemas de Compatibilidad](#notas-sobre-problemas-de-compatibilidad)
- [Contribución](#contribución)

---

## Requisitos

- Python 3.9
- [GDAL](https://gdal.org/download.html) (para rasterio en Windows)
- pip o Conda (para gestionar dependencias)
- Docker (opcional, para evitar conflictos de dependencias)

## Instalación

### Opción 1: Instalación con Conda (Recomendado para Windows)

1. Crea y activa un entorno con Conda:
   ```bash
   conda create -n crater_env python=3.9
   conda activate crater_env
   ```

2. Instala las dependencias del proyecto:
   ```bash
   conda install -c conda-forge gdal rasterio
   pip install tensorflow==2.10.0 numpy==1.24.3 matplotlib==3.4.3 opencv-python==4.5.4.60 scikit-image==0.18.3 fastapi==0.68.0 uvicorn==0.15.0
   ```

### Opción 2: Instalación con Docker

1. Asegúrate de tener Docker instalado.
2. Construye la imagen Docker desde el `Dockerfile`:
   ```bash
   docker build -t crater_detection_app .
   ```
3. Ejecuta el contenedor:
   ```bash
   docker run --rm -p 8000:8000 crater_detection_app
   ```

### Opción 3: Instalación Manual en Windows (Usando un archivo `.whl` de Rasterio)

1. Descarga el archivo `.whl` de **rasterio** desde [Christoph Gohlke’s Unofficial Windows Binaries](https://www.lfd.uci.edu/~gohlke/pythonlibs/#rasterio) para tu versión de Python.
2. Instálalo:
   ```bash
   pip install path\to\rasterio‑1.2.10‑cp39‑cp39‑win_amd64.whl
   ```
3. Instala las demás dependencias:
   ```bash
   pip install tensorflow==2.10.0 numpy==1.24.3 matplotlib==3.4.3 opencv-python==4.5.4.60 scikit-image==0.18.3 fastapi==0.68.0 uvicorn==0.15.0
   ```

## Estructura del Proyecto

```plaintext
crater_detection/
├── data/                        # Carpeta para datos de elevación
├── models/                      # Modelos entrenados
├── src/
│   ├── application/             # Casos de uso
│   ├── domain/                  # Entidades de dominio
│   ├── infrastructure/          # Carga de datos y dependencias externas
│   └── presentation/
│       ├── api/                 # Endpoints de la API
│       └── main.py              # Archivo principal para iniciar la API
└── README.md                    # Documentación del proyecto
```

## Uso

### Ejecución de la API

1. Asegúrate de tener las dependencias instaladas.
2. Inicia la API usando Docker o directamente con `uvicorn`:
   ```bash
   uvicorn src.presentation.api.main:app --host 0.0.0.0 --port 8000
   ```
3. La API estará disponible en `http://localhost:8000`.

### Ejemplo de Llamada

Para verificar el estado de la API:

```bash
curl http://localhost:8000/status
```

Para analizar un archivo de imagen de elevación:

```bash
curl -X 'POST'   'http://localhost:8000/analyze'   -H 'accept: application/json'   -H 'Content-Type: multipart/form-data'   -F 'file=@path/to/your/image.tif'
```

## Endpoints de la API

- **`GET /status`**: Verifica que la API esté en funcionamiento.
- **`POST /analyze`**: Recibe un archivo de imagen de elevación y devuelve el análisis de cráteres.

## Notas sobre Problemas de Compatibilidad

- En Windows, **rasterio** depende de **GDAL**. Si encuentras problemas al instalar rasterio, considera usar Conda o Docker.
- Asegúrate de usar versiones específicas de **numpy** y **tensorflow** que sean compatibles para evitar conflictos de dependencias.

## Contribución

Si deseas contribuir a este proyecto, por favor abre un **pull request** o reporta problemas en el repositorio. Agradecemos cualquier ayuda para mejorar la detección de cráteres y optimizar el análisis de datos de elevación.