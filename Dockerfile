# Use a base image of Python with GDAL pre-installed for compatibility with rasterio
FROM osgeo/gdal:ubuntu-full-3.5.1

# Define variables
ARG PYTHON_VERSION=3
ARG PIP_UPGRADE_CMD="pip install --upgrade pip"
ARG REQUIREMENTS_INSTALL_CMD="pip install --no-cache-dir -r requirements.txt"

# Install Python and other system requirements
RUN apt-get update && \
    apt-get install -y python${PYTHON_VERSION}-pip python${PYTHON_VERSION}-dev

# Set the working directory
WORKDIR /app

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN ${PIP_UPGRADE_CMD} && \
    ${REQUIREMENTS_INSTALL_CMD}

# Copy the rest of the project
COPY . .

# Expose the port for the API
EXPOSE 8000

# Command to start the API with Uvicorn
CMD ["uvicorn", "src.presentation.api.main:app", "--host", "0.0.0.0", "--port", "8000"]