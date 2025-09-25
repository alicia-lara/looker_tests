# The name of this view in Looker is "Ventas"
view: ventas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: civica-civdaxa-dev.looker_poc.h_ventas ;;
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
    # This dimension will be called "ID Categoria" in Explore.

  dimension: id_categoria {
    type: number
    sql: ${TABLE}.id_categoria ;;
  }

  dimension: id_pais {
    type: number
    sql: ${TABLE}.id_pais ;;
  }

  dimension: id_tipo_tarjeta {
    type: number
    sql: ${TABLE}.id_tipo_tarjeta ;;
  }

  dimension: ventas {
    type: number
    sql: ${TABLE}.ventas ;;
  }
  measure: count {
    type: count
    drill_fields: [id_fecha]
  }

  measure: ventas_test2 {
    type: sum
    sql: ${TABLE}.ventas ;;
  }

  measure: ventas_total_paises {
    type: number
    sql: SUM(${ventas_test2}) OVER () ;;
  }


  measure: ventas_categoria {
    type: number
    sql: SUM(${ventas_test2}) OVER (PARTITION BY ${TABLE}.id_categoria) ;;
  }
}
