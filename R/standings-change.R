#' Plot change in standing projections
#'
#' @param data The data frame from [fflr::league_standings()].
#' @param filename File name to create on disk. Passed to [ggplot2::ggsave()],
#'   with a height of 4 inches, width of 7, and a DPI of 320. If `NULL`, no file
#'   is created.
#' @return A ggplot bar chart object.
#' @examples
#' tmp <- tempfile()
#' standings_change(fflr::league_standings(252353), filename = tmp)
#' @importFrom ggplot2 ggplot geom_col aes_string scale_fill_manual
#'   scale_y_continuous theme labs element_blank element_text ggsave arrow
#' @importFrom dplyr arrange mutate case_when
#' @importFrom forcats as_factor fct_rev
#' @importFrom rlang .data
#' @export
standings_change <- function(data, filename = NULL) {
  x <- dplyr::mutate(
    .data = dplyr::arrange(data, .data$draft),
    abbrev = forcats::fct_rev(forcats::as_factor(.data$abbrev)),
    net = .data$draft - .data$current,
    improve = ifelse(.data$net == 0, NA, .data$net > 0),
    change = dplyr::case_when(
      net == 0 ~ "same",
      net > 0 ~ "up",
      net < 0 ~ "down"
    ),
    start = ifelse(.data$improve, .data$draft - 0.16, .data$draft + 0.16),
    end = ifelse(.data$improve, .data$current + 0.16, .data$current - 0.16)
  )
  y <- tidyr::pivot_longer(x, cols = c("current", "draft"))
  w <- sprintf("(as of week %s)", unique(data$week))
  p <-
    ggplot2::ggplot(
      data = y,
      mapping = ggplot2::aes_string(
        x = "value",
        y = "abbrev"
      )
    ) +
    ggplot2::geom_point(
      size = 7,
      stroke = 1,
      mapping = ggplot2::aes_string(
        color = "change",
        shape = "name"
      ),
    ) +
    ggplot2::geom_text(
      data = x,
      mapping = ggplot2::aes_string(
        label = "draft",
        x = "draft",
        color = "change"
      )
    ) +
    ggplot2::geom_text(
      data = x,
      color = "white",
      mapping = ggplot2::aes_string(
        label = "current",
        x = "current"
      )
    ) +
    ggplot2::geom_segment(
      data = x[!is.na(x$improve), ],
      arrow = ggplot2::arrow(
        type = "closed",
        length = ggplot2::unit(0.05, "npc")
      ),
      mapping = ggplot2::aes_string(
        x = "start",
        color = "change",
        xend = "end",
        yend = "abbrev"
      )
    ) +
    ggplot2::scale_shape_manual(values = c(16, 1), guide = FALSE) +
    ggplot2::scale_color_manual(
      values = c("#d0021b", "#808080", "#43b049"),
      guide = FALSE
    ) +
    ggplot2::scale_x_reverse(breaks = 1:8) +
    ggplot2::theme(
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),
      plot.title = ggplot2::element_text(face = "bold"),
      axis.ticks.y = ggplot2::element_blank()
    ) +
    ggplot2::labs(
      title = "Final Standing Projections",
      subtitle = paste("Draft Day vs. Current Projections", w),
      x = "Standing",
      y = "Team"
    )
  if (!is.null(filename)) {
    ggplot2::ggsave(
      filename = filename,
      device = "png",
      plot = p,
      height = 4,
      width = 7
    )
    invisible(p)
  } else {
    return(p)
  }
}
