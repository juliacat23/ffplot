#' Plot bar chart of weekly scores
#'
#' @param data The data frame from [fflr::weekly_matchups()].
#' @return A ggplot bar chart object.
#' @examples
#' weekly_scores(fflr::weekly_matchups(252353))
#' @importFrom ggplot2 ggplot geom_col aes_string scale_fill_manual
#'   scale_y_continuous theme labs
#' @importFrom forcats fct_rev
#' @importFrom dplyr group_by mutate
#' @importFrom rlang .data
#' @export
weekly_scores <- function(data) {
  data <- data[!is.na(data$score), ]
  data$week <- forcats::fct_rev(data$week)
  data <- dplyr::group_by(data, .data$abbrev)
  data <- dplyr::mutate(data, cum = cumsum(.data$score))
  ggplot2::ggplot(
      data = data,
      mapping = ggplot2::aes(
        x = stats::reorder(.data$abbrev, .data$score),
        y = .data$score,
        fill = .data$week
      )
    ) +
    ggplot2::geom_col() +
    ggplot2::geom_text(
      nudge_y = -10,
      ggplot2::aes_string(
        label = "score",
        y = "cum"
      )
    ) +
    ggplot2::coord_flip() +
    ggplot2::scale_y_continuous(
      labels = scales::comma,
      breaks = seq(0, 1e5, by = 25)
    ) +
    ggplot2::scale_fill_manual(
      values = pal,
      guide = ggplot2::guide_legend(reverse = TRUE)
    ) +
    ggplot2::theme(legend.position = "bottom") +
    ggplot2::labs(
      title = "Fantasy Team Points by Week",
      x = "Team",
      y = "Points",
      fill = "Week"
    )
}

#' Plot bar chart of weekly power wins
#'
#' @param data The data frame from [fflr::weekly_matchups()].
#' @return A ggplot bar chart object.
#' @examples
#' weekly_power(fflr::weekly_matchups(252353))
#' @importFrom ggplot2 ggplot geom_col aes_string scale_fill_manual
#'   scale_y_continuous theme labs guide_legend
#' @importFrom forcats fct_rev
#' @importFrom dplyr group_by mutate
#' @importFrom rlang .data
#' @export
weekly_power <- function(data) {
  data <- data[!is.na(data$score), ]
  data$week <- forcats::fct_rev(data$week)
  data <- dplyr::group_by(data, .data$abbrev)
  data <- dplyr::mutate(data, cum = cumsum(.data$power))
  ggplot2::ggplot(
    data = data,
    mapping = ggplot2::aes(
      x = stats::reorder(.data$abbrev, .data$power),
      y = .data$power,
      fill = .data$week
    )
  ) +
    ggplot2::geom_col() +
    ggplot2::coord_flip() +
    ggplot2::scale_y_continuous(breaks = seq(0, 200, by = 1)) +
    ggplot2::scale_fill_manual(
      values = pal,
      guide = ggplot2::guide_legend(reverse = TRUE)
    ) +
    ggplot2::theme(legend.position = "bottom") +
    ggplot2::labs(
      title = "Fantasy Power Wins by Week",
      x = "Team",
      y = "Power Wins",
      fill = "Week"
    )
}

pal <- c(
  "#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02",
  "#A6761D", "#666666", "#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF"
)
