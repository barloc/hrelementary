# Hrelementary

Parse result of every dbt model invocation and put it to the dbt_results table. Works with vertica because elementary doesn't support vertica-adapter.

## Quick start

1. Add to your `packages.yml`:

```yml packages.yml
packages:
  - package: "https://github.com/barloc/hrelementary.git"
    version: 0.0.3
```

2. Run `dbt deps`

3. Add to your `dbt_project.yml`:

```yml
models:
  ## hrelementary models will be created in the schema 'hrelementary'
  hrelementary:
    +schema: "hrelementary"
```

4. Run `dbt run --select hrelementary`
