library("pdftools")
setwd("----------------------")

text=pdf_text("-------------/statement.pdf")
text2=strsplit(text,"\n")
p1=text2[[1]]
p1=p1[20:35]
p1=p1[c(1,3:16)]
p1[1]="**********        ********          Transaction from ******               -$ 68.71   $ 0.00      $ 0.00       -$ 68.71\r"
Final=data.frame()

for(i in 1:NROW(p1)){
  x=strsplit(p1[i], " " )
  x=x[[1]]
  x=x[x!=""]
  temp=c(x[1],x[2],paste(x[3],x[4]),  paste(x[5],x[6],x[7],x[8]), paste(x[9],x[10]),paste(x[11],x[12]),paste(x[13],x[14]),paste(x[15],x[16])
                         )
  
  Final=rbind(Final,t(temp))
}

p2=text2[[2]]
p2=p2[5:30]
p2[16]="************     ********** Transaction from **********      $ 81.00 $ 0.00  $ 0.00       $ 81.00\r"
p2=p2[c(1:16,18:26)]
for(i in 1:NROW(p2)){
  x=strsplit(p2[i], " " )
  x=x[[1]]
  x=x[x!=""]
  temp=c(x[1],x[2],paste(x[3],x[4]),  paste(x[5],x[6],x[7],x[8]), paste(x[9],x[10]),paste(x[11],x[12]),paste(x[13],x[14]),paste(x[15],x[16])
  )
  
  Final=rbind(Final,t(temp))
}
names(Final)=c("Date","Invoice Number","Transaction For","Description","Sale Amount","Sales Tax","Disc/ADJ","Total Amount")
write.csv(Final, file = "Invoice.csv")
