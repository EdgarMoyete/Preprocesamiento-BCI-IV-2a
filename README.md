# Preprocesamiento-BCI-IV-2a
## El preprocesamiento es el siguiente:
Subconjunto4segMI.m --> ReemplazarNaNFiltroMediana.m --> CAR.m o FiltroLaplaciano.m --> FiltroPasaBanda.m --> AcomodarDatos.m

### Subconjunto4segMI.m
Obtener el segmento de 4 segundos de imaginación motora en EEG (del 2 al 6)
* Input: (AxxX.gdf)
* Output: (MotorImageryAxxX.mat) donde estan los 4seg de MI-EEG, 288 muestras de 22 canales 4seg a 250Hz
* Input Shape: todox25
* Output Shape: 288000x22

Se necesita ejecutar biosig_installer.m

### ReemplazarNaNFiltroMediana.m
Reemplazar NaN por los valores obtenidos con el filtro mediana de orden 255
* Input: (MotorImageryAxxX.mat)
* Output: (LimpiosAxxX.mat)
* Input Shape: 288000x22
* Output Shape: 288000x22

### CAR.m
Referencia CAR (common average reference)
* Input: (LimpiosAxxX.mat)
* Output: (CarAxxX.mat)
* Input shape: 288000x22
* Output shape: 288000x22

### FiltroLaplaciano.m
Referenciar con filtro espacial laplaciano para los canales C3 y C4
* Input: (LimpiosAxxX.mat)
* Output: (LaplaceAxxX.mat)
* Input shape: 288000x22
* Output shape: 288000x2

### FiltroPasaBanda.m
Filtro pasa banda de 8Hz-30Hz
* Input: (CarAxxX.mat)
* Output: (FiltradasAxxX.mat)
* Input shape: 288000x22
* Output shape: 288000x22

### AcomodarDatos.m
Acomodar los datos para que queden concatenados los canales [n_muestras, n_canales]
* Input: (FiltradasxxX.mat)
* Output: (MI-EEG-AxxX.csv) es para el entrenamiento de los modelos
* Output: (MI-EEG-AxxX.mat) es para DWT y para la clasificacion binaria
* Input shape: 288000x22
* Output shape: 288x22000

Las filas son el numero de muestras (288) y las columnas son los 4 seg de los 22 canales concatenados (22000)

### AcomodarDatosLaplace.m
Acomodar los datos para que queden concatenados los canales [n_muestras, n_canales]
* Input: (FiltraLaplaceAxxX.mat)
* Output: (MI-EEG-Laplace-AxxX.csv) es para el entrenamiento de los modelos
* Output: (MI-EEG-Laplace-AxxX.mat) es para DWT y para la clasificacion binaria
* Input shape: 288000x2
* Output shape: 288x2000

Las filas son el numero de muestras (288) y las columnas son los 4 seg de los 2 canales concatenados (2000)

### AcomodarDatosBinaria.m
Acomodar los datos para que queden concatenados los canales [n_muestras, n_canales], solo se utilizaron las clases mano izquierda y mano derecha
* Input: (MI-EEG-AxxX.mat), (AxxX.mat)
* Output: (MI-EEG-ID-AxxX.csv) es para el entrenamiento de los modelos, (Etiquetas-ID-AxxX.csv)
* Input shape: 288x22000
* Output shape: 144x22000

Las filas son el numero de muestras (144) y las columnas son los 4 seg de los 22 canales concatenados (22000)

### RWE_DWT_Multinivel.m
RWE con DWT de dos niveles de descompisicion usando DWT-db4
* Input: (MI-EEG-AxxX.mat)
* Output: (MI-EEG-RWE-A01E.csv)
* Input shape: 288x22000
* Output shape: 288x66

### Alfa_DWT_C3_C4.m
Alfa de C3 y C4 con DWT-db4 de dos niveles de descomposición
* Input: (MI-EEG-AxxX.mat)
* Output: (MI-EEG-Alfa-AxxX.csv)
* Input shape: 288x22000
* Output shape: 288x510

### DWTCoeficientes.m
Obtener los coeficientes de aproximacion y de detalle con DWT-db4 con 2 niveles de descomposicion
* Input: (MI-EEG-AxxX.mat)
* Output: (MI-EEG-DWT-Coef-AxxX.csv)
* Input shape: 288x22000
* Output shape: 288x22286

#### Otros archivos que no se utilizan
* ContarNaN.m
* Filtro32Hz.m
* PruebasFFT.m
* ReemplazarNaNPruebas.m
* Ventaneo.m