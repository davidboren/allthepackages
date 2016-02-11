.all_packages <- strsplit(
"avantcredit/aws-tools
cran/setwidth
cran/ggplot2
cran/crayon
cran/microbenchmark
cran/knitr
cran/lubridate
cran/testthat
robertzk/testthatsomemore
cran/memoise
cran/rJava
cran/yaml
rstats-db/DBI
cran/RJDBC
hadley/purrr
robertzk/lockbox
robertzk/bettertrace
robertzk/Ramd
robertzk/objectdiff
robertzk/stagerunner
robertzk/director
robertzk/statsUtils
robertzk/mungebits
robertzk/tundra
robertzk/syberiaMungebits
robertzk/syberiaStructure
robertzk/syberiaStages
robertzk/syberia
kirillseva/cacher
robertzk/s3mpi
robertzk/productivus
robertzk/RPostgres@fix_type_issues
cran/RPostgreSQL
cran/pROC
cran/zoo
robertzk/berdie
avantcredit/dbtest
robertzk/cachemeifyoucan
peterhurford/batbelt
peterhurford/batchman
robertzk/microserver
robertzk/hipchat
robertzk/mungebits2
robertzk/RDS2
robertzk/recombinator
kirillseva/dokk
kirillseva/kunteynir
robertzk/lookr
avantcredit/fookr
jimhester/covr
yihui/roxygen2", "\n")[[1]]


#' @export
install_all <- function() {
  if ("DBI" %in% installed.packages()[,1]) {
    message("Removing prior DBI installation...")
    remove.packages("DBI")
  }
  for (pkg in .all_packages) {
    pkg_name <- gsub("^[^/]+/", "", pkg)
    if (pkg_name == "aws-tools") pkg_name <- "AWS.tools"
    if (pkg_name == "r") pkg_name <- "K.R"
    if (!pkg_name %in% installed.packages()[,1]) {
      message("Installing ", pkg, "...")
      devtools::install_github(pkg)
    } else {
      cat(pkg, "already installed...\n")
    }
  }
}
