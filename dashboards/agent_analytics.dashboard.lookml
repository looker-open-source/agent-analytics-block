---
- dashboard: agent_analytics
  title: Agent Analytics
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: hOQMFiVaYVFNe8iFl4FJqc
  layout: newspaper
  tabs:
  - name: Summary
    label: Summary
  - name: Top N Agents
    label: Top N Agents
  - name: Top N Users
    label: Top N Users
  - name: Top N Tools
    label: Top N Tools
  - name: Performance & Latency
    label: Performance & Latency
  elements:
  - title: Distinct Users Over Time
    name: Distinct Users Over Time
    model: agent-analytics
    explore: agent_events
    type: looker_column
    fields: [agent_events.timestamp_date, agent_events.total_users]
    fill_fields: [agent_events.timestamp_date]
    sorts: [agent_events.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 9
    width: 15
    height: 4
    tab_name: Summary
  - title: System Errors Over Time
    name: System Errors Over Time
    model: agent-analytics
    explore: agent_events
    type: looker_area
    fields: [agent_events.timestamp_date, v_tool_error.total_tool_errors]
    fill_fields: [agent_events.timestamp_date]
    sorts: [agent_events.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_error.total_tool_errors: "#d93025"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 4
    col: 9
    width: 15
    height: 4
    tab_name: Summary
  - title: Prompt Tokens Consumed
    name: Prompt Tokens Consumed
    model: agent-analytics
    explore: agent_events
    type: looker_area
    fields: [agent_events.timestamp_date, v_llm_response.total_prompt_tokens]
    fill_fields: [agent_events.timestamp_date]
    sorts: [agent_events.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_error.total_tool_errors: "#1e8e3e"
      v_llm_response.total_prompt_tokens: "#1e8e3e"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 8
    col: 9
    width: 15
    height: 4
    tab_name: Summary
  - title: Completion Tokens Generated
    name: Completion Tokens Generated
    model: agent-analytics
    explore: agent_events
    type: looker_area
    fields: [agent_events.timestamp_date, v_llm_response.total_completion_tokens]
    fill_fields: [agent_events.timestamp_date]
    sorts: [agent_events.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_error.total_tool_errors: "#1e8e3e"
      v_llm_response.total_completion_tokens: "#f9ab00"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 12
    col: 9
    width: 15
    height: 4
    tab_name: Summary
  - title: Total users
    name: Total users
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [agent_events.total_users]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    series_colors:
      v_tool_error.total_tool_errors: "#1e8e3e"
      v_llm_response.total_completion_tokens: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 0
    width: 9
    height: 4
    tab_name: Summary
  - title: Total Errors
    name: Total Errors
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [v_tool_error.total_tool_errors]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    series_colors:
      v_tool_error.total_tool_errors: "#1e8e3e"
      v_llm_response.total_completion_tokens: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 4
    col: 0
    width: 9
    height: 4
    tab_name: Summary
  - title: Total Prompt Tokens
    name: Total Prompt Tokens
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [v_llm_response.total_prompt_tokens]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    series_colors:
      v_tool_error.total_tool_errors: "#1e8e3e"
      v_llm_response.total_completion_tokens: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 8
    col: 0
    width: 9
    height: 4
    tab_name: Summary
  - title: Total Completion Tokens
    name: Total Completion Tokens
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [v_llm_response.total_completion_tokens]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    series_colors:
      v_tool_error.total_tool_errors: "#1e8e3e"
      v_llm_response.total_completion_tokens: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 12
    col: 0
    width: 9
    height: 4
    tab_name: Summary
  - title: Top Agents by Unique Users
    name: Top Agents by Unique Users
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [agent_events.agent, agent_events.total_users]
    sorts: [agent_events.total_users desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 0
    width: 12
    height: 6
    tab_name: Top N Agents
  - title: Top Agents by Session Volume
    name: Top Agents by Session Volume
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [agent_events.agent, agent_events.total_sessions]
    sorts: [agent_events.total_sessions desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      agent_events.total_sessions: "#f9ab00"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 6
    col: 0
    width: 12
    height: 6
    tab_name: Top N Agents
  - title: Top Agents by Interaction Turns
    name: Top Agents by Interaction Turns
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [agent_events.agent, agent_events.total_invocations]
    sorts: [agent_events.total_invocations desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      agent_events.total_sessions: "#1e8e3e"
      agent_events.total_invocations: "#1e8e3e"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 6
    col: 12
    width: 12
    height: 6
    tab_name: Top N Agents
  - title: Top Agents by Interaction Turns
    name: Top Agents by Interaction Turns (2)
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [agent_events.agent, v_tool_error.total_tool_errors]
    sorts: [v_tool_error.total_tool_errors desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      agent_events.total_sessions: "#1e8e3e"
      agent_events.total_invocations: "#1e8e3e"
      v_tool_error.total_tool_errors: "#d93025"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 12
    width: 12
    height: 6
    tab_name: Top N Agents
  - title: Agents Performance
    name: Agents Performance
    model: agent-analytics
    explore: agent_events
    type: looker_grid
    fields: [agent_events.agent, agent_events.total_users, agent_events.total_sessions,
      agent_events.total_invocations, v_tool_error.total_tool_errors]
    sorts: [v_tool_error.total_tool_errors desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors:
      agent_events.total_sessions: "#1e8e3e"
      agent_events.total_invocations: "#1e8e3e"
      v_tool_error.total_tool_errors: "#d93025"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 12
    col: 0
    width: 24
    height: 5
    tab_name: Top N Agents
  - title: Most Expensive Users (Token Breakdown)
    name: Most Expensive Users (Token Breakdown)
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [agent_events.user_id, v_llm_response.total_prompt_tokens, v_llm_response.total_completion_tokens]
    sorts: [v_llm_response.total_prompt_tokens desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.total_prompt_tokens: "#1a73e8"
      v_llm_response.total_completion_tokens: "#f9ab00"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 0
    width: 24
    height: 8
    tab_name: Top N Users
  - title: User Behavior
    name: User Behavior
    model: agent-analytics
    explore: agent_events
    type: looker_grid
    fields: [agent_events.user_id, agent_events.total_sessions, agent_events.total_invocations,
      v_tool_error.total_tool_errors]
    sorts: [agent_events.total_sessions desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      agent_events.total_sessions:
        is_active: true
      agent_events.total_invocations:
        is_active: true
        palette:
          palette_id: c6acba0f-d7de-adc2-6536-fab7e1702f37
          collection_id: looker-blocks
          custom_colors:
          - "#ddfce9"
          - "#2ac23c"
      v_tool_error.total_tool_errors:
        is_active: true
        palette:
          palette_id: 5de5f7f7-4194-14c3-eb38-63ee3badef53
          collection_id: looker-blocks
          custom_colors:
          - "#fccfc6"
          - "#e81d17"
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_style: solid
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.total_prompt_tokens: "#1a73e8"
      v_llm_response.total_completion_tokens: "#f9ab00"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 8
    col: 0
    width: 24
    height: 10
    tab_name: Top N Users
  - title: Most Expensive Tools
    name: Most Expensive Tools
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [v_tool_completed.tool_name, v_llm_response.total_tokens_consumed]
    sorts: [v_llm_response.total_tokens_consumed desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.total_tokens_consumed: "#e8710a"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 0
    width: 12
    height: 7
    tab_name: Top N Tools
  - title: Most Necessary Tools
    name: Most Necessary Tools
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [v_tool_completed.tool_name, agent_events.total_sessions]
    filters:
      v_tool_completed.tool_name: "-NULL"
    sorts: [agent_events.total_sessions desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.total_tokens_consumed: "#e8710a"
      agent_events.total_sessions: "#1e8e3e"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 12
    width: 12
    height: 7
    tab_name: Top N Tools
  - title: Highest Frequency Tools
    name: Highest Frequency Tools
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [v_tool_completed.tool_name, v_tool_completed.total_tool_usage]
    filters:
      v_tool_completed.tool_name: "-NULL"
    sorts: [v_tool_completed.total_tool_usage desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.total_tokens_consumed: "#e8710a"
      agent_events.total_sessions: "#1e8e3e"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 7
    col: 12
    width: 12
    height: 7
    tab_name: Top N Tools
  - title: Tool Reach (Unique Users)
    name: Tool Reach (Unique Users)
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [v_tool_completed.tool_name, agent_events.total_users]
    filters:
      v_tool_completed.tool_name: "-NULL"
    sorts: [agent_events.total_users desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.total_tokens_consumed: "#e8710a"
      agent_events.total_sessions: "#1e8e3e"
      agent_events.total_users: "#e52592"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 7
    col: 0
    width: 12
    height: 7
    tab_name: Top N Tools
  - title: LLM Response Latency (P50, P90, P99)
    name: LLM Response Latency (P50, P90, P99)
    model: agent-analytics
    explore: agent_events
    type: looker_line
    fields: [agent_events.timestamp_date, v_llm_response.p50_llm_latency, v_llm_response.p90_llm_latency,
      v_llm_response.p99_llm_latency]
    fill_fields: [agent_events.timestamp_date]
    sorts: [agent_events.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.p90_llm_latency: "#f9ab00"
      v_llm_response.p99_llm_latency: "#d93025"
      v_llm_response.p50_llm_latency: "#1e8e3e"
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 7
    col: 0
    width: 12
    height: 7
    tab_name: Performance & Latency
  - title: Tool Latency Over Time
    name: Tool Latency Over Time
    model: agent-analytics
    explore: agent_events
    type: looker_line
    fields: [agent_events.timestamp_date, v_tool_completed.p50_tool_latency, v_tool_completed.p90_tool_latency,
      v_tool_completed.p99_tool_latency]
    sorts: [agent_events.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_llm_response.p90_llm_latency: "#f9ab00"
      v_llm_response.p99_llm_latency: "#d93025"
      v_tool_completed.p90_tool_latency: "#f9ab00"
      v_tool_completed.p99_tool_latency: "#d93025"
      v_tool_completed.p50_tool_latency: "#1e8e3e"
    defaults_version: 1
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 7
    col: 12
    width: 12
    height: 7
    tab_name: Performance & Latency
  - title: Session Length Distribution
    name: Session Length Distribution
    model: agent-analytics
    explore: agent_events
    type: looker_column
    fields: [session_facts.average_session_duration, session_facts.p50_session_duration,
      session_facts.p90_session_duration, session_facts.p99_session_duration]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      session_facts.p50_session_duration: "#1e8e3e"
      session_facts.p99_session_duration: "#d93025"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 0
    col: 0
    width: 24
    height: 7
    tab_name: Performance & Latency
  - title: Slowest Tools Analysis
    name: Slowest Tools Analysis
    model: agent-analytics
    explore: agent_events
    type: looker_grid
    fields: [v_tool_completed.tool_name, v_tool_completed.p90_tool_latency, v_tool_completed.total_tool_usage]
    filters:
      v_tool_completed.tool_name: "-NULL"
    sorts: [v_tool_completed.p90_tool_latency desc 0]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      v_tool_completed.p90_tool_latency:
        is_active: true
        palette:
          palette_id: fd624abd-b391-8a70-f8cf-c8858bf6076a
          collection_id: looker-blocks
          custom_colors:
          - "#fcd3c1"
          - "#e8732f"
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_style: solid
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors:
      session_facts.p50_session_duration: "#1e8e3e"
      session_facts.p99_session_duration: "#d93025"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: agent_events.timestamp_date
      User ID: agent_events.user_id
      Trace ID: agent_events.trace_id
      Span ID: agent_events.span_id
      Agent: v_llm_response.agent
    row: 14
    col: 0
    width: 24
    height: 6
    tab_name: Performance & Latency
  filters:
  - name: Agent
    title: Agent
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: agent-analytics
    explore: agent_events
    listens_to_filters: []
    field: v_llm_response.agent
  - name: User ID
    title: User ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: agent-analytics
    explore: agent_events
    listens_to_filters: []
    field: agent_events.user_id
  - name: Trace ID
    title: Trace ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: agent-analytics
    explore: agent_events
    listens_to_filters: []
    field: agent_events.trace_id
  - name: Span ID
    title: Span ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: agent-analytics
    explore: agent_events
    listens_to_filters: []
    field: agent_events.span_id
  - name: Date
    title: Date
    type: field_filter
    default_value: 14 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: agent-analytics
    explore: agent_events
    listens_to_filters: []
    field: agent_events.timestamp_date
