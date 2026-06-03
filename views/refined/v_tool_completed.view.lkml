include: "/views/raw/v_tool_completed.view.lkml"

view: +v_tool_completed {
  sql_table_name: `@{PROJECT_ID}.@{DATASET_NAME}.v_tool_completed` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${trace_id}, '|', ${span_id}) ;;
    description: "Internal composite primary key for symmetric aggregates."
  }

  dimension: tool_name {
    group_label: "Tool Info"
    description: "The specific name of the tool or function that was executed."
  }

  dimension: tool_origin {
    group_label: "Tool Info"
    description: "The origin of the tool execution (e.g., LOCAL, MCP, SUB_AGENT)."
  }

  dimension: tool_result {
    group_label: "Tool Info"
    description: "The raw JSON result or output string returned by the tool."
  }

  dimension: total_ms {
    group_label: "Latency"
    description: "The total execution time of the tool in milliseconds."
  }

  # --- BASE MEASURES ---

  measure: total_tool_usage {
    group_label: "Usage & Volume"
    type: count
    description: "Total number of times a tool was successfully completed."
    drill_fields: [agent_events.timestamp_time, agent_events.agent, agent_events.user_id, agent_events.trace_id, tool_name, total_ms]
  }

  measure: average_tool_latency {
    group_label: "Performance & Reliability"
    type: average
    sql: ${total_ms} ;;
    description: "Average latency for tool completion in milliseconds."
    value_format_name: decimal_1
  }

  measure: p50_tool_latency {
    group_label: "Performance & Reliability"
    label: "P50 Latency"
    type: percentile
    percentile: 50
    sql: ${total_ms} ;;
    description: "Median (P50) latency for tool completion in milliseconds."
  }

  measure: p75_tool_latency {
    group_label: "Performance & Reliability"
    label: "P75 Latency"
    type: percentile
    percentile: 75
    sql: ${total_ms} ;;
    description: "75th percentile latency for tool completion in milliseconds."
  }

  measure: p90_tool_latency {
    group_label: "Performance & Reliability"
    label: "P90 Latency"
    type: percentile
    percentile: 90
    sql: ${total_ms} ;;
    description: "90th percentile latency for tool completion in milliseconds."
  }

  measure: p99_tool_latency {
    group_label: "Performance & Reliability"
    label: "P99 Latency"
    type: percentile
    percentile: 99
    sql: ${total_ms} ;;
    description: "99th percentile latency for tool completion in milliseconds."
  }

  # --- POP MEASURES: TOOL USAGE ---

  measure: pop_tool_usage_current {
    group_label: "PoP: Tool Usage"
    type: count
    filters: [agent_events.is_current_period: "yes"]
    description: "Total tool executions in the currently selected PoP date range."
  }

  measure: pop_tool_usage_previous {
    group_label: "PoP: Tool Usage"
    type: count
    filters: [agent_events.is_previous_period: "yes"]
    description: "Total tool executions in the previous period of the exact same length."
  }

  measure: pop_tool_usage_change {
    group_label: "PoP: Tool Usage"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${pop_tool_usage_current} - ${pop_tool_usage_previous}, ${pop_tool_usage_previous}) ;;
    description: "The percentage change in tool executions between the current and previous period."
  }

}
