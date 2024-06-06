# kita mau ngitung nilai akhir buat semua coursecode terus nanti kita golongin dia masuk ke grade apa

# ini buat read filenya
score = read.csv("Score.csv", na.strings = "", fileEncoding = "UTF-8-BOM")
scoreWeight = read.csv("ScoreWeight.csv", na.strings = "", fileEncoding = "UTF-8-BOM")

# ini nyoba tapi sala
coursecode = score[scoreWeight$Course.Code %in% score$Course.Code, ]
coursecode

score = score[scoreWeight$Course.Code %in% score$Course.Code, ]
score

# ini kita kaya cari coursecode yang sama 
scoreWeight = scoreWeight[scoreWeight$Course.Code %in% score$Course.Code, ]
scoreWeight

# kita coba kaya nyocokin coursecode ini di index (urutan) yang sama ga, intinya dicocokin
index = match(scoreWeight$Course.Code, score$Course.Code)
index

# kita susun ulang scorenya biar urutannya sesuai sama index
# drop ini bakal nentuin hasil subsettingnya masi bentuk data frame ato ga, nah kalo ga nanti itu di drop
# drop = FALSE ini fungsinya buat pastiin hasilnya masi berupa data frame ga walopun coamgn 1 baris atau kolom yang dipilih
# drop = TRUE ini fungsinya buat hapus dimensi yang gaperlu, kalo yg dipili comang 1 kolom ato baris nanti bentuknya jadi vektor
score = score[index,,drop = FALSE]
score

# kita pilih kolom dari score & scoreweight
scorecolumn = score[, c("Assignment", "Mid.Exam", "Final.Exam")]
scorecolumn
scoreWeightcolumn = scoreWeight[, c("Assignment", "Mid.Exam", "Final.Exam")]
scoreWeightcolumn

# sekarang kita itung scorenya jadi berapa
calculatescore = scorecolumn*scoreWeightcolumn
calculatescore
totalscore = rowSums(calculatescore)
totalscore

# nanti hasil rowSumsnya itu bakal ga kaya table gitu intinya
# nah pake function matrix kita bisa bikin itu jadi bentuk table
# terus kalo pake ncol = 1 itu kita ngasi tau kita mau 1 column
totalscore = matrix(totalscore, ncol = 1)
totalscore

# kita bisa ganti nama col nya
colnames(totalscore) = "Total Score"
totalscore

# sekarang kita bikin 1 table baru buat nanti nampilin gradenya
grade = matrix("", ncol = 1, nrow = nrow(totalscore))
colnames(grade) = "Grade"
grade

# kita lopping buat nentuin kita ngecek berapa kali
for(i in 1:nrow(totalscore)){
  if(totalscore[i] > 90){
    grade[i] = "A"
  }else if(totalscore[i] > 85){
    grade[i] = "A-"
  }else if(totalscore[i] > 80){
    grade[i] = "B+"
  }else if(totalscore[i] > 75){
    grade[i] = "B"
  }else if(totalscore[i] > 70){
    grade[i] = "B-"
  }else if(totalscore[i] > 65){
    grade[i] = "C"
  }else if(totalscore[i] > 50){
    grade[i] = "D"
  }else{
    grade[i] = "E"
  }
}

grade

# ini buat gabungin scorenya sama yang tadi uda dicari
score = cbind(score, totalscore, grade)
score

write.csv(score, file = "TotalScore.csv", row.names = FALSE)
