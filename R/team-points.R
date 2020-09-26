#' Add together two numbers
#'
#' @param data The data frame from [fflr::league_standings()].
#' @return A ggplot bar chart object.
#' @examples
#' library(fflr)
#' team_points(league_standings(252353))
#' @importFrom ggplot2 ggplot geom_col aes_string scale_fill_manual
#'   scale_y_continuous theme labs
#' @export
team_points <- function(data) {
  long <- data.frame(
    abbrev = rep(data$abbrev, 2),
    points = c(data$points, data$against),
    type = factor(
      x = rep(c("For", "Against"), each = nrow(data)),
      levels = c("For", "Against")
    )
  )
  p <-
    ggplot(
      data = long,
      mapping = aes_string(
        x = "abbrev",
        y = "points",
        fill = "type"
      )
    ) +
    geom_col(position = "dodge") +
    scale_fill_manual(values = c("#43b049", "#d0021b")) +
    scale_y_continuous(labels = scales::comma) +
    theme(legend.position = "bottom") +
    labs(
      title = "Fantasy Team Points",
      x = "Team",
      y = "Points",
      fill = "Score Type"
    )
  return(p)
}
