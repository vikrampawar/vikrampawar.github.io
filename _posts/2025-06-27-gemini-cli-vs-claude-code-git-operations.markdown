---
layout: post
title: "Claude Code vs Gemini CLI: Which AI Assistant Actually Understands Git Workflows?"
date: 2025-06-27 18:00:00 +0000
categories: #ai #tools #git
tags: #gemini #claude #cli #development
published: true
---

When working with complex codebases, having an AI assistant that truly understands your intent can make the difference between a smooth workflow and hours of frustration. Today, I put Google's new Gemini CLI and Anthropic's Claude Code head-to-head on real-world git operations to see which one better understands developer needs.

## The Contenders

For the last few weeks, my main coding agent has been **Claude Code** - Anthropic's AI-powered CLI tool that helps with coding tasks. As I mentioned in the previous [post]({% post_url 2025-06-25-google-cli-announced-today %}), I have started experimenting with **Gemini CLI**, Google's answer to Claude Code.

## Simple vs Complex: A Tale of Two Tasks

Today, I tested both tools on various git operations. For simple tasks like renaming the current branch, both were fairly comparable. 

However, for more complex tasks, there was a clear difference.

## The Challenge: Selective Branch Merging

I faced a common but tricky scenario: I had a feature branch containing multiple changes, but I only needed to extract one specific Jupyter notebook from it. Before doing a selective merge, I wanted to understand exactly what changes the branch contained.

**The Task**: Merge only specific files from a branch containing ETL (Extract, Transform, Load) pipeline changes - a critical operation when working with data engineering projects where you need to be surgical about what code gets promoted.

I asked both agents the same question:

*"if I merge 170869-etl-products what changes will that result in?"*

My goal was simple: understand which files would be added, modified, or deleted if I merged the branch `170869-etl-products` into the current branch.

### Claude Code's Response

```
> if I merge 170869-etl-products what changes will that result in?

⏺ Merging 170869-etl-products would add:

  New ETL pipeline for products data:
  - apollo/etl/etl_data_products.ipynb - Jupyter notebook for products ETL
  - apollo/glue_jobs/etl_data_products/job.py - AWS Glue job implementation
  - terraform/src/etl_data_products.tf - Infrastructure for the products ETL job

  Documentation and utilities:
  - docs/adr/adr_001_notebook_path_resolution.md - Architecture decision record
  - apollo/setup.py - New setup script
  - apollo/sandboxes/postgis_client_test.ipynb - PostGIS client testing notebook
  - apollo/sandboxes/utility_functions.ipynb - Utility functions notebook

  Modified core modules:
  - apollo/modules/db/postgis/connect.py - Enhanced PostGIS connection handling
  - apollo/modules/etl/config.py - Updated ETL configuration
  - apollo/modules/etl/load.py - Minor ETL loading changes
  - apollo/tests/unit/test_connect.py - Expanded connection tests
  - apollo/tests/unit/test_etl_config.py - Updated config tests

```

### Gemini CLI's Response

```
> if I merge 170869-etl-products what changes will that result in?
Merging the 170869-etl-products branch will introduce a number of significant changes to the project. Here is a summary:


   * Dependency Management: The project will be migrated from requirements.txt to Poetry (https://python-poetry.org/) for more robust dependency management. This includes the
     addition of pyproject.toml and poetry.lock files.
   * CI/CD: The Azure Pipelines have been significantly refactored. They are now more modular, using templates for common jobs and steps, and have enhanced capabilities for
     deploying and managing infrastructure with Terraform.
   * Data Pipelines: The data ingestion and mapping pipelines have been updated. They now use a more standardized, configuration-driven approach, which should make them easier
     to maintain and extend.
   * Data Quality Framework: A new, comprehensive data quality framework has been introduced in the apollo/modules/data_quality directory. This includes tools for parsing
     data quality rules from Markdown files and executing them.
   * Infrastructure as Code (Terraform): The Terraform code has been modularized. It now uses a glue_job module to create Glue jobs, and includes new resources for AWS Lambda.
     This will make the infrastructure easier to manage and scale.
   * Code and Notebook Cleanup: Many notebooks and scripts have been updated or removed to align with the new, more structured approach. For example,
     apollo/etl/etl_data_products.ipynb has been deleted, and new notebooks have been added to the apollo/sandboxes directory.


  Overall, this merge will bring substantial improvements to the project's structure, automation, and data quality capabilities.
```

