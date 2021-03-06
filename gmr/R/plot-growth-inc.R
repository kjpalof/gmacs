#' Get growth increment data
#'
#' @param M list object(s) created by read_admb function
#' @return dataframe of growth increments
#' @author D'Arcy N. Webber, SJD Martell
#' @export
#' 
.get_gi_df <- function(M)
{
    n  <- length(M)
    mdf <- NULL
    for(i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(Model = names(M)[i],
                         Sex   = A$iMoltIncSex,
                         obs   = A$pMoltInc,
                         pred  = A$dMoltInc,
                         size  = A$dPreMoltSize)
        df$Sex <- .SEX[df$Sex + 1]
        mdf <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot growth from arbitrary start age
#'
#' @param replist list object created by read_admb function
#' @param xlab the x-axis label for the plot
#' @param ylab the y-axis label for the plot
#' @param slab the sex label for the plot that appears above the key
#' @return plot growth increment for given pre-molt size, including model predictions and data
#' @author SJD Martell, D'Arcy N. Webber
#' @export
#' 
plot_growth_inc <- function(M, xlab = "Pre-molt size (mm)", ylab = "Molting increment (mm)",
                            slab = "Sex")
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_gi_df(M)
    
    p <- ggplot(mdf) +
        expand_limits(y = 0) +
        labs(x = xlab, y = ylab, col = slab)
    
    #p <- p + geom_point(aes(x = size, y = obs, colour = sex))
    #p <- p + geom_line(aes(x = size, y = pred, colour = sex))
    #if (!length(M) == 1)
    #{
    #    p <- p + facet_wrap(~Model)
    #}
    
    if (length(M) == 1 && length(unique(mdf$Sex)) == 1)
    {
        p <- p + geom_line(aes(x = size, y = obs)) +
            geom_point(aes(x = size, y = obs))
    } else if (length(M) != 1 && length(unique(mdf$Sex)) == 1) {
        p <- p + geom_line(aes(x = size, y = obs, col = Model)) +
            geom_point(aes(x = size, y = obs, col = Model))
    } else if (length(M) == 1 && length(unique(mdf$Sex)) != 1) {
        p <- p + geom_line(aes(x = size, y = obs, linetype = Sex))
    } else {
        p <- p + geom_line(aes(x = size, y = obs, linetype = Sex, col = Model)) +
            geom_point(aes(x = size, y = obs, col = Model))
    }
    return(p + .THEME)
}
