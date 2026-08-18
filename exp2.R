# ============================================================
# LAB 3: CONTROL FLOW FOR DATA CLEANING
# Topic: Loops, Functions, and Error Handling in R
# Dataset: UCI Heart Disease Dataset
# ============================================================


# ------------------------------------------------------------
# 1. INSTALL / LOAD REQUIRED PACKAGES
# ------------------------------------------------------------

# Run these only once if packages are not installed
# install.packages("dplyr")

library(dplyr)


# ------------------------------------------------------------
# 2. LOAD UCI HEART DISEASE DATASET
# ------------------------------------------------------------

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"

heart <- read.csv(
  url,
  header = FALSE,
  na.strings = "?"
)

# Add column names
colnames(heart) <- c(
  "age",
  "sex",
  "cp",
  "trestbps",
  "chol",
  "fbs",
  "restecg",
  "thalach",
  "exang",
  "oldpeak",
  "slope",
  "ca",
  "thal",
  "target"
)

# Display first few rows
head(heart)

# Check structure
str(heart)

# Check dimensions
dim(heart)


# ------------------------------------------------------------
# 3. INTRODUCE ARTIFICIAL DATA-ENTRY ERRORS
# ------------------------------------------------------------

# We deliberately introduce:
# - Negative BP values
# - Missing BP values
# - Extreme BP values (>300)

set.seed(123)

heart$trestbps[1] <- -20
heart$trestbps[2] <- -50
heart$trestbps[3] <- NA
heart$trestbps[4] <- 320
heart$trestbps[5] <- 350

cat("Artificial invalid values introduced.\n")

# Display affected rows
heart[1:5, c("age", "trestbps", "chol")]


# ------------------------------------------------------------
# 4. CREATE BP CLEANING FUNCTION USING IF-ELSE
# ------------------------------------------------------------

clean_bp <- function(bp) {

  if (is.na(bp)) {
    return(NA)
  }

  else if (bp < 0) {
    return(NA)
  }

  else if (bp > 250) {
    return(250)
  }

  else {
    return(bp)
  }
}


# Test function
print(clean_bp(-20))
print(clean_bp(120))
print(clean_bp(320))
print(clean_bp(NA))


# ------------------------------------------------------------
# 5. APPLY FUNCTION TO BP COLUMN
# ------------------------------------------------------------

heart$trestbps_clean <- sapply(
  heart$trestbps,
  clean_bp
)

# Display original and cleaned values
head(
  heart[, c("trestbps", "trestbps_clean")],
  10
)


# ------------------------------------------------------------
# 6. ERROR HANDLING USING tryCatch()
# ------------------------------------------------------------

safe_mean_bp <- function(bp) {

  tryCatch({

    if (length(bp) == 0) {
      stop("BP vector is empty.")
    }

    if (all(is.na(bp))) {
      stop("BP vector contains only missing values.")
    }

    mean(bp, na.rm = TRUE)

  },

  warning = function(w) {
    message("Warning while calculating mean BP: ", w$message)
    NA
  },

  error = function(e) {
    message("Error while calculating mean BP: ", e$message)
    NA
  },

  finally = {
    message("Mean BP calculation completed.")
  })
}


# Calculate mean BP
mean_bp <- safe_mean_bp(heart$trestbps_clean)

cat("Mean BP =", mean_bp, "\n")


# ------------------------------------------------------------
# 7. CALCULATE CHOLESTEROL / BP RATIO
# ------------------------------------------------------------

safe_ratio <- function(chol, bp) {

  tryCatch({

    # Check for missing values
    if (is.na(chol) || is.na(bp)) {
      stop("Cholesterol or BP value is missing.")
    }

    # Check for zero denominator
    if (bp == 0) {
      stop("Cannot divide by zero BP.")
    }

    # Check for invalid values
    if (bp < 0) {
      stop("BP value is invalid.")
    }

    ratio <- chol / bp

    return(ratio)

  },

  error = function(e) {
    message("Ratio Error: ", e$message)
    return(NA)
  },

  warning = function(w) {
    message("Ratio Warning: ", w$message)
    return(NA)
  })
}


# Test ratio
ratio1 <- safe_ratio(200, 120)
ratio2 <- safe_ratio(200, 0)
ratio3 <- safe_ratio(200, NA)
ratio4 <- safe_ratio(200, -10)

cat("Valid ratio =", ratio1, "\n")
cat("Zero denominator =", ratio2, "\n")
cat("Missing denominator =", ratio3, "\n")
cat("Invalid denominator =", ratio4, "\n")


