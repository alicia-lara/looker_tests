# The name of this view in Looker is "Pais"
view: pais {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: looker_poc.d_pais ;;
  drill_fields: [id_pais]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id_pais {
    primary_key: yes
    type: number
    sql: ${TABLE}.id_pais ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Desc Pais" in Explore.

  dimension: desc_pais {
    type: string
    sql: ${TABLE}.desc_pais ;;
  }
  measure: count {
    type: count
    drill_fields: [id_pais]
  }
}
