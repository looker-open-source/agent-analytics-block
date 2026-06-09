view: session_facts {
  derived_table: {
    sql:
      SELECT
        session_id,
        MIN(timestamp) as session_start,
        MAX(timestamp) as session_end,
        TIMESTAMP_DIFF(MAX(timestamp), MIN(timestamp), MILLISECOND) as session_duration_ms
      FROM `@{PROJECT_ID}.@{DATASET_NAME}.@{TABLE_NAME}`
      GROUP BY 1
    ;;
  }

  dimension: session_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session_start {
    type: time
    sql: ${TABLE}.session_start ;;
  }

  dimension_group: session_end {
    type: time
    sql: ${TABLE}.session_end ;;
  }

  dimension: session_duration_ms {
    hidden: yes
    type: number
    sql: ${TABLE}.session_duration_ms ;;
  }

  measure: p50_session_duration {
    type: percentile
    percentile: 50
    sql: ${session_duration_ms} ;;
    description: "Median (P50) session duration in milliseconds."
  }

  measure: p90_session_duration {
    type: percentile
    percentile: 90
    sql: ${session_duration_ms} ;;
    description: "90th percentile session duration in milliseconds."
  }

  measure: p99_session_duration {
    type: percentile
    percentile: 99
    sql: ${session_duration_ms} ;;
    description: "99th percentile session duration in milliseconds."
  }

  measure: average_session_duration {
    type: average
    sql: ${session_duration_ms} ;;
    description: "Average session duration in milliseconds."
  }
}