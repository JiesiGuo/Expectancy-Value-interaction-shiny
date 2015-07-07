This is the source code for latent interaction app which runs on R and Shiny. 


To run it locally, you'll need to install the latest versions of [Shiny](http://shiny.rstudio.com), and [dplyr](https://github.com/hadley/dplyr), as well as [RSA](http://cran.r-project.org/web/packages/RSA/index.html).

```r
install.packages(c('shiny', 'dplyr', 'RSA'))
```

Also, you need to download two datasets, one for [path coefficients](https://github.com/JiesiGuo/Expectancy-Value-interaction-shiny/blob/master/inter_plot.csv)) with standard error and the other one for the [factor scores](https://github.com/JiesiGuo/Expectancy-Value-interaction-shiny/blob/master/factor_scores.csv) of latent variables presented in the surfure of the interaciton plot.

You may need to restart R to make sure the newly-installed packages work properly.

After all these packages are installed and two datasets are downloaded, you can run this app by entering the directory, and then running the following in R:

```s
shiny::runApp()
```
This app is also published in [shinyapp.io](https://jiesiguo.shinyapps.io/latent_interaction).