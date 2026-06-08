include: "/views/raw/v_tool_error.view.lkml"

view: +v_tool_error {
  sql_table_name: `@{PROJECT_ID}.@{DATASET_NAME}.@{VIEW_PREFIX}_tool_error` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${trace_id}, '|', ${span_id}) ;;
    description: "Internal composite primary key for symmetric aggregates."
  }

  dimension: tool_name {
    group_label: "Tool Info"
    description: "The specific name of the tool or function that threw the error."
  }

  dimension: tool_origin {
    group_label: "Tool Info"
    description: "The origin of the tool execution (e.g., LOCAL, MCP, SUB_AGENT) that failed."
  }

  dimension: tool_args {
    group_label: "Tool Info"
    type: string
    sql: TO_JSON_STRING(${TABLE}.tool_args) ;;
    description: "The JSON arguments that were passed to the tool when it failed. Cast to string to prevent BigQuery grouping errors."
  }

  dimension: total_ms {
    group_label: "Latency"
    description: "The amount of time in milliseconds the tool ran before throwing the error."
  }

  # --- BASE MEASURES ---

  measure: total_tool_errors {
    group_label: "Performance & Reliability"
    type: count
    description: "Total number of tool calls that resulted in an error status."
    drill_fields: []
    
    link: {
      label: "The Root Cause Inspector (Data Table)"
      url: "@{VIZ_GRID_TABLE}{{ link }}&fields=agent_events.timestamp_time,agent_events.trace_id,{{ _view._name }}.tool_name,agent_events.agent,{{ _view._name }}.tool_args,agent_events.error_message&sorts=agent_events.timestamp_time+desc&limit=50&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Error Distribution by Tool (Donut Chart)"
      url: "@{VIZ_DONUT_CHART}{{ link }}&fields={{ _view._name }}.tool_name,{{ _view._name }}.total_tool_errors&sorts={{ _view._name }}.total_tool_errors+desc&limit=10&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis"
    }
    link: {
      label: "Error Trend Breakdown (Area Chart)"
      url: "@{VIZ_STACKED_AREA}{{ link }}&fields=agent_events.timestamp_date,agent_events.agent,{{ _view._name }}.total_tool_errors&pivots=agent_events.agent&sorts=agent_events.timestamp_date+desc&limit=500&column_limit=10&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis"
    }
  }

  # --- POP MEASURES: TOOL ERRORS ---

  measure: pop_tool_errors_current {
    group_label: "PoP: Tool Errors"
    type: count
    filters: [agent_events.is_current_period: "yes"]
    description: "Total tool errors in the currently selected PoP date range."
  }

  measure: pop_tool_errors_previous {
    group_label: "PoP: Tool Errors"
    type: count
    filters: [agent_events.is_previous_period: "yes"]
    description: "Total tool errors in the previous period of the exact same length."
  }

  measure: pop_tool_errors_change {
    group_label: "PoP: Tool Errors"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${pop_tool_errors_current} - ${pop_tool_errors_previous}, ${pop_tool_errors_previous}) ;;
    description: "The percentage change in tool errors between the current and previous period."
  }

}