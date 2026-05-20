project_name: "agent-analytics"

constant: CONNECTION_NAME {
  value: "default_bigquery_connection"
  export: override_optional
}

constant: DATASET_NAME {
  value: "looker-marketplace-development.agent_analytic"
  export: override_optional
}