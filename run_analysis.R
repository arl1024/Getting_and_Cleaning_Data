####################
# run_analysis.R
####################
library("data.table")

########################
# Preparation directory
########################
#setwd("C:/CURSOS/COURSERA/Getting and Cleaning Data/EJERCICIO/")

# Read features names
nomcamp<-read.table("features.txt",header=FALSE)

# Identify dir's
dir0<-getwd()
dirTr<-paste0(dir0,"/train/")
dirTe<-paste0(dir0,"/test/")

# Files to try
setwd(dirTr)
filesTr<-list.files(pattern="\\.txt$")
setwd(dirTe)
filesTe<-list.files(pattern="\\.txt$")

#########################
# PART 1 ###############
#########################
   
setwd(dir0)
# Merge files
file=for (f in filesTr) {               # for all train files:
        a<-read.table(paste0(dirTr,"/",f),header=FALSE)
        g<-gsub("train","test",f)       # search equivalet test
        b<-read.table(paste0(dirTe,"/",g), header=FALSE)
        conjunto<-rbind(a,b)            # bind all rows
        nomfile<-strsplit(f, "\\.")[[1]]
        write.table(conjunto, paste0(nomfile[1],"_NEW.txt"),row.names=FALSE,col.names=FALSE)
                                        # write new merged file 
}
# file _NEW.txt in conjunto
######################
# PART 2,3,4 #########
######################
# Work with labels
nomcamp<-read.table("features.txt", header=FALSE)       # features names
nomcamp<-gsub("[()-]","",nomcamp$V2)
nomcamp<-gsub("mean","Mean",nomcamp)
nomcamp<-gsub("^[tf]","",nomcamp)
nomcamp<-gsub("std","Std",nomcamp)
duplica<-duplicated(nomcamp)
nomsit<-read.table("activity_labels.txt", header=FALSE) # activity names
# nomsit<-conjunto

# Naming the columns
situacion<-read.table("y_train_NEW.txt", header=FALSE,col.names="activity")
persona<-read.table("subject_train_NEW.txt", header=FALSE,col.names="subject")
tabla1<-read.table("X_train_NEW.txt", header=FALSE, col.names=nomcamp)
tabla2<-cbind(situacion,tabla1)

# Adding activity
tabla2$activity<-nomsit[tabla2$activity,"V2"]

# Choose mean std
busca<-".[Mm]ean|[Ss]td|activity"

# TABLE WITH ACTIVITY, MEAN AND STD
dat_mean_std<-tabla2[,grep(busca,names(tabla2))]  

# Write dataset
# write.table(dat_mean_std,"data_set_1.txt", row.names=FALSE,col.names=TRUE,quote=FALSE)

#########################
# PART 5 ###############
#########################
nomsit<-read.table("activity_labels.txt", header=FALSE)
# head(nomsit)
# origen<-read.table("data_set_1.txt",header=TRUE)
origen<-dat_mean_std
usuari<-read.table("subject_train_NEW.txt", header=FALSE,col.names="subject")
grupos<-as.data.table(cbind(usuari,origen)) # Contiene todos los campos

situa<-nomsit$V2
person<-c(1:30)
conjunto<-data.table()  # Output dataset

for (n in person) {     # For each subject
        grupoA<-subset(grupos,as.numeric(subject)==n)
        for (m in situa){       # For each activity
                grupoB<-subset(grupoA,activity==m)
                dt <- as.data.table(grupoB)
                setkey(dt,activity)
                grupoC<-dt[, lapply(.SD,mean), by=activity]     # Mean activity
                conjunto<-rbind(conjunto,grupoC)
        }
}
write.table(conjunto, "solution.txt",row.names=FALSE)
