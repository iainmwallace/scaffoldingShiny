# scaffoldingShiny

The goal of scaffoldingShiny is to make it *even* faster to build Shiny apps by creating a working shiny app scaffold that you can easily modify.


## Example

This is a basic example which shows you how to scaffold an app that will display data from a user

``` r
# define list of fields for data entry
input_list<-list(type=c("Text","Text"),id=c("id1","id2"),label=c("name","description"))

# scaffold app
build_app(input_list,data_file="new_file.csv")

```

