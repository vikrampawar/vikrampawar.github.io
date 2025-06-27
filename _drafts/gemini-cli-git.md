
 

For the last few weeks, my main coding agent has been Claude Code. 

As I mentioned in the previous post, I have started experimenting with Gemini CLI, Google's answer to Claude Code.

Today, for some of the tasks I tried both Claude Code and Gemini CLI.

For simple git operations like renaming the current branch both locally both were fairly comparable. 

For a more complex tasks there was a clear difference. 

I had some code in a branch of which I only wanted code from one particular file (a jupyter notebook) to be merged into the the current branch and make some modifications to it.

So I asked both agents the following question:

*"if I merge 170869-etl-products what changes will that result in?"*

My aim was to understand which files would be added, modified or deleted if I merged the branch `170869-etl-products` into the current branch.

Claude Code's response was:

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

Gemini CLI's response was:

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

Although Gemini CLI provided a more detailed overview of the changes, it did not give me the specific files that would be added, modified or deleted. 

Claude Code, on the other hand, provided a clear list of files that would be affected by the merge, which was exactly what I needed. It's as if Claude Code understood the task better and knew what the reasonable response would be like an experienced developer.


I followed it up by asking for a plan of changes required to accomplish the main task. The query was:


*"ok, I just need the notebook etl_data_products.ipynb copied in sandboxes folder with the name products_extract.ipynb. I'm only interested in genrating a file with insert statements not in populating the postgis database from this script."*

Gemini CLI's response was:

```
> ok, I just need the notebook etl_data_products.ipynb copied in sandboxes folder with the name products_extract.ipynb. I'm only interested in genrating a file with insert statements not in populating the postgis database from this script. what plan would you suggest. don't make any changes

✦ Of course. Here is the plan I would suggest to accomplish that:


   1. Retrieve Notebook Content: I will first get the content of the etl_data_products.ipynb notebook from the 170869-etl-products branch.
   2. Create New Notebook: I will then create a new notebook file named products_extract.ipynb in the apollo/sandboxes/ directory with the retrieved content.
   3. Modify for SQL Generation: Finally, I will modify the new notebook to ensure it only generates the SQL INSERT statements. I will comment out the Python code responsible
```

Claude Code was in plan mode and it's response was:

```


> ok, I just need the notebook etl_data_products.ipynb copied in sandboxes folder with the name products_extract.ipynb. I'm only interested in genrating a file with insert statements not in populating the postgis database from this script.                                                                                                                                                                               
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

It's clear that Gemini CLI is still in its early stages and has a long way to go before it can match the capabilities of Claude Code.



