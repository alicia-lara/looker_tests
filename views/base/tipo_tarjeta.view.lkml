# The name of this view in Looker is "Tipo Tarjeta"
view: tipo_tarjeta {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_poc.d_tipo_tarjeta ;;
  drill_fields: [id_tipo_tarjeta]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id_tipo_tarjeta {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_tipo_tarjeta ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Desc Tipo Tarjeta" in Explore.

  dimension: desc_tipo_tarjeta {
    type: string
    sql: ${TABLE}.desc_tipo_tarjeta ;;
  }
  measure: count {
    type: count
    drill_fields: [id_tipo_tarjeta]
  }
}
