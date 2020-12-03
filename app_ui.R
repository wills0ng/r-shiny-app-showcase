# Define ui widgets

# County population slider
# to filter the counties in the scatterplot
pop_slider <- sliderInput(
  inputId = "pop_range",
  label = "Filter by county population",
  min = min(midwest$poptotal),
  max = max(midwest$poptotal),
  value = range(midwest$poptotal)
)

# Selector for feature to plot in scatterplot
feature_selector <- selectInput(
  inputId = "selected_feature",
  label = "Select a feature",
  choices = colnames(midwest %>% select(-county)),
  selected = "poptotal"
)

# Select state to include in histogram
state_selector <- selectInput(
  inputId = "selected_state",
  label = "Select a state",
  choices = unique(midwest$state),
  selected = "MO"
)

# Select numeric feature to plot in histogram
numeric_feature_selector <- selectInput(
  inputId = "selected_numeric_feature",
  label = "Select a feature",
  choices = colnames(midwest %>% select_if(is.numeric)),
  selected = "poptotal"
)

# Page 1 contains a scatterplot of
# percent educated in filtered counties
# by selected feature
page_1 <- tabPanel(
  titlePanel("Percent college educated"),
  sidebarLayout(
    sidebarPanel(
      pop_slider,
      feature_selector
    ),
    mainPanel(
      plotOutput("percollege_scatter")
    )
  )
)

# Page 2 contains a histogram
# of the selected numeric feature
# for counties within the selected state
page_2 <- tabPanel(
  titlePanel("Histograms by state"),
  sidebarLayout(
    sidebarPanel(
      state_selector,
      numeric_feature_selector
    ),
    mainPanel(
      plotOutput("state_histogram")
    )
  )
)

# Create navbar UI with the 2 pages
ui <- navbarPage(
  "Midwest Demographics Data Explorer",
  page_1,
  page_2
)
