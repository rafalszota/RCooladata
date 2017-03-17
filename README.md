Overview
--------
R package for connecting Cooladata using HTTP API

Install
-------

Placeholder
``` r
library(devtools)
devtools::install_github("rafalszota/RCooladata")
```

Usage
-----

Placeholder

``` r
cooladata <- cooladataConnection(123456)

query <- "SELECT event_name FROM cooladata WHERE date_range(last 7 days)  limit 10"
result <- cooladata(query)

```

Getting help
-------

Placeholder

License
-----

Placeholder