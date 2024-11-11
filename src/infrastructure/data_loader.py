import rasterio
import numpy as np
import matplotlib.pyplot as plt

def load_elevation_data(filepath):
    with rasterio.open(filepath) as src:
        elevation_data = src.read(1)  # Lee la primera banda de datos de elevaci�n
    return elevation_data

def display_elevation_data(elevation_data):
    plt.imshow(elevation_data, cmap='terrain')
    plt.colorbar(label='E')
    plt.title('Datos de Elevaci�n SRTM')
    plt.show()
    