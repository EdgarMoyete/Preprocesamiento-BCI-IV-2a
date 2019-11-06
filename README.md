# Preprocesamiento-BCI-IV-2a
### Subconjunto4segMI.m
Input: (AxxX.gdf)
Output: (MotorImageryAxxX.mat) donde estan los 4seg de MI-EEG, 288 muestras de 22 canales 4seg a 250Hz
Input Shape: todox25
Output Shape: 288000x22

### ReemplazarNaNMediana.m
Input: (MotorImageryAxxX.mat)
Output: (LimpiosAxxX.mat)
Input Shape: 288000x22
Output Shape: 288000x22

### FiltroPasaBanda.m
Filtro FIR pasa banda de 8Hz-30Hz
Input: (LimpiosAxxX.mat)
Output: (FiltradasxxX.mat)
Input shape: 288000x22
Output shape: 288000x22

### AcomodarDatos.m
Acomodar los datos para que queden concatenados los canales
Input: (FiltradasxxX.mat)
Output: (MI-EEG-AxxX.csv)
Input shape: 288000x22
Output shape: 288x22000
Las filas son el numero de muestras (288) y las columnas son los 4 seg de los 22 canales concatenados (22000)

#### Archivos que no se ocupan
Filtro32Hz.m
ReemplazarNaN.m