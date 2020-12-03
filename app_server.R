server <- function(input, output) {
  # This first plot is a scatterplot of
  # percent educated in filtered counties
  # by selected feature
  output$percollege_scatter <- renderPlot({
    midwest_filtered <- midwest %>% filter(
      poptotal >= input$pop_range[1],
      poptotal <= input$pop_range[2]
    )

    ggplot(data = midwest_filtered) +
      geom_point(mapping = aes_string(x = input$selected_feature,
                                      y = "percollege")) +
      labs(title = paste("Percent college educated in county by",
                         input$selected_feature),
           x = paste("Selected feature:", input$selected_feature),
           y = "Percent college educated")
  })

  # This 2nd plot is a histogram
  # of the selected numeric feature
  # for counties within the selected state
  output$state_histogram <- renderPlot({
    midwest_filtered <- midwest %>% filter(
      state == input$selected_state
    )

    ggplot(data = midwest_filtered,
           aes_string(x = input$selected_numeric_feature)) +
      geom_histogram() +
      labs(title = paste("Histogram of",
                         input$selected_numeric_feature,
                         "in",
                         input$selected_state),
           x = paste("Selected feature:", input$selected_numeric_feature),
           y = "Frequency")
  })
}
