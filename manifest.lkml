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