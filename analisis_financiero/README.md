# ANÁLISIS DE ESTADO CREDITICIO DE CLIENTES APLICANDO INTELIGENCIA ARTIFICIAL EN INSTITUCIÓN FINANCIERA
## Introducción
Este proyecto tiene como objetivo analizar el estado crediticio de los clientes de una institución financiera mediante Inteligencia Artificial, clasificando los créditos según la existencia de mora. Se extraen datos históricos de la base de datos SQL Server y se procesan con un script de Python en Google Colab, se entrenan los modelos de aprendizaje automático supervisado Regresión Logística, Árbol de Decisión, Random Forest y XGBoost. Se aplican técnicas de sobre muestreo aleatorio ROS y SMOTE para balancear los datos. Tras evaluar los modelos con índice de precisión y matriz de confusión, se concluye que el modelo XGBoost con la técnica de balanceo SMOTE es el más preciso (86%), recomendándose su implementación en la institución.

## Metodología
La solución se basa en las 6 fases recomendadas por la metodología CRISP-DM.
+ Compresión de los datos de fuente original Microsoft SQL Server, proceso ETL extracción, transformación y carga a archivo CSV. Creación de scripts SQL.
+ Análisis EDA, análisis de la estructura del DataFrame, estadística descriptiva, resumen estadístico, distribución de variables con matrices y gráficos con Python y R.
+ Limpieza de datos dispersos, almacenados en formatos diferentes, datos incoherentes, nulos, redundantes, envejecidos o sesgados, cálculo de nuevas variables, asociación y correlación de variables con Python y R.
+ Preparación, visualización, balanceo de datos con ROS y SMOTE, transformación de datos categóricos a numéricos con las técnicas de dummy encoding y label encoding con Python y R.
+ Optimización de hiper parámetros, entrenamiento y pruebas de modelos de Machine Learning Regresión Logística, Árbol de decisión, Random Forest y XGBoost.
+ Evaluación de los modelos de Machine Learning con matrices de confusión e índices de precisión

## Desarrollo de la solución
Se crea un script Python [predecir_estado](analisis_financiero/predecir_estado_crediticio.ipynb) que trabaja con librerías como: pandas, numpy, matplotlib, seaborn, dateutil, RandomOverSampler,sklearn, scipy, chi2_contingency y se lo puede descargar y ejecutar con [Google Colab](https://colab.research.google.com/).
El script Python lee un archivo CSV que contiene la información extraida de la base de datos SQL Server, lo puede descargar [data_creditos_completo9.csv](analisis_financiero/data_creditos_completo9.csv). Debe asegurarse que la ruta del archivo sea la del archivo que descargo.

`df = pd.read_csv("/content/drive/MyDrive/Colab_Notebooks/TFM_final/data_creditos_completo9.csv", encoding = 'unicode_escape', engine ='python', sep = ";")`

## Documentación completa con resumen y conclusión
[analisis_financiero](analisis_financiero/Análisis financiero.pdf)
[analisis_financiero](analisis_financiero/Análisis financiero.pdf)










