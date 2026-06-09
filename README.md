# Google Cloud BigQuery Agent Analytics - Looker Block

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

## Dashboards (v2)
This block includes two comprehensive reporting suites, containing a total of 8 analytical dashboards designed to monitor every aspect of your agent's lifecycle:

### Report 1: Agent Analytics
1.  **Token Consumption:** Tracks the aggregate volume of prompt and completion tokens burned over time, and highlights the specific users and agents driving the highest costs.
2.  **Agent Engagement:** Monitors the total volume of unique, end-to-end user journeys (traces) to provide a clear view of overall system traffic and power-user activity.
3.  **Tool Performance:** Analyzes backend function calling by tracking the daily execution volume of specific tools, identifying the most frequently used tools, and mapping tool usage to specific agents.
4.  **LLM Interactions:** Provides deep visibility into the absolute number of requests sent to the underlying LLM models, hunting for outliers via granular scatter plots.
5.  **User Analytics:** Measures platform adoption and retention by tracking active unique users over time, determining user agent preferences, and ranking power-users by session volume.

### Report 2: Performance Report
1.  **System Performance & Latency:** Visualizes P50, P75, P90, and P99 latency distributions for both LLM responses and Tool executions, tracking historical performance to identify backend degradation or API throttling.
2.  **Reliability & Errors:** Tracks the daily volume of tool failures, highlights the most unstable agents and backend tools, and provides a "Root Cause Inspector" drill path for immediate debugging of raw error payloads.
3.  **Session Deep Dive:** Analyzes macro engagement trends by tracking overall session volume and ranks the top agents hosting the highest number of active user conversations.

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
