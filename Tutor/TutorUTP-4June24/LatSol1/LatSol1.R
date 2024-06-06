score = read.csv("Score.csv", na.strings="" , fileEncoding = "UTF-8-BOM")
weight = read.csv("ScoreWeight.csv", na.strings="" , fileEncoding = "UTF-8-BOM")

weight=weight[weight$Course.Code %in% score$Course.Code, ]
weight

index = match(weight$Course.Code, score$Course.Code)
index
score = score[index,,drop=FALSE]
score

scr = score[,c("Assignment", "Mid.Exam", "Final.Exam")]
scr
wgt = weight[,c("Assignment", "Mid.Exam", "Final.Exam")]
wgt
total = scr*wgt
total = rowSums(total)
total
total = matrix(total, ncol=1)
colnames(total) = "Total"
total

grd = matrix("", ncol = 1, nrow = nrow(total))
grd

for(i in 1:nrow(total)){
  if(total[i] > 90){
    grd[i] = "A"
  }else if(total[i] > 85){
    grd[i] = "A-"
  }else if(total[i] > 80){
    grd[i] = "B+"
  }else if(total[i] > 75){
    grd[i] = "B"
  }else if(total[i] > 70){
    grd[i] = "B-"
  }else if(total[i] > 65){
    grd[i] = "C"
  }else if(total[i] > 50){
    grd[i] = "D"
  }else{
    grd[i] = "E"
  }
}
colnames(grd) = "Grade"
score = cbind(score, total)
score = cbind(score, grd)
score

write.csv(score,file="Result.csv")
write.csv(score,file="R.csv", row.names = FALSE)

