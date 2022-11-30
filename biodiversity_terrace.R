## Use Session > Set Working Directory > To Source File Directory

data <- read.csv("data/terrace_biodiversity.csv", 
                head = TRUE, stringsAsFactors = TRUE)


## Determine number of species per section

richness <- NULL
section <- NULL

for (i in 1:max(data$section)) {
  x <- data$species[data$section == i]
  u_x <- unique(x)
  richness[i] <- length(u_x)
  section[i] <- i
}

terrace_rich <- data.frame(as.factor(section), richness)
plot(terrace_rich)

## Abundance per section

abundance <- NULL
species <- NULL
section <- NULL
k <- 1

for(i in 1:max(data$section)) {
  for(j in levels(factor(data$species))) {
    y <- subset(data, data$section == i)
    abundance[k] <- length(y$species[y$species == j])
    section[k] <- i
    species[k] <- paste(data$Genus[data$species == j][1], 
                        data$Species[data$species == j][1], sep = " ")
    k <- k + 1
  }
}

terrace_abund <- data.frame(abundance, species, section)