# ------------------------------------------------------------
# 8. LOOP-BASED DATA CLEANING
# ------------------------------------------------------------

bp_loop <- heart$trestbps

start_loop <- Sys.time()

for (i in seq_along(bp_loop)) {

  if (is.na(bp_loop[i])) {
    next
  }

  if (bp_loop[i] < 0) {
    bp_loop[i] <- NA
  }

  else if (bp_loop[i] > 250) {
    bp_loop[i] <- 250
  }
}

end_loop <- Sys.time()

loop_time <- end_loop - start_loop

cat("Loop execution time:\n")
print(loop_time)


# ------------------------------------------------------------
# 9. VECTORIZED DATA CLEANING
# ------------------------------------------------------------

bp_vectorized <- heart$trestbps

start_vector <- Sys.time()

# Negative values -> NA
bp_vectorized[bp_vectorized < 0] <- NA

# Values greater than 250 -> 250
bp_vectorized[bp_vectorized > 250] <- 250

end_vector <- Sys.time()

vector_time <- end_vector - start_vector

cat("Vectorized execution time:\n")
print(vector_time)


# ------------------------------------------------------------
# 10. COMPARE LOOP AND VECTORIZED RESULTS
# ------------------------------------------------------------

comparison <- data.frame(
  Original = heart$trestbps,
  Loop_Cleaned = bp_loop,
  Vectorized_Cleaned = bp_vectorized
)

head(comparison, 10)


# Check whether both approaches produce the same result
same_result <- all.equal(
  bp_loop,
  bp_vectorized
)

cat("Are both results identical? ", same_result, "\n")


# ------------------------------------------------------------
# 11. NUMERIC EXECUTION TIME COMPARISON
# ------------------------------------------------------------

loop_seconds <- as.numeric(loop_time, units = "secs")
vector_seconds <- as.numeric(vector_time, units = "secs")

performance <- data.frame(
  Method = c("For Loop", "Vectorized"),
  Time_Seconds = c(loop_seconds, vector_seconds)
)

print(performance)


# ------------------------------------------------------------
# 12. VALIDATE CLEANED DATA
# ------------------------------------------------------------

# Count missing BP values
missing_bp <- sum(is.na(bp_vectorized))

cat("Number of missing BP values:", missing_bp, "\n")


# Minimum BP
min_bp <- min(bp_vectorized, na.rm = TRUE)

# Maximum BP
max_bp <- max(bp_vectorized, na.rm = TRUE)

# Mean BP
mean_bp <- mean(bp_vectorized, na.rm = TRUE)

# Median BP
median_bp <- median(bp_vectorized, na.rm = TRUE)

cat("Minimum BP:", min_bp, "\n")
cat("Maximum BP:", max_bp, "\n")
cat("Mean BP:", mean_bp, "\n")
cat("Median BP:", median_bp, "\n")


# ------------------------------------------------------------
# 13. VERIFY NO NEGATIVE VALUES REMAIN
# ------------------------------------------------------------

negative_values <- sum(
  bp_vectorized < 0,
  na.rm = TRUE
)

greater_than_250 <- sum(
  bp_vectorized > 250,
  na.rm = TRUE
)

cat("Negative BP values remaining:", negative_values, "\n")
cat("BP values >250 remaining:", greater_than_250, "\n")


# ------------------------------------------------------------
# 14. CREATE FINAL CLEANED DATASET
# ------------------------------------------------------------

heart$trestbps <- bp_vectorized

# Remove temporary column
heart$trestbps_clean <- NULL

# Save cleaned dataset
write.csv(
  heart,
  "cleaned_heart_data.csv",
  row.names = FALSE
)

cat("Cleaned dataset saved as cleaned_heart_data.csv\n")


# ------------------------------------------------------------
# 15. FINAL SUMMARY
# ------------------------------------------------------------

cat("\n========================================\n")
cat("       LAB 3 CLEANING SUMMARY\n")
cat("========================================\n")

cat("Missing BP values:", missing_bp, "\n")
cat("Minimum BP:", min_bp, "\n")
cat("Maximum BP:", max_bp, "\n")
cat("Mean BP:", mean_bp, "\n")
cat("Median BP:", median_bp, "\n")
cat("Negative values remaining:", negative_values, "\n")
cat("Values >250 remaining:", greater_than_250, "\n")

cat("\nLoop time:", loop_seconds, "seconds\n")
cat("Vectorized time:", vector_seconds, "seconds\n")

cat("\nCleaning completed successfully.\n")