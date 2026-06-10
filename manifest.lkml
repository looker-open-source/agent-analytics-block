project_name: "agent-analytics"

constant: CONNECTION_NAME {
  value: "bq-conection"
  export: override_optional
}

constant: PROJECT_ID {
  value: "project-id"
  export: override_optional
}

constant: DATASET_NAME {
  value: "agent_analytics"
  export: override_optional
}

constant: TABLE_NAME {
  value: "agent_events"
  export: override_optional
}

constant: VIZ_AREA_CHART {
  value: "{% assign vis_config = '{
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"y_axis_tick_density_custom\": 5,
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"x_axis_reversed\": false,
    \"y_axis_reversed\": false,
    \"plot_size_by_field\": false,
    \"trellis\": \"\",
    \"stacking\": \"\",
    \"limit_displayed_rows\": false,
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": false,
    \"label_density\": 25,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"show_null_points\": false,
    \"interpolation\": \"linear\",
    \"show_totals_labels\": false,
    \"show_silhouette\": false,
    \"totals_color\": \"#808080\",
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"series_types\": {},
    \"series_colors\": {\"v_llm_response.total_tokens_consumed\": \"#e8710a\"},
    \"type\": \"looker_area\",
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_BAR_CHART {
  value: "{% assign vis_config = '{
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"y_axis_tick_density_custom\": 5,
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"x_axis_reversed\": false,
    \"y_axis_reversed\": false,
    \"plot_size_by_field\": false,
    \"trellis\": \"\",
    \"stacking\": \"\",
    \"limit_displayed_rows\": false,
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": false,
    \"label_density\": 25,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"ordering\": \"none\",
    \"show_null_labels\": false,
    \"show_totals_labels\": false,
    \"show_silhouette\": false,
    \"totals_color\": \"#808080\",
    \"show_null_points\": false,
    \"interpolation\": \"linear\",
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"series_types\": {},
    \"series_colors\": {\"v_llm_response.total_tokens_consumed\": \"#e8710a\"},
    \"type\": \"looker_bar\",
    \"defaults_version\": 1,
    \"show_row_numbers\": true,
    \"transpose\": false,
    \"truncate_text\": true,
    \"hide_totals\": false,
    \"hide_row_totals\": false,
    \"size_to_fit\": true,
    \"table_theme\": \"white\",
    \"enable_conditional_formatting\": false,
    \"header_text_alignment\": \"left\",
    \"header_font_size\": 12,
    \"rows_font_size\": 12,
    \"conditional_formatting_include_totals\": false,
    \"conditional_formatting_include_nulls\": false
  }' %}"
}

constant: VIZ_COLUMN_CHART {
  value: "{% assign vis_config = '{
    \"type\": \"looker_column\",
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"legend_position\": \"center\",
    \"show_value_labels\": true,
    \"label_density\": 25,
    \"show_null_labels\": false,
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_BAR_CHART_GREEN {
  value: "{% assign vis_config = '{
    \"type\": \"looker_bar\",
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"legend_position\": \"center\",
    \"show_value_labels\": false,
    \"series_colors\": { \"agent_events.total_events\": \"#137333\" },
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_DONUT_CHART {
  value: "{% assign vis_config = '{
    \"type\": \"looker_pie\",
    \"inner_radius\": 50,
    \"legend_position\": \"center\",
    \"value_labels\": \"legend\",
    \"label_type\": \"labPer\",
    \"show_view_names\": false,
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_LINE_CHART {
  value: "{% assign vis_config = '{
    \"type\": \"looker_line\",
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": false,
    \"interpolation\": \"linear\",
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_SCATTER_CHART {
  value: "{% assign vis_config = '{
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"y_axis_tick_density_custom\": 5,
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"x_axis_reversed\": false,
    \"y_axis_reversed\": false,
    \"plot_size_by_field\": false,
    \"trellis\": \"\",
    \"stacking\": \"\",
    \"limit_displayed_rows\": false,
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": false,
    \"label_density\": 25,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"show_null_points\": true,
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"series_types\": {},
    \"series_colors\": {\"v_llm_response.total_tokens_consumed\": \"#e8710a\", \"agent_events.trace_id\": \"#1e8e3e\", \"v_llm_response.total_ms\": \"#e8710a\"},
    \"cluster_points\": false,
    \"quadrants_enabled\": false,
    \"type\": \"looker_scatter\",
    \"defaults_version\": 1,
    \"hidden_fields\": [\"agent_events.trace_id\"]
  }' %}"
}

constant: VIZ_GRID_TABLE {
  value: "{% assign vis_config = '{
    \"show_view_names\": false,
    \"show_row_numbers\": true,
    \"transpose\": false,
    \"truncate_text\": false,
    \"hide_totals\": false,
    \"hide_row_totals\": false,
    \"size_to_fit\": true,
    \"table_theme\": \"white\",
    \"limit_displayed_rows\": false,
    \"enable_conditional_formatting\": false,
    \"header_text_alignment\": \"left\",
    \"header_font_size\": \"12\",
    \"rows_font_size\": \"12\",
    \"conditional_formatting_include_totals\": false,
    \"conditional_formatting_include_nulls\": false,
    \"show_sql_query_menu_options\": false,
    \"show_totals\": true,
    \"show_row_totals\": true,
    \"truncate_header\": false,
    \"minimum_column_width\": 75,
    \"series_cell_visualizations\": {\"v_llm_response.usage_total_tokens\": {\"is_active\": true}},
    \"table_show_footer\": false,
    \"table_enable_pagination\": false,
    \"table_show_headers\": true,
    \"type\": \"looker_grid\",
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_STACKED_AREA {
  value: "{% assign vis_config = '{
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"x_axis_reversed\": false,
    \"y_axis_reversed\": false,
    \"trellis\": \"\",
    \"stacking\": \"normal\",
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": false,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"show_null_points\": true,
    \"interpolation\": \"monotone\",
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"type\": \"looker_area\",
    \"defaults_version\": 1
  }' %}"
}

constant: VIZ_SCATTER_CHART_SESSION {
  value: "{% assign vis_config = '{
    \"x_axis_gridlines\": false,
    \"y_axis_gridlines\": true,
    \"show_view_names\": false,
    \"show_y_axis_labels\": true,
    \"show_y_axis_ticks\": true,
    \"y_axis_tick_density\": \"default\",
    \"y_axis_tick_density_custom\": 5,
    \"show_x_axis_label\": true,
    \"show_x_axis_ticks\": true,
    \"y_axis_scale_mode\": \"linear\",
    \"x_axis_reversed\": false,
    \"y_axis_reversed\": false,
    \"plot_size_by_field\": false,
    \"trellis\": \"\",
    \"stacking\": \"\",
    \"limit_displayed_rows\": false,
    \"legend_position\": \"center\",
    \"point_style\": \"circle\",
    \"show_value_labels\": false,
    \"label_density\": 25,
    \"x_axis_scale\": \"auto\",
    \"y_axis_combined\": true,
    \"show_null_points\": true,
    \"x_axis_zoom\": true,
    \"y_axis_zoom\": true,
    \"series_types\": {},
    \"cluster_points\": false,
    \"quadrants_enabled\": false,
    \"type\": \"looker_scatter\",
    \"defaults_version\": 1,
    \"hidden_fields\": [\"agent_events.session_id\"]
  }' %}"
}
