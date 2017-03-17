Why use RCooladata
--------
The motivation of RCooladata is simple: employ powerfull statistical analysis
to the user behaviour data stored in Cooladata. The package allows you to
natively query Cooladata (CQL) and store the results in the data frame for further
analysis.


Usage
-----

The package expose single function: ``cooladataConnection(projectID)``. The function takes
numeric argument: _Cooldata Project ID_. You can find your id in your Cooladata
environment under: _Project/Settings/ProjectID._ Use the function
to setup connection with Cooladata in order to execute the queries.

``` r
projectID <- 123456
cooladata <- cooladataConnection(projectID)
```

Once the connection is established as ``cooladata`` object in R, use this object to
execute arbitrary query by passing CQL string as an argument. The result is parsed to R data frame.


``` r
query <- "SELECT event_name, event_time_ts FROM cooladata WHERE date_range(last 7 days) limit 10"
result <- cooladata(query)
```


Install
-------
The easiest way to install the package is using direct installation from GitHub using ``devtools``.
You can obtain ``devtools`` directly from CRAN by executing ``install.packages("devtools")``.

Use ``install_github`` function to download and setup the package in your environment.
``` r
library(devtools)
devtools::install_github("rafalszota/RCooladata")
library(RCooladata)
```

Alternatively, clone the GitHub repository and install the package manually
by executing ``devtools::install``.

Using RCooladata requires ``httr`` dependency. In the case you don't have this package installed yet,
you can obtain it from CRAN by executing ``install.packages("httr")``.

Before creating cooladata connection you need to store _Cooladata Developer Token_ in your
local file. Create a file named ``.cooladatatoken`` under your home folder
(``/Users/<username>`` for Linux and Mac, ``c:\Users\<username>`` for Windows).
The file should be plain text with a single line containing the token.
Make sure not to include whitespaces nor line breaks in the end of the file.

You can find your developer in Cooladata environment under ``<Profile>/API Token``.


Getting help
-------

Placeholder

License
-----

Placeholder