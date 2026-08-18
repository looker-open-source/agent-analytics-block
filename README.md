# Google Cloud BigQuery Agent Analytics - Looker Block

**This is not an officially supported Google product.**

## Overview
This Looker Block provides a turn-key, highly performant analytics solution for monitoring, debugging, and optimizing generative AI agents. Designed to work seamlessly with the [BigQuery Agent Analytics solution](https://docs.cloud.google.com/bigquery/docs/bigquery-agent-analytics), this block surfaces deep insights into agent interactions, tool usage, LLM performance, and cost footprints.

## Architecture & Semantic Layer
This block utilizes a **Native Derived Table Architecture** to provide a seamless installation experience.

Looker handles the complex data parsing natively. The LookML contains highly optimized Native Derived Tables (e.g., `v_llm_response`, `v_tool_error`) that execute strict `JSON_VALUE` and `JSON_QUERY` extractions against the raw BigQuery `agent_events` table on the fly.

These derived tables are joined back to the primary `agent_events` Explore. To ensure mathematical accuracy, the semantic layer enforces strict 1:1 `LEFT JOIN` operations using exact OpenTelemetry composite keys (`trace_id` AND `span_id` AND `event_type`).

### Dynamic Period-over-Period (PoP) Engine
To support advanced, rolling-window Scorecard trends (e.g., "Last 14 Days" vs "Previous 14 Days"), this block bypasses Looker's rigid native `period_over_period` type. Instead, it implements a highly flexible **Liquid Templated Filter engine** (commonly known as "Method 2" in the Looker developer community).

This engine dynamically calculates the `DATEDIFF` of the user's selected filter and automatically offsets the SQL timestamps in the background, preventing expensive `CROSS JOIN` fan-outs while maintaining strict accuracy.

### Advanced Context-Aware Visual Drilling
This block moves beyond standard Looker data tables by implementing a robust, context-aware visual drilling engine.
*   **Global Manifest Constants:** Visualization JSON payloads (e.g., Donut Charts, Scatter Plots, Stacked Area Charts) are defined globally in `manifest.lkml` to keep view files clean and DRY.
*   **Dynamic `link` Parameters:** Core measures (like `total_events` or `total_tool_errors`) utilize Looker's `link` parameter combined with the expanded Share URL pattern.
*   **Contextual Insight:** Clicking a data point on a dashboard will automatically inherit the dashboard filters and open a beautifully formatted visual popup (e.g., clicking an Agent spike opens a Bar Chart showing which exact tools that Agent was using on that specific day).

## Dashboards
This block includes two comprehensive reporting suites containing a suite of interconnected dashboards to monitor every aspect of your agent's lifecycle:

### Agent Analytics - Usage
*This suite focuses on business metrics, user engagement, and cost tracking.*

1.  **Token Consumption:** Tracks the aggregate volume of prompt and completion tokens burned over time, highlighting the specific users and agents driving the highest costs.
2.  **Agent & Sessions:** Monitors the total volume of end-to-end user journeys and active conversational sessions, providing a clear view of overall system traffic and session complexity.
3.  **Tool Usage:** Analyzes backend function calling by tracking the daily execution volume of specific tools, identifying the most frequently used functions.
4.  **LLM Interactions:** Provides deep visibility into the absolute number of requests sent to the underlying LLM models, hunting for outliers via granular scatter plots.
5.  **User Analytics:** Measures platform adoption and retention by tracking active unique users over time, determining user agent preferences, and ranking power-users.

### Agent Analytics - Performance
*This highly technical suite focuses purely on engineering metrics, speed, and backend reliability.*

1.  **Latency:** Visualizes P50, P75, P90, and P99 latency distributions for both LLM responses and Tool executions, tracking historical performance to identify backend degradation or API throttling.
2.  **Errors:** Tracks the daily volume of tool failures, highlights the most unstable agents and backend tools, and provides a "Root Cause Inspector" drill path for immediate debugging of raw JSON error payloads.

## Prerequisites
1.  **BigQuery Configuration:** Data must be flowing into BigQuery via the BigQuery Agent Analytics ADK plugin.
2.  **Looker Connection:** A Looker database connection configured to access the BigQuery dataset containing your `agent_events` table.

## Configuration & Installation
This block uses Looker Manifest Constants to make installation entirely seamless.

When installing this block via the Looker UI (Marketplace or Git Import), you will be prompted to enter your specific environment details. The Looker installation window will automatically inject these into the block's configuration:
*   `CONNECTION_NAME`: The exact name of your Looker database connection to BigQuery.
*   `PROJECT_ID`: The Google Cloud Project ID where your dataset resides.
*   `DATASET_NAME`: The BigQuery Dataset name where your `agent_events` table resides (e.g., `agent_analytic`).
*   `TABLE_NAME`: The base table name configured in the ADK plugin (default: `agent_events`).
*   *(Note: The `VIZ_*` constants do not need to be modified unless you wish to change the default styling of the visual drill popups).*

## Resources
*   [BigQuery Agent Analytics Documentation](https://docs.cloud.google.com/bigquery/docs/bigquery-agent-analytics)
*   [Agent Development Kit (ADK) Integration Docs](https://adk.dev/integrations/bigquery-agent-analytics)
