include: "/views/refined/*.view.lkml"

explore: agent_events {
  label: "Agent Analytics"
  description: "Analyze agent interactions, trace execution paths, evaluate LLM token usage, and monitor tool performance and errors."

  join: session_facts {
    type: left_outer
    sql_on: ${agent_events.session_id} = ${session_facts.session_id} ;;
    relationship: many_to_one
  }

  join: v_llm_response {
    type: left_outer
    sql_on: ${agent_events.invocation_id} = ${v_llm_response.invocation_id} ;;
    relationship: many_to_many
  }

  join: v_tool_completed {
    type: left_outer
    sql_on: ${agent_events.invocation_id} = ${v_tool_completed.invocation_id} ;;
    relationship: many_to_many
  }

  join: v_tool_error {
    type: left_outer
    sql_on: ${agent_events.invocation_id} = ${v_tool_error.invocation_id} ;;
    relationship: many_to_many
  }
}
