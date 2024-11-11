from fastapi import FastAPI, UploadFile, File

from src.application.use_cases.analyze_elevation_data import analyze_elevation_data

app = FastAPI()


@app.get("/status")
async def get_status():
    return {"status": "API is running"}


@app.post("/analyze")
async def analyze_image(file: UploadFile = File(...)):
    # Guarda el archivo subido temporalmente
    file_location = f"data/{file.filename}"
    with open(file_location, "wb") as buffer:
        buffer.write(await file.read())

    # Llama al caso de uso para analizar la imagen
    analysis_result = analyze_elevation_data(file_location)

    return analysis_result
