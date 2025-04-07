#ตัวแปรและโครงสร้างข้อมูล (Vectors, Matrices, Data Frames, Lists)
#ใน R เราสามารถสร้างตัวแปรด้วย <- หรือ = ได้:

#ตัวเเปร (Variables)
x <- 10
name <- "Oatthapong"
is_ready <- TRUE

#Vectors (เวกเตอร์)
numbers = c(1,2,3,4,5)
name = c("Ann","Bob","Cat")

length(numbers)
sum(numbers)
mean(numbers)

#Matrices (เมทริกซ์)
m = matrix(1:9 , nrow=3 , ncol=3)
print(m)

m[1,2]

#Data Frames (ตารางข้อมูล)
df = data.frame(
  name = c("A", "B", "C"),
  age = c(23, 25, 30),
  score = c(90, 85, 95)
)
print(df)

df$name
df[1,]
df[df$age > 24, ]

#Lists (ลิสต์)
my_list = list(
  name = "Alice",
  scores = c(88,92,95),
  passed = TRUE
)
print(my_list)

my_list$name
my_list$scores[2]
