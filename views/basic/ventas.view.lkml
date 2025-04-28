include: "/views/base/*.view"
include: "/views/shared/*.view"

view: +ventas {

  extends: [pop]

  # Extensión de la vista base "ventas"
  # Aquí puedes añadir dimensiones y medidas adicionales para enriquecer los análisis.

  dimension: id_categoria {
    type: number
    sql: ${TABLE}.id_categoria ;;
  }


  # Nueva dimensión: Año derivado de la fecha (si hay un campo de fecha relacionado)
  dimension: venta_year {
    type: number
    sql: EXTRACT(YEAR FROM ${id_fecha}) ;;
    description: "Año derivado del campo ID Fecha."
  }


  # Nueva medida: Ingresos totales
  measure: total_sales {
    type: sum
    sql: ${ventas} ;;
    description: "Ingresos totales de las ventas."
  }

  # Nueva medida: Ventas promedio por transacción
  measure: average_sales {
    type: average
    sql: ${ventas} ;;
    description: "Promedio de ventas por transacción."
  }

  # Nueva medida: Total de categorías únicas en las ventas
  measure: unique_categories_count {
    type: count_distinct
    sql: ${id_categoria} ;;
    description: "Número total de categorías únicas en las ventas."
  }

  # Nueva dimensión: Clasificación de ventas
  dimension: ventas_classification {
    type: string
    sql: CASE
      WHEN ${ventas} < 100 THEN 'Bajas'
      WHEN ${ventas} BETWEEN 100 AND 500 THEN 'Medias'
      ELSE 'Altas'
    END ;;
    description: "Clasificación de las ventas según el monto (Bajas, Medias, Altas)."
  }

  # Dimensiones y medidas relacionadas con PoP (Período sobre Período)

  # Dimensión: Fecha de comparación para cálculos PoP
  dimension_group: comparison_date {
    type: time
    hidden: yes
    timeframes: [raw, date]
    sql: (SELECT fecha FROM dbo.d_fecha WHERE id_fecha = ${TABLE}.id_fecha) ;;
    description: "Fecha derivada de la tabla de fechas (dbo.d_fecha) para realizar cálculos de comparación entre períodos. Esta dimensión es clave para los cálculos PoP."
  }

  # Medida: Ventas en el período actual
  measure: ventas_current_period {
    group_label: "@{current_measures}"
    label: "Total ventas (período actual)"
    type: sum
    sql: CASE
      WHEN ${fecha.fecha_date} >= ${filter_start_date_date} AND ${fecha.fecha_date} < ${filter_end_date_date}
      THEN ${ventas}
      ELSE NULL
    END ;;
    value_format_name: decimal_0
    description: "Suma total de las ventas realizadas durante el período actual definido por los filtros de fecha."
  }

  # Medida: Ventas en el período anterior
  measure: ventas_previous_period {
    group_label: "@{prev_period_measures}"
    label: "Total ventas (período anterior)"
    type: sum
    sql: CASE
      WHEN ${fecha.fecha_date} >= ${previous_start_date} AND ${fecha.fecha_date} < ${filter_start_date_date}
      THEN ${ventas}
      ELSE NULL
    END ;;
    value_format_name: decimal_0
    description: "Suma total de las ventas realizadas durante el período anterior al período actual definido por los filtros de fecha."
  }
}
