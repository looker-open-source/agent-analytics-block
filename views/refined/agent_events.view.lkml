include: "/views/raw/agent_events.view.lkml"

view: +agent_events {
  derived_table: {
    sql: 
      SELECT 
        * EXCEPT(attributes, content, latency_ms),
        CAST(JSON_VALUE(attributes, '$.usage_metadata.total_token_count') AS INT64) as total_tokens,
        JSON_VALUE(content, '$.tool') as tool_name,
        SAFE_CAST(JSON_VALUE(latency_ms, '$.total_ms') AS INT64) as latency_total_ms
      FROM `@{DATASET_NAME}.agent_events_v2`
    ;;
  }

  # --- DIMENSION REFINEMENTS (GROUPING & DESCRIPTIONS) ---
  
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
    description: "A unique identifier for a single turn or execution within a session. Groups related events like LLM request and response."
  }

  dimension: event_type { 
    group_label: "Event Info"
    description: "The category of the event (e.g., 'LLM_REQUEST', 'TOOL_CALL', 'AGENT_RESPONSE'). Helps in filtering specific types of interactions."
  }
  dimension: agent { 
    group_label: "Event Info"
    description: "The name of the agent that generated this event. Useful for multi-agent systems."
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
    description: "The UTC timestamp when the event occurred. Used for ordering events within a session."
  }

  dimension: is_truncated {
    description: "Boolean flag indicating if the 'content' field was truncated because it exceeded the maximum allowed size."
  }

  # --- EXPLICIT EXTRACTED DIMENSIONS ---

  dimension: total_tokens_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.total_tokens ;;
  }

  dimension: tool_name {
    group_label: "Event Info"
    type: string
    sql: ${TABLE}.tool_name ;;
    description: "The name of the tool invoked by the agent."
  }

  dimension: latency_total_ms {
    hidden: yes
    type: number
    sql: ${TABLE}.latency_total_ms ;;
  }

  dimension: is_tool_event {
    group_label: "Event Info"
    type: yesno
    sql: ${event_type} LIKE '%TOOL%' AND ${tool_name} IS NOT NULL ;;
    description: "Indicates if the event is related to a tool invocation."
  }

  # --- CORE MEASURES ---

  measure: total_tokens {
    group_label: "Usage & Volume"
    type: sum
    sql: ${total_tokens_raw} ;;
    description: "The total number of tokens consumed in a given duration."
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

  measure: total_tool_usage {
    group_label: "Usage & Volume"
    type: count
    filters: [is_tool_event: "Yes"]
    description: "Total number of times a tool was utilized."
  }

  measure: total_llm_calls {
    group_label: "Usage & Volume"
    type: count
    filters: [event_type: "LLM_REQUEST"]
    description: "Total number of requests made to the LLM."
  }

  measure: total_users {
    group_label: "Usage & Volume"
    type: count_distinct
    sql: ${user_id} ;;
    description: "Total number of unique users interacting with the agents."
  }
  
  measure: total_tool_errors {
    group_label: "Performance & Reliability"
    type: count
    filters: [status: "ERROR", is_tool_event: "Yes"]
    description: "Total number of tool calls that resulted in an error status."
  }

  # --- PERFORMANCE & LATENCY MEASURES ---

  measure: p50_tool_latency {
    group_label: "Performance & Reliability"
    type: percentile
    percentile: 50
    sql: ${latency_total_ms} ;;
    filters: [event_type: "TOOL_COMPLETED"]
    description: "Median (P50) latency for tool completion in milliseconds."
  }

  measure: p90_tool_latency {
    group_label: "Performance & Reliability"
    type: percentile
    percentile: 90
    sql: ${latency_total_ms} ;;
    filters: [event_type: "TOOL_COMPLETED"]
    description: "90th percentile latency for tool completion in milliseconds."
  }

  measure: p99_tool_latency {
    group_label: "Performance & Reliability"
    type: percentile
    percentile: 99
    sql: ${latency_total_ms} ;;
    filters: [event_type: "TOOL_COMPLETED"]
    description: "99th percentile latency for tool completion in milliseconds."
  }

  measure: p50_llm_latency {
    group_label: "Performance & Reliability"
    type: percentile
    percentile: 50
    sql: ${latency_total_ms} ;;
    filters: [event_type: "LLM_RESPONSE"]
    description: "Median (P50) latency for LLM responses in milliseconds."
  }

  measure: p90_llm_latency {
    group_label: "Performance & Reliability"
    type: percentile
    percentile: 90
    sql: ${latency_total_ms} ;;
    filters: [event_type: "LLM_RESPONSE"]
    description: "90th percentile latency for LLM responses in milliseconds."
  }

  measure: p99_llm_latency {
    group_label: "Performance & Reliability"
    type: percentile
    percentile: 99
    sql: ${latency_total_ms} ;;
    filters: [event_type: "LLM_RESPONSE"]
    description: "99th percentile latency for LLM responses in milliseconds."
  }
}