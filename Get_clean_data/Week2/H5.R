library(rhdf5)
created = h5createFile("example5")
created = h5createFile("example5.h5")
created

created = h5createGroup("example5.h5","foo")
created = h5createGroup("example5.h5","baa")
created = h5createGroup("example5.h5","foo/foobaa")
h5ls("example5.h5")

df = data.frame(1L:5L,seq(0,1,length.out = 5),c("ab","cde","fghi","a","s"),stringAsFactors=FALSE)
                
h5write(obj = df,file = "example5.h5",name = "df")

