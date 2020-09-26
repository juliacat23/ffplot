#' Add together two numbers
#'
#' @param data The data frame from [fflr::league_standings()].
#' @return A ggplot bar chart object.
#' @examples
#' points_total(fflr::league_standings(252353))
#' @importFrom ggplot2 ggplot geom_col aes_string scale_fill_manual
#'   scale_y_continuous theme labs
#' @export
points_total <- function(data) {
  long <- data.frame(
    abbrev = rep(data$abbrev, 2),
    points = c(data$points, data$against),
    type = factor(
      x = rep(c("For", "Against"), each = nrow(data)),
      levels = c("For", "Against")
    )
  )
  p <-
    ggplot2::ggplot(
      data = long,
      mapping = ggplot2::aes_string(
        x = "abbrev",
        y = "points",
        fill = "type"
      )
    ) +
    ggplot2::geom_col(position = "dodge") +
    ggplot2::scale_fill_manual(values = c("#43b049", "#d0021b")) +
    ggplot2::scale_y_continuous(labels = scales::comma) +
    ggplot2::theme(legend.position = "bottom") +
    ggplot2::labs(
      title = "Fantasy Team Points",
      x = "Team",
      y = "Points",
      fill = "Score Type"
    )
  return(p)
}
