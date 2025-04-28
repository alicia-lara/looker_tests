# Descripción general de la vista "pop_parameters"
# Esta vista define parámetros utilizados para cálculos de comparación de períodos (PoP).

view: pop_parameters {
  # Parámetro: Tipo de variación
  parameter: tipo_variacion {
    view_label: "_PoP"
    type: unquoted
    default_value: "relativa"
    allowed_value: {
      label: "Relativa"
      value: "relativa"
    }
    allowed_value: {
      label: "Absoluta"
      value: "absoluta"
    }
    description: "Define si la variación será relativa (porcentaje) o absoluta (valor bruto)."
  }

  # Parámetro: Formato visual
  parameter: pretty_format {
    view_label: "_PoP"
    type: unquoted
    default_value: "no"
    allowed_value: {
      label: "Sí"
      value: "yes"
    }
    allowed_value: {
      label: "No"
      value: "no"
    }
    description: "Determina si el formato visual incluirá colores y símbolos para destacar variaciones."
  }
}
