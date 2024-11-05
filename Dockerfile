# Use a base image of Python with GDAL pre-installed for compatibility with rasterio
FROM osgeo/gdal:ubuntu-full-3.5.1

# Install Python and other necessary system packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Copy the requirements file and install Python dependencies using pip3
COPY requirements.txt .
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose the port for the API
EXPOSE 8000

# Command to start the API with Uvicorn
CMD ["uvicorn", "src.presentation.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
