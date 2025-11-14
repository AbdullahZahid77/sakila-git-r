library(data.table)

# Path to folder with CSV files
data_dir <- "data"

# Helper to load tables easily
load_dt <- function(name) {
  fread(file.path(data_dir, paste0(name, ".csv")))
}

# Load all essential Sakila tables
actor          <- load_dt("actor")
film           <- load_dt("film")
film_actor     <- load_dt("film_actor")
category       <- load_dt("category")
film_category  <- load_dt("film_category")
customer       <- load_dt("customer")
inventory      <- load_dt("inventory")
rental         <- load_dt("rental")
store          <- load_dt("store")
address        <- load_dt("address")
city           <- load_dt("city")
country        <- load_dt("country")
staff          <- load_dt("staff")
payment        <- load_dt("payment")
language       <- load_dt("languages")

# Show quick table size summary
cat("Loaded tables:\n")
cat("actor:", nrow(actor), "\n")
cat("film:", nrow(film), "\n")
cat("film_actor:", nrow(film_actor), "\n")
cat("customer:", nrow(customer), "\n")
cat("rental:", nrow(rental), "\n")

# Save RDS for fast loading in analysis script
saveRDS(
  list(
    actor=actor, film=film, film_actor=film_actor,
    category=category, film_category=film_category,
    customer=customer, inventory=inventory,
    rental=rental, store=store, address=address,
    city=city, country=country, staff=staff,
    payment=payment, language=language
  ),
  file = "outputs/sakila_all.rds"
)

