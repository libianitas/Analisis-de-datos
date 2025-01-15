# ANÁLISIS DE ESTADO CREDITICIO DE CLIENTES APLICANDO INTELIGENCIA ARTIFICIAL EN INSTITUCIÓN FINANCIERA
## Introducción
Este proyecto tiene como objetivo analizar el estado crediticio de los clientes mediante Inteligencia Artificial, clasificando los créditos según la existencia de mora. Se extraen datos históricos de la base de datos SQL Server y se procesan con Python en Google Colab para el entrenamiento de los modelos de aprendizaje automático Regresión Logística, Árbol de Decisión, Random Forest y XGBoost. Se aplican técnicas de sobre muestreo aleatorio ROS y SMOTE para balancear los datos. Tras evaluar los modelos, se concluye que el modelo XGBoost con SMOTE es el más preciso (86%), recomendándose su implementación en la institución.

## 
•	Compresión de los datos de fuente original Microsoft SQL Server, proceso ETL extracción, transformación y carga a archivo CSV. Creación de scripts SQL.
•	Análisis EDA, análisis de la estructura del DataFrame, estadística descriptiva, resumen estadístico, distribución de variables con matrices y gráficos con Python y R.
•	Limpieza de datos dispersos, almacenados en formatos diferentes, datos incoherentes, nulos, redundantes, envejecidos o sesgados, cálculo de nuevas variables, asociación y correlación de variables con Python y R.
•	Preparación, visualización, balanceo de datos con ROS y SMOTE, transformación de datos categóricos a numéricos con las técnicas de dummy encoding y label encoding con Python y R.
•	Optimización de hiper parámetros, entrenamiento y pruebas de modelos de Machine Learning Regresión Logística, Árbol de decisión, Random Forest y XGBoost.
•	Evaluación de los modelos de Machine Learning con matrices de confusión e índices de precisión
