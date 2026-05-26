include: "/views/raw/v_tool_error.view.lkml"

view: +v_tool_error {
  sql_table_name: `@{PROJECT_ID}.@{DATASET_NAME}.v_tool_error` ;;

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
    description: "The JSON arguments that were passed to the tool when it failed. Useful for debugging."
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