## The Critical Difference

While Gemini CLI provided a high-level overview of architectural changes (dependency management, CI/CD improvements, data quality framework), it missed the mark on what I actually needed: **a concrete list of files that would change**.

Claude Code, on the other hand, delivered exactly what an experienced developer would want:
- Specific file paths organized by category
- Clear indication of new vs modified files
- Granular details that allow for informed decision-making

This difference became even more apparent in the follow-up task.

## Round Two: Planning a Selective Extract

I then asked both tools to help me plan extracting just one notebook with modifications:

*"ok, I just need the notebook etl_data_products.ipynb copied in sandboxes folder with the name products_extract.ipynb. I'm only interested in generating a file with insert statements not in populating the postgis database from this script."*

### Gemini CLI's Plan

```
> ok, I just need the notebook etl_data_products.ipynb copied in sandboxes folder with the name products_extract.ipynb. I'm only interested in generating a file with insert statements not in populating the postgis database from this script. what plan would you suggest. don't make any changes

✦ Of course. Here is the plan I would suggest to accomplish that:


   1. Retrieve Notebook Content: I will first get the content of the etl_data_products.ipynb notebook from the 170869-etl-products branch.
   2. Create New Notebook: I will then create a new notebook file named products_extract.ipynb in the apollo/sandboxes/ directory with the retrieved content.
   3. Modify for SQL Generation: Finally, I will modify the new notebook to ensure it only generates the SQL INSERT statements. I will comment out the Python code responsible
```

### Claude Code's Plan (in Plan Mode)

```


> ok, I just need the notebook etl_data_products.ipynb copied in sandboxes folder with the name products_extract.ipynb. I'm only interested in generating a file with insert statements not in populating the postgis database from this script.                                                                                                                                                                               
⏺ User approved Claude's plan:
  ⎿  Based on my analysis of the 170869-etl-products branch, here's my plan to create the requested notebook:

     1. Copy the notebook: Extract apollo/etl/etl_data_products.ipynb from the 170869-etl-products branch and save it as apollo/sandboxes/products_extract.ipynb
     2. Modify the notebook to generate insert statements instead of loading to PostGIS:
       - Keep all the extraction and transformation logic intact
       - In the Load section, change the write_dataframe_to_postgis call from execute=True to execute=False
       - Add code to capture the generated SQL insert statements
       - Save the SQL statements to a file instead of executing them
       - Remove or comment out the table clearing and verification queries
     3. Key changes:
       - Change: postgis_client.write_dataframe_to_postgis(df_transformed, target_table, execute=True)
       - To: sql_statements = postgis_client.write_dataframe_to_postgis(df_transformed, target_table, execute=False)
       - Add code to write sql_statements to a file like products_insert_statements.sql

     This will give you a notebook that extracts and transforms products data from data, but generates SQL insert statements instead of directly populating the PostGIS database.

⏺ Update Todos
```

## The Verdict: Understanding Developer Intent

The difference in responses reveals a fundamental gap in how these tools understand developer workflows:

### Where Claude Code Excels:
1. **Specific Implementation Details**: Claude provided exact parameter changes (`execute=True` to `execute=False`)
2. **Code-Level Understanding**: It knew which function calls to modify and how
3. **Complete Solution Path**: The plan included cleanup steps like removing verification queries
4. **Developer-Centric Thinking**: The response reads like advice from a senior developer

### Where Gemini CLI Falls Short:
1. **Generic Responses**: High-level steps without implementation specifics
2. **Missing Context**: No mention of the specific PostGIS functions or parameters

## Key Takeaways

**For Simple Tasks**: Both tools are adequate for basic git operations like branch renaming or simple commits.

**For Complex Tasks**: Claude Code demonstrates superior understanding of:
- File-level git operations
- Code modification requirements
- Developer workflow patterns

**The Bottom Line**: While Gemini CLI shows promise as Google's entry into AI-powered development tools, it currently lacks the nuanced understanding and developer-focused responses that make Claude Code feel like working with an experienced colleague.

For now, when dealing with complex codebases and intricate git operations, Claude Code remains the more reliable choice. Gemini CLI has potential but needs significant improvements in understanding developer intent and providing actionable, specific guidance.

---

*Have you tried both tools? I'd love to hear about your experiences in the comments.*

