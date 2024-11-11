from src.infrastructure.data_loader import load_elevation_data, display_elevation_data

def process_and_display_data(filepath):
    elevation_data = load_elevation_data(filepath)
    
    display_elevation_data(elevation_data)
    