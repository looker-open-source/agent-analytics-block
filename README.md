# Google Cloud BigQuery Agent Analytics - Looker Block

## Overview
This Looker Block provides a turn-key, comprehensive analytics solution for monitoring, debugging, and optimizing generative AI agents. Designed to work seamlessly with the [BigQuery Agent Analytics solution](https://docs.cloud.google.com/bigquery/docs/bigquery-agent-analytics), this block surfaces deep insights into agent interactions, tool usage, LLM performance, and cost footprints.

## Key Features & Metrics
This block comes pre-configured with a semantic model and dashboards that answer critical questions about your agent infrastructure:
*   **Cost & Token Consumption:** Track total LLM tokens consumed over time, broken down by Agent and User to identify your biggest cost drivers.
*   **Agent Engagement:** Monitor trace and session volumes to understand how frequently and deeply users are interacting with your agents.
*   **Tool Performance & Utilization:** Analyze which tools are invoked most frequently and identify latency bottlenecks with median and tail-end percentiles (P50, P90, P99).
*   **Reliability & Errors:** Quickly pinpoint error hotspots, identifying exactly which agents or tools are failing most often.
*   **Session Deep-Dives:** Analyze the distribution of session lengths and trace execution paths to understand the end-user experience.

## Prerequisites
*   A Looker instance.
*   Data flowing into BigQuery via the BigQuery Agent Analytics ADK plugin (v1.26.0+ recommended to ensure full schema support).
*   A Looker database connection configured to access the BigQuery dataset containing your `agent_events` (or `agent_events_v2`) table.

## Installation & Configuration
This block uses LookML constants to make installation seamless across different environments. 

To configure the block for your environment, update the following constants in the `manifest.lkml` file:
*   `CONNECTION_NAME`: The name of your Looker database connection to BigQuery.
*   `DATASET_NAME`: The BigQuery Project and Dataset where your agent events table resides (e.g., `my-gcp-project.agent_analytics_dataset`).

## Architecture
This project adheres to strict Looker development best practices for clean separation of concerns:
*   **Raw Views (`views/raw/`):** Strict 1:1 mapping of the underlying BigQuery schema.
*   **Refined Views (`views/refined/`):** Encapsulates all business logic, dynamic JSON payload extractions (using BigQuery native JSON functions), and UI group labels.
*   **Session Facts:** Includes a derived table designed to pre-aggregate duration metrics at the session level for accurate percentile calculations.

## Resources
*   [BigQuery Agent Analytics Documentation](https://docs.cloud.google.com/bigquery/docs/bigquery-agent-analytics)
*   [Agent Development Kit (ADK) Integration Docs](https://adk.dev/integrations/bigquery-agent-analytics)