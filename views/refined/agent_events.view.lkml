include: "/views/raw/agent_events.view.lkml"

view: +agent_events {
  sql_table_name: `@{PROJECT_ID}.@{DATASET_NAME}.agent_events_v2` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${trace_id}, '|', ${span_id}) ;;
  }

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

}