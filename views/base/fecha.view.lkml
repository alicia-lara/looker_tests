# The name of this view in Looker is "Fecha"
view: fecha {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_poc.d_fecha ;;
  drill_fields: [id_fecha]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id_fecha {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_fecha ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Anyo" in Explore.

  dimension: anyo {
    type: number
    sql: ${TABLE}.anyo ;;
  }

  dimension: anyomes {
    type: number
    sql: ${TABLE}.anyomes ;;
  }

  dimension: desc_mes {
    type: string
    sql: ${TABLE}.desc_mes ;;
  }

  dimension: dia {
    type: number
    sql: ${TABLE}.dia ;;
  }

  dimension: dia_semana {
    type: string
    sql: ${TABLE}.dia_semana ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.mes ;;
  }




  measure: count {
    type: count
    drill_fields: [id_fecha]
  }
}
