---
- dashboard: performance_report
  title: Performance Report
  preferred_viewer: dashboards-next
  description: ''
  layout: newspaper
  tabs:
  - name: System Performance & Latency
    label: System Performance & Latency
  - name: Reliability & Errors
    label: Reliability & Errors
  - name: Session Deep Dive
    label: Session Deep Dive
  elements:
  - title: Average Tool Latency (ms)
    name: Average Tool Latency (ms)
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [v_tool_completed.average_tool_latency]
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The average time (in milliseconds) it takes for backend tools and functions
      to execute and return a result.
    listen:
      Trace ID: agent_events.trace_id
      Agent: agent_events.agent
      User ID: agent_events.user_id
      Span ID: agent_events.span_id
      Tool Name: v_tool_completed.tool_name
      Date: agent_events.timestamp_date
    row: 2
    col: 0
    width: 7
    height: 6
    tab_name: System Performance & Latency
  - title: Tool Latency Trend
    name: Tool Latency Trend
    model: agent-analytics
    explore: agent_events
    type: looker_area
    fields: [v_tool_completed.timestamp_date, v_tool_completed.average_tool_latency]
    fill_fields: [v_tool_completed.timestamp_date]
    sorts: [v_tool_completed.timestamp_date desc]
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_completed.p50_tool_latency: "#f9ab00"
      v_tool_completed.average_tool_latency: "#f9ab00"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: An area chart tracking the historical trend of average tool execution
      times, helping identify backend performance degradation.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 2
    col: 7
    width: 17
    height: 6
    tab_name: System Performance & Latency
  - title: Tool Latency (in ms)
    name: Tool Latency (in ms)
    model: agent-analytics
    explore: agent_events
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [v_tool_completed.p50_tool_latency, v_tool_completed.p75_tool_latency,
      v_tool_completed.p90_tool_latency, v_tool_completed.p99_tool_latency]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '14'
    orientation: auto
    style_v_tool_completed.p50_tool_latency: "#3A4245"
    show_title_v_tool_completed.p50_tool_latency: true
    title_placement_v_tool_completed.p50_tool_latency: above
    value_format_v_tool_completed.p50_tool_latency: ''
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_colors:
      v_tool_completed.p50_tool_latency: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The P50, P75, P90, and P99 latency distributions for tool executions.
      Focus on P99 to identify the worst-case timeouts.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 8
    col: 0
    width: 24
    height: 4
    tab_name: System Performance & Latency
  - title: LLM Latency (in ms)
    name: LLM Latency (in ms)
    model: agent-analytics
    explore: agent_events
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [v_llm_response.p50_llm_latency, v_llm_response.p75_llm_latency, v_llm_response.p90_llm_latency,
      v_llm_response.p99_llm_latency]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '14'
    orientation: auto
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_colors:
      v_tool_completed.p50_tool_latency: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    style_v_tool_completed.p50_tool_latency: "#3A4245"
    show_title_v_tool_completed.p50_tool_latency: true
    title_placement_v_tool_completed.p50_tool_latency: above
    value_format_v_tool_completed.p50_tool_latency: ''
    note_state: collapsed
    note_display: hover
    note_text: The P50, P75, P90, and P99 latency distributions for LLM calls. Crucial
      for understanding the true user experience delay.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 20
    col: 0
    width: 24
    height: 4
    tab_name: System Performance & Latency
  - title: Average LLM Latency (in ms)
    name: Average LLM Latency (in ms)
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [v_llm_response.average_llm_latency]
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
    smart_single_value_size: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '14'
    orientation: auto
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_colors:
      v_tool_completed.p50_tool_latency: "#f9ab00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    style_v_tool_completed.p50_tool_latency: "#3A4245"
    show_title_v_tool_completed.p50_tool_latency: true
    title_placement_v_tool_completed.p50_tool_latency: above
    value_format_v_tool_completed.p50_tool_latency: ''
    note_state: collapsed
    note_display: hover
    note_text: The average round-trip time (in milliseconds) it takes for the LLM
      to process a prompt and return a response.
    title_hidden: true
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 14
    col: 0
    width: 8
    height: 6
    tab_name: System Performance & Latency
  - title: LLM Latency Trend
    name: LLM Latency Trend
    model: agent-analytics
    explore: agent_events
    type: looker_area
    fields: [v_llm_response.average_llm_latency, agent_events.timestamp_date]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_completed.p50_tool_latency: "#f9ab00"
      v_llm_response.average_llm_latency: "#e8710a"
    series_labels: {}
    font_size_main: '14'
    orientation: auto
    hidden_fields: []
    hidden_points_if_no: []
    ordering: none
    show_null_labels: false
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    style_v_tool_completed.p50_tool_latency: "#3A4245"
    show_title_v_tool_completed.p50_tool_latency: true
    title_placement_v_tool_completed.p50_tool_latency: above
    value_format_v_tool_completed.p50_tool_latency: ''
    style_v_llm_response.average_llm_latency: "#3A4245"
    show_title_v_llm_response.average_llm_latency: true
    title_placement_v_llm_response.average_llm_latency: above
    value_format_v_llm_response.average_llm_latency: ''
    note_state: collapsed
    note_display: hover
    note_text: An area chart tracking historical LLM response times to identify API
      throttling or model performance issues.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 14
    col: 8
    width: 16
    height: 6
    tab_name: System Performance & Latency
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Tool Latency"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 6
    width: 13
    height: 2
    tab_name: System Performance & Latency
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"LLM Latency"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 12
    col: 5
    width: 15
    height: 2
    tab_name: System Performance & Latency
  - type: button
    name: button_871
    rich_content_json: '{"text":"Agent Analytics Report","description":"","newTab":false,"alignment":"center","size":"medium","style":"FILLED","color":"#E52592","href":"/dashboards/agent-analytics::agent_analytics_v2"}'
    row: 0
    col: 20
    width: 4
    height: 2
    tab_name: System Performance & Latency
  - title: Total Errors
    name: Total Errors
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [v_tool_error.pop_tool_errors_current, v_tool_error.pop_tool_errors_change]
    filters:
      agent_events.pop_date_filter: 7 days
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: false
    comparison_label: vs Last Period
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The total number of backend tool executions that resulted in an error
      status, including the Period-over-Period trend.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.pop_date_filter
    row: 0
    col: 0
    width: 8
    height: 7
    tab_name: Reliability & Errors
  - title: Tool Errors Trend
    name: Tool Errors Trend
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_error.total_tool_errors: "#a50e0e"
    custom_color_enabled: true
    show_single_value_title: true
    smart_single_value_size: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs Last Period
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A daily time-series tracking the volume of tool failures. Click a spike
      to drill down into the raw error logs.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 0
    col: 8
    width: 16
    height: 7
    tab_name: Reliability & Errors
  - title: Top 5 Agents By Errors
    name: Top 5 Agents By Errors
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [v_tool_error.total_tool_errors, agent_events.agent]
    sorts: [v_tool_error.total_tool_errors desc 0]
    limit: 5
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_error.total_tool_errors: "#e8710a"
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    smart_single_value_size: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs Last Period
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A ranking showing which specific agents are experiencing the highest
      volume of failures.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 7
    col: 0
    width: 12
    height: 7
    tab_name: Reliability & Errors
  - title: Top 5 Tools by Errors
    name: Top 5 Tools by Errors
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [v_tool_error.total_tool_errors, v_tool_error.tool_name]
    sorts: [v_tool_error.total_tool_errors desc 0]
    limit: 5
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      v_tool_error.total_tool_errors: "#f9ab00"
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    smart_single_value_size: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: vs Last Period
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A critical leaderboard of the most unstable backend tools. Focus debugging
      efforts on the tools at the top of this list
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 7
    col: 12
    width: 12
    height: 7
    tab_name: Reliability & Errors
  - title: Total Sessions
    name: Total Sessions
    model: agent-analytics
    explore: agent_events
    type: single_value
    fields: [agent_events.pop_total_sessions_current, agent_events.pop_total_sessions_change]
    filters:
      agent_events.pop_date_filter: 7 days
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: false
    comparison_label: vs Last Period
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The total number of distinct conversation sessions initiated by users,
      including the Period-over-Period trend.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.pop_date_filter
    row: 0
    col: 0
    width: 8
    height: 7
    tab_name: Session Deep Dive
  - title: Number of Sessions Trend
    name: Number of Sessions Trend
    model: agent-analytics
    explore: agent_events
    type: looker_area
    fields: [agent_events.total_sessions, agent_events.timestamp_date]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      agent_events.total_sessions: "#e52592"
    custom_color_enabled: true
    show_single_value_title: true
    smart_single_value_size: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Last Period
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A daily time-series area chart tracking overall session volume, indicating
      macro engagement trends
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 0
    col: 8
    width: 16
    height: 7
    tab_name: Session Deep Dive
  - title: Top 5 Agents Split by Session Count
    name: Top 5 Agents Split by Session Count
    model: agent-analytics
    explore: agent_events
    type: looker_bar
    fields: [agent_events.total_sessions, agent_events.agent]
    sorts: [agent_events.total_sessions desc 0]
    limit: 5
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      agent_events.total_sessions: "#e8710a"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    smart_single_value_size: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Last Period
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: A ranking showing which agents are hosting the highest number of active
      user conversations.
    listen:
      Agent: agent_events.agent
      Span ID: agent_events.span_id
      Trace ID: agent_events.trace_id
      User ID: agent_events.user_id
      Date: agent_events.timestamp_date
    row: 7
    col: 2
    width: 20
    height: 8
    tab_name: Session Deep Dive
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: agent-analytics
    explore: agent_events
    listens_to_filters: []
    field: agent_events.timestamp_date
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
    field: agent_events.agent
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
  - name: Tool Name
    title: Tool Name
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
    field: v_tool_completed.tool_name
