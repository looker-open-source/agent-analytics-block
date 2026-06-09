view: agent_events {

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: agent {
    type: string
    sql: ${TABLE}.agent ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: invocation_id {
    type: string
    sql: ${TABLE}.invocation_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: trace_id {
    type: string
    sql: ${TABLE}.trace_id ;;
  }

  dimension: span_id {
    type: string
    sql: ${TABLE}.span_id ;;
  }

  dimension: parent_span_id {
    type: string
    sql: ${TABLE}.parent_span_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  dimension: is_truncated {
    type: yesno
    sql: ${TABLE}.is_truncated ;;
  }

}