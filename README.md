# Preprocesamiento-BCI-IV-2a
## El preprocesamiento es el siguiente:
Subconjunto4segMI.m --> ReemplazarNaNMediana.m --> FiltroPasaBanda.m --> AcomodarDatos.m

### Subconjunto4segMI.m
Input: (AxxX.gdf)

Output: (MotorImageryAxxX.mat) donde estan los 4seg de MI-EEG, 288 muestras de 22 canales 4seg a 250Hz

Input Shape: todox25

Output Shape: 288000x22

Se necesita ejecutar biosig_installer.m

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

Output: (MI-EEG-AxxX.csv) es para el entrenamiento de los modelos

Output: (MI-EEG-AxxX.mat) es para DWT

Input shape: 288000x22

Output shape: 288x22000

Las filas son el numero de muestras (288) y las columnas son los 4 seg de los 22 canales concatenados (22000)

### RWE_DWT_Multinivel.m
RWE con DWT de dos niveles de descompisicion usando DWT-db4

Input: (MI-EEG-AxxX.mat)

Output: (MI-EEG-RWE-A01E.csv)

Input shape: 288x22000

Output shape: 288x66

### Alfa_DWT_C3_C4.m
Alfa de C3 y C4 con DWT de dos niveles de descomposicion

Input: (MI-EEG-AxxX.mat)

Output: (MI-EEG-Alfa-AxxX.csv)

Input shape: 288x22000

Output shape: 288x510

### DWTCoeficientes.m
Obtener los coeficientes de aproximacion y de detalle con DWT-db4 con 2 niveles de descomposicion

Input: (MI-EEG-AxxX.mat)

Output: (MI-EEG-DWT-Coef-AxxX.csv)

Input shape: 288x22000

Output shape: 288x22286

#### Archivos que no se ocupan
Filtro32Hz.m

ReemplazarNaNPruebas.m

PruebasFFT.m