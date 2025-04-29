# Descripción general de la vista "pop"
# Esta vista se utiliza para cálculos de comparación de períodos (PoP).
# Incluye dimensiones y filtros para definir períodos actuales, anteriores y del año anterior.

view: pop {
  extension: required

  # Filtro de fecha para cálculos dinámicos
  filter: date_filter {
    view_label: "_PoP"
    label: "Filtro de Fecha"
    description: "Filtro de fecha utilizado para cálculos dinámicos de períodos."
    type: date
  }

  set: pop_dimensions {
    fields: [
      comparison_raw,
      comparison_time,
      comparison_hour_of_day,
      fecha,
      comparison_day_of_week,
      comparison_day_of_week_index,
      comparison_day_of_month,
      comparison_day_of_year,
      comparison_week,
      comparison_week_of_year,
      comparison_month,
      comparison_month_name,
      comparison_month_num,
      comparison_quarter,
      comparison_year,
      date_filter,
      timeframes
    ]
  }

  # Dimensiones relacionadas con períodos
  dimension_group: filter_start_date {
    hidden: yes
    view_label: "_PoP"
    type: time
    timeframes: [raw, date, month]
    sql: CASE WHEN {% date_start date_filter %} IS NULL THEN @{default_start_date} ELSE CAST({% date_start date_filter %} AS DATE) END;;
    description: "Fecha de inicio del período actual. Por defecto, tres meses antes de la fecha actual."
  }

  dimension_group: filter_end_date {
    hidden: yes
    view_label: "_PoP"
    type: time
    timeframes: [raw, date, month]
    sql: CASE WHEN {% date_end date_filter %} IS NULL THEN @{default_end_date} ELSE CAST({% date_end date_filter %} AS DATE) END;;
    description: "Fecha de fin del período actual. Por defecto, la fecha actual."
  }

  dimension: interval {
    hidden: yes
    view_label: "_PoP"
    type: number
    sql: DATEDIFF(DAY, ${filter_start_date_raw}, ${filter_end_date_raw});;
    description: "Duración del período actual en días."
  }

  # Dimensiones para períodos anteriores
  dimension_group: previous_start {
    hidden: yes
    view_label: "_PoP"
    type: time
    timeframes: [raw, date]
    sql: DATEADD(DAY, -${interval}, ${filter_start_date_raw});;
    description: "Fecha de inicio del período anterior."
  }

  dimension_group: previous_year_start {
    hidden: yes
    view_label: "_PoP"
    type: time
    timeframes: [raw, date]
    sql: DATEADD(DAY, -365, ${filter_start_date_raw});;
    description: "Fecha de inicio del mismo período en el año anterior."
  }

  dimension_group: previous_year_end {
    hidden: yes
    view_label: "_PoP"
    type: time
    timeframes: [raw, date]
    sql: DATEADD(DAY, ${interval}, ${previous_year_start_raw});;
    description: "Fecha de fin del mismo período en el año anterior."
  }

  # Dimensión para clasificar períodos
  dimension: timeframes {
    view_label: "_PoP"
    label: "Clasificación de Períodos"
    type: string
    sql: CASE
      WHEN ${is_current_period} THEN 'Período actual'
      WHEN ${is_previous_period} THEN 'Período anterior'
      WHEN ${is_previous_year} THEN 'Año anterior'
      ELSE 'Fuera de período'
    END;;
    description: "Clasifica los datos en períodos actuales, anteriores o del año anterior."
  }

  # Dimensiones booleanas para identificar períodos
  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${comparison_date_date} >= ${filter_start_date_raw} AND ${comparison_date_date} < ${filter_end_date_raw};;
    description: "Indica si la fecha pertenece al período actual."
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${comparison_date_date} >= ${previous_start_date} AND ${comparison_date_date} < ${filter_start_date_raw};;
    description: "Indica si la fecha pertenece al período anterior."
  }

  dimension: is_previous_year {
    hidden: yes
    type: yesno
    sql: ${comparison_date_date} >= ${previous_year_start_date} AND ${comparison_date_date} < ${previous_year_end_date};;
    description: "Indica si la fecha pertenece al mismo período del año anterior."
  }
}
