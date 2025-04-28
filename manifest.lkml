project_name: "ArquitecturaLookerAlicia"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

# Aqui podemos definir constantes, variaciones de dimensiones, etc.

constant: variacion_format_euros {
  # {{rendered_value}} es un parámetro liquid que hace referencia al valor que devuelva la
  # dimensión dentro de la que se está usando, empleando el formato que se haya definido
  # dentro de dicha dimensión

  # {{value}} funciona de la misma manera pero sin usar el formato definido
  # dentro de la dimensión
  value: "
  {% if pop_parameters.tipo_variacion._parameter_value == 'relativa' %}
  {% if pop_parameters.pretty_format._parameter_value == 'yes' %}
  {% if value > 0 %}
  <p style=\"color:#5f9524\">▲ {{rendered_value}}%</p>
  {% elsif value < 0 %}
  <p style=\"color:#9b4e49\">▼ {{rendered_value}}%</p>
  {% else %}
  <p style=\"color: black\">{{rendered_value}}%</p>
  {% endif %}
  {% else %}
  {% if value > 0 %}
  {{rendered_value}}%
  {% elsif value < 0 %}
  {{rendered_value}}%
  {% else %}
  {{rendered_value}}%
  {% endif %}
  {% endif %}
  {% else %}
  {% if pop_parameters.pretty_format._parameter_value == 'yes' %}
  {% if value > 0 %}
  <p style=\"color:#5f9524\">▲ {{rendered_value}}€</p>
  {% elsif value < 0 %}
  <p style=\"color:#9b4e49\">▼ {{rendered_value}}€</p>
  {% else %}
  <p style=\"color: black\">{{rendered_value}}€</p>
  {% endif %}
  {% else %}
  {% if value > 0 %}
  {{rendered_value}}€
  {% elsif value < 0 %}
  {{rendered_value}}€
  {% else %}
  {{rendered_value}}€
  {% endif %}
  {% endif %}
  {% endif %}"
}

constant: variacion_format {
  # {{rendered_value}} es un parámetro liquid que hace referencia al valor que devuelva la
  # dimensión dentro de la que se está usando, empleando el formato que se haya definido
  # dentro de dicha dimensión

  # {{value}} funciona de la misma manera pero sin usar el formato definido
  # dentro de la dimensión
  value: "
  {% if pop_parameters.tipo_variacion._parameter_value == 'relativa' %}
  {% if pop_parameters.pretty_format._parameter_value == 'yes' %}
  {% if value > 0 %}
  <p style=\"color:#5f9524\">▲ {{rendered_value}}%</p>
  {% elsif value < 0 %}
  <p style=\"color:#9b4e49\">▼ {{rendered_value}}%</p>
  {% else %}
  <p style=\"color: black\">{{rendered_value}}%</p>
  {% endif %}
  {% else %}
  {% if value > 0 %}
  {{rendered_value}}%
  {% elsif value < 0 %}
  {{rendered_value}}%
  {% else %}
  {{rendered_value}}%
  {% endif %}
  {% endif %}
  {% else %}
  {% if pop_parameters.pretty_format._parameter_value == 'yes' %}
  {% if value > 0 %}
  <p style=\"color:#5f9524\">▲ {{rendered_value}}</p>
  {% elsif value < 0 %}
  <p style=\"color:#9b4e49\">▼ {{rendered_value}}</p>
  {% else %}
  <p style=\"color: black\">{{rendered_value}}</p>
  {% endif %}
  {% else %}
  {% if value > 0 %}
  {{rendered_value}}
  {% elsif value < 0 %}
  {{rendered_value}}
  {% else %}
  {{rendered_value}}
  {% endif %}
  {% endif %}
  {% endif %}"
}

constant: variacion_format_inverse {
  # {{rendered_value}} es un parámetro liquid que hace referencia al valor que devuelva la
  # dimensión dentro de la que se está usando, empleando el formato que se haya definido
  # dentro de dicha dimensión

  # {{value}} funciona de la misma manera pero sin usar el formato definido
  # dentro de la dimensión
  value: "
  {% if pop_parameters.tipo_variacion._parameter_value == 'relativa' %}
  {% if pop_parameters.pretty_format._parameter_value == 'yes' %}
  {% if value > 0 %}
  <p style=\"color:#9b4e49\">▲ {{rendered_value}}%</p>
  {% elsif value < 0 %}
  <p style=\"color:#5f9524\">▼ {{rendered_value}}%</p>
  {% else %}
  <p style=\"color: black\">{{rendered_value}}%</p>
  {% endif %}
  {% else %}
  {% if value > 0 %}
  {{rendered_value}}%
  {% elsif value < 0 %}
  {{rendered_value}}%
  {% else %}
  {{rendered_value}}%
  {% endif %}
  {% endif %}
  {% else %}
  {% if pop_parameters.pretty_format._parameter_value == 'yes' %}
  {% if value > 0 %}
  <p style=\"color:#9b4e49\">▲ {{rendered_value}}</p>
  {% elsif value < 0 %}
  <p style=\"color:#5f9524\">▼ {{rendered_value}}</p>
  {% else %}
  <p style=\"color: black\">{{rendered_value}}</p>
  {% endif %}
  {% else %}
  {% if value > 0 %}
  {{rendered_value}}
  {% elsif value < 0 %}
  {{rendered_value}}
  {% else %}
  {{rendered_value}}
  {% endif %}
  {% endif %}
  {% endif %}"
}

constant: default_start_date {
  type: date
  value: DATEADD(MONTH, -3, GETDATE())
  description: "Fecha predeterminada de inicio: tres meses antes de la fecha actual."
}

constant: default_end_date {
  type: date
  value: GETDATE()
  description: "Fecha predeterminada de fin: la fecha actual."
}

constant: non_comparison_measures { value: "Non comparison measures"}
constant: current_measures { 
  value: "Current period measures"
  description: "Etiqueta para medidas del período actual."
}
constant: prev_period_measures { 
  value: "Previous period measures"
  description: "Etiqueta para medidas del período anterior."
}
constant: prev_year_measures { 
  value: "Previous year measures"
  description: "Etiqueta para medidas del año anterior."
}
constant: interannual_variations { value: "Interannual variations"}
constant: interperiod_variations { value: "Interperiod variations"}
