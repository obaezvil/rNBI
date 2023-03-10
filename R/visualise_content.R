#' Deploy the lecture slides in HTML format
#'
#' @param lecture character object indicating which lecture to visualise:
#' \itemize{
#'   \item{'Lecture1': }{Introduction to R - Part 1}
#'   \item{'Lecture2': }{Introduction to R - Part 2}
#'   \item{'Lecture3': }{Raster files and spatial data}
#'   \item{'Lecture4': }{Data processing}
#'   \item{'Lecture5': }{Spatial and temporal statistics}
#'   \item{'Lecture6': }{Automating downloading}
#'   \item{'Lecture7': }{Functions and parallel computation}
#'   \item{'Lecture8': }{Advanced spatial and temporal statistics}
#'}
#'
#' @return this function directs the user to the selected lecture.
#' @export
#'
#' @examples
render_lectures <- function(lecture){
  
  # Setting the directory
  dir <- .get_libpath("rNBI")
  dir <- file.path(dir, "doc")
  
  # Setting the lecture names
  lectures <- paste0("Lecture", 1:3)
  
  # Checking if the name corresponds to the existing lectures
  # Lectures to be included
    # 'Lecture4' : Data processing
    # 'Lecture5' : Spatial and temporal statistics
    # 'Lecture6' : Automating downloading"
  if(!lecture %in% lectures)
    stop("Please provide the proper name of the lecture: 
          'Lecture1' : Introduction to R - Part 1
          'Lecture2' : Introduction to R - Part 2
          'Lecture3' : Raster files and spatial data
          'Lecture4' : Data processing
          'Lecture5' : Spatial and temporal statistics
          'Lecture6' : Automating downloading
          'Lecture7' : Functions and parallel computation
          'Lecture8' : Advanced spatial and temporal statistics")
  
  if(lecture == "Lecture1"){
    browseURL(file.path(dir, "Lecture1_Introduction_to_R_I.html"))
  } else if (lecture == "Lecture2"){
    browseURL(file.path(dir, "Lecture2_Introduction_to_R_II.html"))
  } else if (lecture == "Lecture3"){
    browseURL(file.path(dir, "Lecture3_Rasters_and_spatial_data.html"))
  } else if (lecture == "Lecture4"){
    browseURL(file.path(dir, "Lecture4_Data_processing.html"))
  } else if (lecture == "Lecture5"){
    browseURL(file.path(dir, "Lecture5_Spatial_and_temporal_statistics.html"))
  } else if (lecture == "Lecture6"){
    browseURL(file.path(dir, "Lecture6_Automating_downloading.html"))
  } else if (lecture == "Lecture7"){
    browseURL(file.path(dir, "Lecture7_Functions_and_parallel_computation.html"))
  } else if (lecture == "Lecture8"){
    browseURL(file.path(dir, "Lecture8_Advanced_spatial_and_temporal_statistics.html"))
  }
    
} # end render_lectures


#' Deploy the exercises in HTML format
#'
#' @param exercise character object indicating which exercise to visualise:
#'   'Practical_exercise1', 'Practical_exercise2', or 'Practical_exercise3'
#' @param solved logical argument. Should the solution be displayed? The default is FALSE
#'
#' @return this function directs the user to the selected exercise.
#' @export
#'
#' @examples
render_exercises <- function(exercise, solved = FALSE){
  
  # Setting the directory
  dir <- .get_libpath("rNBI")
  dir <- file.path(dir, "doc")
  
  # Setting the lecture names
  exercises <- paste0("Practical_exercise", c(1, 1.1, 1.2))
  
  # Checking if the name corresponds to the existing lectures
  if(!exercise %in% exercises)
    stop("Please provide the proper name of the exercise:
          'Practical_exercise1', 'Practical_exercise1.1', or 'Practical_exercise1.2'")
  
  # Checking if the parameter solved is logical
  if(!is.logical(solved))
    stop("The parameter 'solved' must be either TRUE or FALSE")
  
  # Extracting number
  nbr <- strsplit(exercise, "Practical_exercise")[[1]][2]
  
  if(solved){
    browseURL(file.path(dir, paste0("Practical_exercise", nbr, "_solved.html")))
  } else {
    browseURL(file.path(dir, paste0("Practical_exercise", nbr, ".html")))
  } 
  
} # end render_exercises


# utils function that finds library of the packages
.get_libpath <- function(package){
  
  # Get library paths
  paths <- .libPaths()
  
  # iterative process to find package
  pos <- NA
  for(i in 1:length(paths)){
    
    pos[i] <- file.exists(file.path(paths[i], package))
    
  }
  
  # Checking libpaths that include the package
  final_path <- paths[which(pos == "TRUE")]
  
  # Checking that the package is there
  if(length(final_path) < 1)
    stop("The package ", package, " could not be found!")
  
  # retrieving library path
  final_path <- file.path(final_path[1], package)
  return(final_path)
  
}
