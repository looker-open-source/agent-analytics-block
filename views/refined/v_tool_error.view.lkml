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

  measure: total_tool_errors {
    group_label: "Performance & Reliability"
    type: count
    description: "Total number of tool calls that resulted in an error status."
  }

}