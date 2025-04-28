# Descripción general del proyecto
# Este archivo define el modelo principal para el proyecto Looker.
# Incluye las vistas y explores necesarios para analizar los datos de ventas.
# También define políticas de caché y conexión a la base de datos.

connection: "formacion_analytics_2025_test"

# Incluye todas las vistas y explores del proyecto.
include: "/views/basic/*.view.lkml"
include: "/explores/basic/*.explore"

# Define la política de caché predeterminada.
datagroup: arquitectura_default_datagroup {
  sql_trigger: SELECT MAX(updated_at) FROM etl_log;;
  max_cache_age: "1 hour"
  description: "Este datagroup asegura que los datos se actualicen cada hora o cuando cambie la tabla etl_log."
}

# Persiste la caché para todos los Explores en este modelo.
persist_with: arquitectura_default_datagroup
