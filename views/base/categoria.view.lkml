# The name of this view in Looker is "Categoria"
view: categoria {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: civica-civdaxa-dev.looker_poc.d_categoria ;;
  drill_fields: [id_categoria]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id_categoria {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_categoria ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Desc Categoria" in Explore.

  dimension: desc_categoria {
    type: string
    sql: ${TABLE}.desc_categoria ;;
  }

  measure: count {
    type: count
    drill_fields: [id_categoria]
  }
}
