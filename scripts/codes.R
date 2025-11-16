# Count number of films by rating
rating_counts <- table(film$rating)

# Bar plot
barplot(
  rating_counts,
  main = "Number of Films per Rating",
  xlab = "Rating",
  ylab = "Number of Films",
  col = "skyblue"
)

