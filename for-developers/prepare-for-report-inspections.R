# devtools::build() # So the yaml file is fresh
# rstudioapi::restartSession()

path_data    <- system.file("datasets/pt-event-biochemical.rds", package = "trawler")
path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")

ds_pt_event  <- readr::read_rds(path_data)
checks       <- load_checks(path_checks)
# View(checks$smells)

# execute_checks(ds_pt_event, checks)
# View(execute_checks(ds_pt_event, checks)$smells)

saveRDS(execute_checks(ds_pt_event, checks), "inst/derived/biochemical.rds")

# devtools::build() # So the rds checks are fresh
