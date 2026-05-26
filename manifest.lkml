project_name: "agent-analytics"

constant: CONNECTION_NAME {
  value: "default_bigquery_connection"
  export: override_optional
}

constant: PROJECT_ID {
  value: "looker-marketplace-development"
  export: override_optional
}

constant: DATASET_NAME {
  value: "agent_analytic"
  export: override_optional
}
