include: "/views/raw/agent_events.view.lkml"

view: +agent_events {
  sql_table_name: `@{PROJECT_ID}.@{DATASET_NAME}.agent_events` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${trace_id}, '|', ${span_id}) ;;
  }

  # --- PERIOD OVER PERIOD (POP) ENGINE ---

  filter: pop_date_filter {
    type: date
    description: "Global date filter for driving Period-over-Period (PoP) scorecard comparisons."
  }

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: {% condition pop_date_filter %} ${timestamp_raw} {% endcondition %} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${timestamp_raw} >= TIMESTAMP_SUB(CAST({% date_start pop_date_filter %} AS TIMESTAMP), INTERVAL DATE_DIFF(CAST({% date_end pop_date_filter %} AS DATE), CAST({% date_start pop_date_filter %} AS DATE), DAY) DAY)
         AND ${timestamp_raw} < CAST({% date_start pop_date_filter %} AS TIMESTAMP) ;;
  }

  # --- DIMENSIONS ---

  dimension: session_id { 
    group_label: "IDs & Tracing"
    description: "A unique identifier for the entire conversation session. Used to group all events belonging to a single user interaction."
  }
  
  dimension: user_id { 
    group_label: "IDs & Tracing"
    description: "The identifier of the end-user participating in the session, if available."
  }
  
  dimension: trace_id { 
    group_label: "IDs & Tracing"
    description: "OpenTelemetry trace ID for distributed tracing across services."
  }
  
  dimension: span_id { 
    group_label: "IDs & Tracing"
    description: "OpenTelemetry span ID for this specific operation."
  }
  
  dimension: parent_span_id { 
    group_label: "IDs & Tracing"
    description: "OpenTelemetry parent span ID to reconstruct the operation hierarchy."
  }
  
  dimension: invocation_id { 
    group_label: "IDs & Tracing"
    description: "A unique identifier for a single turn or execution within a session."
  }
  
  dimension: event_type { 
    group_label: "Event Info"
    description: "The category of the event."
  }
  
  dimension: agent { 
    group_label: "Event Info"
    description: "The name of the agent that generated this event."
  }
  
  dimension: status { 
    group_label: "Event Info"
    description: "The outcome of the event, typically 'OK' or 'ERROR'."
  }
  
  dimension: error_message { 
    group_label: "Event Info"
    description: "Detailed error message if the status is 'ERROR'."
  }
  
  dimension_group: timestamp {
    description: "The UTC timestamp when the event occurred."
  }
  
  dimension: is_truncated {
    description: "Boolean flag indicating if the 'content' field was truncated."
  }

  # --- BASE MEASURES ---
  
  measure: total_invocations {
    group_label: "Usage & Volume"
    type: count_distinct
    sql: ${invocation_id} ;;
    description: "Total number of distinct turns or invocations within all sessions."
  }

  measure: total_traces {
    group_label: "Usage & Volume"
    type: count_distinct
    sql: ${trace_id} ;;
    description: "Total number of unique traces representing agent execution flows."
  }

  measure: total_sessions {
    group_label: "Usage & Volume"
    type: count_distinct
    sql: ${session_id} ;;
    description: "Total number of unique interaction sessions."
  }

  measure: total_users {
    group_label: "Usage & Volume"
    type: count_distinct
    sql: ${user_id} ;;
    description: "Total number of unique users interacting with the agents."
  }

  # --- POP MEASURES: INVOCATIONS ---

  measure: pop_total_invocations_current {
    group_label: "PoP: Total Invocations"
    type: count_distinct
    sql: ${invocation_id} ;;
    filters: [is_current_period: "yes"]
    description: "Total invocations in the currently selected PoP date range."
  }

  measure: pop_total_invocations_previous {
    group_label: "PoP: Total Invocations"
    type: count_distinct
    sql: ${invocation_id} ;;
    filters: [is_previous_period: "yes"]
    description: "Total invocations in the previous period of the exact same length."
  }

  measure: pop_total_invocations_change {
    group_label: "PoP: Total Invocations"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${pop_total_invocations_current} - ${pop_total_invocations_previous}, ${pop_total_invocations_previous}) ;;
    description: "The percentage change in invocations between the current and previous period."
  }

  # --- POP MEASURES: TRACES ---

  measure: pop_total_traces_current {
    group_label: "PoP: Total Traces"
    type: count_distinct
    sql: ${trace_id} ;;
    filters: [is_current_period: "yes"]
    description: "Total traces in the currently selected PoP date range."
  }

  measure: pop_total_traces_previous {
    group_label: "PoP: Total Traces"
    type: count_distinct
    sql: ${trace_id} ;;
    filters: [is_previous_period: "yes"]
    description: "Total traces in the previous period of the exact same length."
  }

  measure: pop_total_traces_change {
    group_label: "PoP: Total Traces"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${pop_total_traces_current} - ${pop_total_traces_previous}, ${pop_total_traces_previous}) ;;
    description: "The percentage change in traces between the current and previous period."
  }

  # --- POP MEASURES: SESSIONS ---

  measure: pop_total_sessions_current {
    group_label: "PoP: Total Sessions"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [is_current_period: "yes"]
    description: "Total sessions in the currently selected PoP date range."
  }

  measure: pop_total_sessions_previous {
    group_label: "PoP: Total Sessions"
    type: count_distinct
    sql: ${session_id} ;;
    filters: [is_previous_period: "yes"]
    description: "Total sessions in the previous period of the exact same length."
  }

  measure: pop_total_sessions_change {
    group_label: "PoP: Total Sessions"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${pop_total_sessions_current} - ${pop_total_sessions_previous}, ${pop_total_sessions_previous}) ;;
    description: "The percentage change in sessions between the current and previous period."
  }

  # --- POP MEASURES: USERS ---

  measure: pop_total_users_current {
    group_label: "PoP: Total Users"
    type: count_distinct
    sql: ${user_id} ;;
    filters: [is_current_period: "yes"]
    description: "Total unique users in the currently selected PoP date range."
  }

  measure: pop_total_users_previous {
    group_label: "PoP: Total Users"
    type: count_distinct
    sql: ${user_id} ;;
    filters: [is_previous_period: "yes"]
    description: "Total unique users in the previous period of the exact same length."
  }

  measure: pop_total_users_change {
    group_label: "PoP: Total Users"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${pop_total_users_current} - ${pop_total_users_previous}, ${pop_total_users_previous}) ;;
    description: "The percentage change in users between the current and previous period."
  }

}