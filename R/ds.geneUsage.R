#-------------------------------------- HEADER --------------------------------------------#
#' @title Computes the statistical mean of a given vector
#' @description This function is similar to the R function \code{mean}.
#' @details It is a wrapper for the server side function.
#' @param x a character, the name of a numerical vector
#' @param type a character which represents the type of analysis to carry out.
#' If \code{type} is set to 'combine', a global mean is calculated
#' if \code{type} is set to 'split', the mean is calculated separately for each study.
#' @param checks a boolean, if TRUE (default) checks that verify elements on the server side
#' such checks lengthen the run-time so the default is FALSE and one can switch these checks
#' on (set to TRUE) when faced with some error(s).
#' @param datasources a list of opal object(s) obtained after login in to opal servers;
#' these objects hold also the data assign to R, as \code{data frame}, from opal datasources.
#' @return a numeric
#' @author Gaye A., Isaeva I.
#' @seealso \code{ds.quantileMean} to compute quantiles.
#' @seealso \code{ds.summary} to generate the summary of a variable.
#' @export
#' @examples {
#'
#'   # load that contains the login details
#'   data(logindata)
#'
#'   # login and assign specific variable(s)
#'   myvar <- list('LAB_TSC')
#'   opals <- datashield.login(logins=logindata,assign=TRUE,variables=myvar)
#'
#'   # Example 1: compute the pooled statistical mean of the variable 'LAB_TSC' - default behaviour
#'   ds.mean(x='D$LAB_TSC')
#'
#'   # Example 2: compute the statistical mean of each study separately
#'   ds.mean(x='D$LAB_TSC', type='split')
#'
#'   # clear the Datashield R sessions and logout
#'   datashield.logout(opals)
#'
#' }
#' 


library(opal)

ds.geneUsage = function(x=NULL, type='combine', checks=FALSE, datasources=NULL){
  
  server <- c("irecptor-opal") #The server names
  url <- c("https://ireceptorplus.inesctec.pt/repo") # These IP addresses change
  user <- "administrator"
  password <- "password"
  name <- "name"
  table <- c("SRP072206.Patient1-B0") 
  my_logindata <- data.frame(server,name,url,user,password,table)
  
  opals <- opal::datashield.login(logins=my_logindata, assign=TRUE)
  
  print("Cheguei aqui")
  
  cally <- paste0( "geneUsageDS(42)" )
  # print(paste0("geneUsageDS(", x, ", .gene=c('HomoSapiens.TRBJ')" ,")"))
  print("Cheguei aqui3")
  # geneUsage.local <- opal::datashield.method(opals, dim)
  
  geneUsage.local <- opal::datashield.aggregate(opals, as.symbol(cally))
  

  #yeehaw <- opal::datashield.has_method(opals, "geneUsageDS")
  
  dsadmin.install_package(opals, "dsImmunarch", githubusername = "Jabst", ref = "master")
  
  
  
  
  
}
