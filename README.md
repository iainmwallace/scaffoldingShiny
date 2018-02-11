[![Build Status](https://travis-ci.org/iainmwallace/scaffoldingShiny.svg?branch=master)](https://travis-ci.org/iainmwallace/scaffoldingShiny)

[![Coverage status](https://codecov.io/gh/iainmwallace/scaffoldingShiny/branch/master/graph/badge.svg)](https://codecov.io/github/iainmwallace/scaffoldingShiny?branch=master)

# scaffoldingShiny

The goal of scaffoldingShiny is to make it *even* faster to build Shiny apps by creating a working shiny app scaffold that you can easily modify.

## Install
``` r

# install.packages("devtools")
devtools::install_github("iainmwallace/scaffoldingShiny")

```

## Example

This is a basic example which shows you how to scaffold an app that will display data from a user

``` r
# define list of fields for data entry
input_list<-list(type=c("Text","Select"),id=c("id1","id2"),label=c("name","description"))

# scaffold app
build_basic_app(input_list,datastore_type="sqllite")

```

