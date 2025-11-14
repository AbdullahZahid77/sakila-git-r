library(data.table)

# Load pre-saved full data
db <- readRDS("outputs/sakila_all.rds")

# Extract tables for convenience
actor         <- db$actor
film          <- db$film
film_actor    <- db$film_actor
category      <- db$category
film_category <- db$film_category
rental        <- db$rental
customer      <- db$customer

### EXAMPLE 1 — Top 10 actors by number of films ###
top_actors <- film_actor[, .N, by=actor_id][order(-N)][1:10]
top_actors <- merge(top_actors, actor, by="actor_id", all.x=TRUE)
top_actors[, actor_name := paste(first_name, last_name)]
print(top_actors[, .(actor_id, actor_name, film_count = N)])


### EXAMPLE 2 — Number of films per category ###
films_per_category <- merge(
  film_category,
  category,
  by="category_id"
)[, .N, by=.(name)][order(-N)]

print(films_per_category)
