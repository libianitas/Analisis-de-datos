# APLICACIÓN DE TÉCNICAS DE INTELIGENCIA ARTIFICIAL PARA PREDECIR MORA EN CRÉDITOS DE UNA INSTITUCIÓN FINANCIERA EN ECUADOR
## Resumen
INTRODUCCIÓN. Esta investigación aborda la predicción de morosidad en el pago de créditos mediante la implementación de modelos basados en técnicas de Inteligencia Artificial, es-pecíficamente Aprendizaje Automático. La variable dependiente es la morosidad, y las inde-pendientes incluyen características demográficas, socioeconómicas y del historial crediticio. OBJETIVO. Implementar y entrenar modelos predictivos utilizando técnicas de aprendizaje automático supervisado, con el propósito de anticipar posibles moras en créditos y apoyar la toma de decisiones. MÉTODO. Se aplicaron las etapas de la metodología CRISP-DM, iniciando con la extracción, transformación y carga de los datos, seguido de análisis exploratorio, lim-pieza, verificación de correlaciones, entrenamiento de algoritmos supervisados y evaluación del rendimiento. RESULTADOS. El mayor índice de recall 0,68, indicador clave para identificar impagos, se obtuvo con el algoritmo de Regresión Logística utilizando la técnica de balanceo SMOTE. DISCUSIÓN  Y  CONCLUSIONES.  El  resultado  contrasta  con  otras  investigaciones  que  adoptan el modelo Random Forest en problemas de predicción de mora, en este caso los valo-res de recall obtenidos no fueron significativos. Una limitación importante fue el desbalance en la variable a predecir, abordado mediante técnicas de balanceo. Finalmente se evidencia la importancia de validar empíricamente los resultados según los datos y el contexto específico de aplicación

## Metodología
La solución se basa en las 5 de 6 fases recomendadas por la metodología CRISP-DM.
+ Compresión de los datos de fuente original Microsoft SQL Server, proceso ETL extracción, transformación y carga a archivo CSV. Creación de scripts SQL.
+ Análisis EDA, análisis de la estructura del DataFrame, estadística descriptiva, resumen estadístico, distribución de variables con matrices y gráficos con Python y R.
+ Limpieza de datos dispersos, almacenados en formatos diferentes, datos incoherentes, nulos, redundantes, envejecidos o sesgados, cálculo de nuevas variables, asociación y correlación de variables con Python y R.
+ Preparación, visualización, balanceo de datos con ROS y SMOTE, transformación de datos categóricos a numéricos con las técnicas de dummy encoding y label encoding con Python y R.
+ Optimización de hiper parámetros, entrenamiento y pruebas de modelos de Machine Learning Regresión Logística, Árbol de decisión, Random Forest y XGBoost.
+ Evaluación de los modelos de Machine Learning con matrices de confusión e índices de precisión

## Documentación completa con resumen y conclusión
### Investigación publicada en la revista CienciAmérica 08/2025
[Predecir_créditos_IA_doi: 10.33210/ca.v14i2.509](https://www.cienciamerica.edu.ec/index.php/uti/article/view/509/1051)










