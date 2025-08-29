# code to randomly sample a set of subdirectories
# I want to make a training dataset of recordings across 25 years and 8 field sites 
# - this code will sample 1 file from each september subdirectory, every other year across
# every field site - the code will add a prefix to each file - whether it is 
# a training or valididation set and the pull date from this code

# first figure out the paths
getwd()
# set wd to "C:/Users/jelias4/mock_ponds" or wherever data is - this will need 
# to be customized for each job 

# set root directory to loop back to 
root<-"C:/Users/jelias4/mock_ponds"

sampled_files<-list() # store pulled files 
prefix<-"252908_train1" # pull date and what subset it belongs to

set.seed(14)
for(pond in 1:8){
  for(year in 2000:2024){
    subdir=file.path(root, paste0("pond", pond), paste0(year), "sept")
    # safegaurd in case the directory is empty or doesn't exist 
    if (dir.exists(subdir)){
      files=list.files(subdir, full.names = T)
      sampled_files[[paste0("pond", pond, "_year_", year)]]<-sample(files, 1)
    }
  }
}

# copy them to a seperate location 
dest_dir=file.path(root, "trainingdata_1_252908")
dir.create(dest_dir, recursive=T, showWarnings = F)

library(stringr)
for(file in sampled_files){
  new_name=str_replace(file, 'dir', '252908_train_dir')
  file.copy(from=file, to=file.path(dest_dir, basename(new_name)))
}

# check in unix shell 


