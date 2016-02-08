

ap_df <- data.frame(
   x = as.numeric(time(AirPassengers)),
   y = as.numeric(AirPassengers)
)

ggplot(ap_df, aes(x = x, y = y)) +
   stat_seas(start = c(1949, 1), frequency = 12)

 ggplot(ap_df, aes(x = x, y = y)) +
    stat_seas(start = c(1949, 1), frequency = 12, x13_params = list(x11 = "", outlier = NULL))

 # default additive decomposition (doesn't work well in this case!):
 ggplot(ap_df, aes(x = x, y = y)) +
     stat_decomp(frequency = 12)
 
 # multiplicative decomposition, more appropriate:
 ggplot(ap_df, aes(x = x, y = y)) +
    stat_decomp(frequency = 12, type = "multiplicative")
 

 #=======================stl=================
  # periodic if fixed seasonality; doesn't work well:
  ggplot(ap_df, aes(x = x, y = y)) +
     stat_stl(frequency = 12, s.window = "periodic")
  
  # seasonality varies a bit over time, works better:
  ggplot(ap_df, aes(x = x, y = y)) +
     stat_stl(frequency = 12, s.window = 7)
  
  ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
    geom_point() +
    facet_wrap(~sex) +
    stat_stl(frequency = 12, s.window = 7) +
    ggtitle("Seasonally adjusted lung deaths")