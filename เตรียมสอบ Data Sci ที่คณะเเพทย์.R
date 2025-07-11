#พื้นฐานคณิตศาสตร์ภาษา R
2 + 3 # การบวก
10 - 4 # การลบ
5 * 6 # การคูณ
20 / 4 # การหาร
2^3 # การยกกำลัง
sqrt(25) # รากที่สอง
log(10) # ลอการิทึมธรรมชาติ
exp(1) # ค่า e ยกกำลัง

# ตัวเเปร Variables
x <- 10
y = 5
summary <- x+y
print(summary)

# Data Types
#Numeric
a <- 10.5
b <- 7

#Integer
c <- 10L

#Character(String)
Name <- "Oatthapong"

#Logical(Boolean)
Yes <- TRUE
No <- FALSE

#ตรวจสอบข้อมูล
class(a)
class(Name)
typeof(Yes)

#Data Structures
#1.Vectors
#สร้างเวกเตอร์ตัวเลข
Score <- c(85 , 92 , 78 , 95 , 88)
print(Score)

#สร้างเวกเตอร์ข้อความ
name_Student <- c("arm", "num" , "one")
print(name_Student)

# indexing
Score[1]
Score[c(2,4)]
Score[-3]

#การดำเนินการกับเวกเตอร์
Score + 5
mean(Score)
sum(Score)

#Matrices
#สร้างเมทริกซ์
matrices_data <- matrix(c(1 ,2 ,3 ,4 ,5 ,6 ), nrow = 2, ncol = 3)
print(matrices_data)

#สร้างเมทริกซ์โดยเรียงตามคอลัมน์
matrices_column <- matrix(1:6 , nrow = 2, ncol = 3 , byrow = FALSE)
print(matrices_column)

#สร้างเมทริกซ์โดยเรียงตามเเถว
matrices_row <- matrix(1:6 , nrow = 2 , ncol = 3 , byrow = TRUE)
print(matrices_row)

#การเข้าถึงข้อมูลในเมทริกซ์ [row , column]
matrices_row[1,2]
matrices_row[2,]
matrices_row[,3]

#Arrays
#สร้างอาร์เรย์ 3 มิติ
arrays_example <- array(1:24, dim = c(2,3,4))
print(arrays_example)

#Lists
#สร้างลิสต์
Data_private <- list(
  name = "oatthapong",
  age = 23,
  status_single = FALSE,
  score_various_subjects = c(90,85,92)
)
print(Data_private)

#การเข้าถึงข้อมูลใน lists
Data_private$name
Data_private[[2]]
Data_private["age"]

#Data Frames
Data_Student <- data.frame(
  ID = c(1,2,3,4),
  name = c("red","black","green","yellow"),
  age = c(15,16,15,17),
  grade = c("A","B","A","C")
)
print(Data_Student)

#การเข้าถึงข้อมูลใน Data Frame
Data_Student$age
Data_Student[,"grade"]
Data_Student[2,]
Data_Student[3,"name"]

#เพิ่มคอลัมน์
Data_Student$gender <- c("male","female","male","female")
print(Data_Student)

#3.การจัดการข้อมูลเเละการเขียนฟังก์ชัน
#importing and exporting data
#การอ่านไฟล์ CSV
Tesla_stock_data
my_data <- read.csv("C:/R/ทบทวนภาษา R/Tesla_stock_data.csv")


# การจัดการข้อมูลเบี้องต้น
head(my_data)
tail(my_data)
str(my_data)
summary(my_data)

#การเลือกข้อมูลสามารถกำหนดเงื่อนไขได้ เช่น เลือกเฉพาะบางคอลัมน์หรือเลือกเฉพาะค่าที่ต้องการ
price_high <- my_data[my_data$Close > 300 , c("Date","Close")]
print(price_high)

#การใช้ฟังก์ชัน (Functions)
#ฟังก์ชันในตัว
min(my_data$Close)
max(my_data$Close)
sd(my_data$Close)

#การสร้างฟังก์ชันในตัวเอง
greeting <- function(name) {
  paste("สวัสดี", name , "ยินดีต้อนรับสู่ R")
}
greeting("Oatthapong")

login <- function(name){
  paste("ยินดีต้อนรับคุณ" , name )
}
login("ARM")

#ฟังก์ชันที่มีหลายอาร์กิวเมนต์เเละคืนค่า
calculate_stock <- function(Close , Volume ){
  stock <- Close * Volume
  return(stock)
}
stock_tesla <- calculate_stock(200,1000000)
print(stock_tesla)

#Control Flow
#if , else if , else
score <- 60

if(score >= 80){
  print("ได้เกรด A")
} else if (score >= 70) {
  print("ได้เกรด B")
} else if (score >= 60) {
  print("ได้เกรด C")
} else{
  print("ได้เกรด D หรือต่ำกว่า")
}

#for
for(i in 1:5) {
  print(paste("Round No.",i))
}

fruits <- c("apple","banana" , "orange")
for (f in fruits){
  print(paste("i like",f))
}

#while
count <- -1
while (count <= 3){
  print(paste("count",count))
  count <- count + 1
}

#Packages and Plotting
install.packages("tidyverse")
library(tidyverse)

#ggplot2 เป็นเเพ็คเกจสำหรับการสร้างกราฟ
data_sales = data.frame(
  month = c("jan","fen","mar","apr","may"),
  sales = c(100,120,90,150,130)
)

#Bar chart
ggplot(data_sales, aes(x = month,y = sales)) +
  geom_bar(stat = "identity" , fill = "skyblue") +
  labs(title = "month_sales", x= "month" , y="sales(baht)") +
  theme_minimal()

#Scatter plot
ggplot(Data_Student , aes(x=age , y = grade)) +
  geom_point(color = "red", size = 3) +
  labs(title = "ความสัมพันธ์ระหว่างอายุและเกรด", x = "age", y = "grade")+
  theme_classic()

#line plot
ggplot(data_sales , aes(x = month , y = sales , group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red" , size = 3) +
  labs(title = "เเนวโน้มยอดขาย" , x = "month", y ="sales") +
  theme_bw()

#Advanced Data Analysis
print(Data_Student)

#กรองเเถวตามเงื่อนไข
Student_female <- Data_Student %>%
  filter(gender == "female")
print(Student_female)

#เลือกคอลัมน์
name_age <- Data_Student %>%
  select(name,age)
print(name_age)

#สร้างคอลัมน์ใหม่หรือเเก้ไขคอลัมน์ที่อยู่มี
data_student_new <- Data_Student %>%
  mutate(age_next_year = age + 1)
print(data_student_new)


#arrange จัดเรียงเเถว
Data_Studentage <- Data_Student %>%
  arrange(age) # เรียงจากน้อยไปมาก
print(Data_Studentage)

Data_Student_maxtomin <- Data_Student %>%
  arrange(desc(age)) #เรียงจากมากไปน้อย
print(Data_Student_maxtomin)

#group_by() เเละ summarise () จัดกลุ่มเเละสรุปข้อมูล
score_add <- data.frame(
  name = c("red", "black" , "green"),
  subject = c("math","math","thai","thai","english","english"),
  score = c(80,90,75,85,95,88)
)

score_average_subject <- score_add %>%
  group_by(subject) %>%
  summarise(score_average = mean(score))
print(score_average_subject)

library(tidyverse)


#Basic Statistics
data_vector <- c(10,12,15,11,13,14,10,12,16,18)

#ค่าเฉลี่ย
mean(data_vector)

#มัธยฐาน
median(data_vector)

#ส่วนเบี่ยงเบนมาตรฐาน
sd(data_vector)

#ความเเปรปรวน
var(data_vector)

#สรุปสถิติ 5 ตัว
summary(data_vector)

#การทดสอบ T-test (เปรียบเทียบค่าเฉลี่ยของ 2 กลุ่ม)
#สมมติมีข้อมูล2กลุ่ม
group1 <- c(20 ,22 , 25, 23 ,21)
group2 <- c(18,19,20,17,19)

t.test(group1,group2)

#การวิเคราะห์ความถดถอยเชิงเส้น Linear Regression
#สมมุติว่าต้องการทำนายยอดขายจากค่าโฆษณา
ads <- c(10,12,15,18,20) #ค่าโฆษณา หน่วยล้านบาท
sales <- c(100,120,140,160,180) #ยอดขาย หน่วยล้านบาท

#สร้างโมเดลถดถอย Linear Regression
model <- lm(sales ~ ads)
print(model)
summary(model) #ดูรายละเอียดผลลัพธ์ของโมเดล

#พล็อตกราฟเเสดงความสัมพันธ์
plot(ads , sales , main = "ความสัมพันธ์ระหว่างโฆษณากับยอดขาย",
     xlab = "ค่าโฆษณา" , ylab = "ยอดขาย")
abline(model , col = "red") #เพิ่มเส้นถอถอย

#การจัดการ Missing Value
data_with_na <- c(1,2,NA,4,5,NA,7)

#ตรวจสอบว่ามี NA หรือไม่
is.na(data_with_na)

#นับจำนวน NA
sum(is.na(data_with_na))

#ลบเเถวที่มี NA ออก
na.omit(data_with_na)

#แทนที่ NA ด้วยค่าเฉลี่ย 
mean_vales <- mean(data_with_na , na.rm = TRUE ) #na.rm = TRUE เพื่อไม่รวม NA ในการคำนวณ
data_imputed <- replace(data_with_na , is.na(data_with_na), mean_vales)
print(data_imputed)

#การวิเคราะห์สถิติขั้นสูงใน R
#1. การวิเคราะห์การถดถอยเชิงเส้นพหุคูณ (Multiple Linear Regression)
# สร้างข้อมูลตัวอย่าง
data_sales <- data.frame(
  Sales = c(100, 120, 90, 150, 130, 110, 160, 145, 105, 170),
  Ad_Budget = c(10, 12, 8, 15, 13, 11, 16, 14, 9, 17),
  Employees = c(5, 6, 4, 7, 6, 5, 8, 7, 5, 8)
)
# สร้างโมเดลถดถอยเชิงเส้นพหุคูณ
# Sales เป็นตัวแปรตาม, Ad_Budget และ Employees เป็นตัวแปรอิสระ
model_multi_lm <- lm(Sales ~ Ad_Budget + Employees, data = data_sales)
# ดูสรุปผลลัพธ์ของโมเดล
summary(model_multi_lm)

#2. การถดถอยโลจิสติก (Logistic Regression)
# สร้างข้อมูลตัวอย่าง
data_customer <- data.frame(
  Age = c(25, 30, 35, 40, 28, 45, 32, 29, 38, 50),
  Income = c(30000, 45000, 50000, 60000, 32000, 70000, 48000, 35000, 55000, 80000),
  Purchase = as.factor(c("No", "Yes", "Yes", "Yes", "No", "Yes", "No", "No", "Yes", "Yes")) # ต้องเป็น factor
)
# สร้างโมเดลถดถอยโลจิสติก
# Purchase เป็นตัวแปรตาม, Age และ Income เป็นตัวแปรอิสระ
model_logistic <- glm(Purchase ~ Age + Income, data = data_customer, family = "binomial")
# ดูสรุปผลลัพธ์ของโมเดล
summary(model_logistic)
# การทำนายความน่าจะเป็น
# สร้างข้อมูลใหม่สำหรับทำนาย
new_customer <- data.frame(Age = 33, Income = 52000)
predict(model_logistic, newdata = new_customer, type = "response") # type="response" เพื่อให้ได้ค่าความน่าจะเป็น

#3. การวิเคราะห์ความแปรปรวน (ANOVA - Analysis of Variance)
# สร้างข้อมูลตัวอย่าง
data_drug <- data.frame(
  Drug = as.factor(c(rep("DrugA", 10), rep("DrugB", 10), rep("DrugC", 10))),
  BP_Reduction = c(
    rnorm(10, mean = 10, sd = 2), # DrugA
    rnorm(10, mean = 15, sd = 2.5), # DrugB
    rnorm(10, mean = 12, sd = 1.8)  # DrugC
  )
)
# ทำการวิเคราะห์ ANOVA
anova_result <- aov(BP_Reduction ~ Drug, data = data_drug)
# ดูสรุปผลลัพธ์
summary(anova_result)
# ต้องติดตั้งแพ็กเกจ "agricolae" หรือ "multcomp"
install.packages("agricolae")
library(agricolae)
HSD.test(anova_result, "Drug", console=TRUE)

#4. การวิเคราะห์อนุกรมเวลา (Time Series Analysis) - เบื้องต้น
#ARIMA Model เบื้องต้น
# สร้างข้อมูลอนุกรมเวลาตัวอย่าง (เช่น ยอดขายรายเดือน 24 เดือน)
sales_ts <- ts(c(100, 105, 110, 108, 115, 120, 125, 122, 130, 135, 140, 138,
                 145, 150, 155, 152, 160, 165, 170, 168, 175, 180, 185, 182),
               start = c(2023, 1), frequency = 12) # frequency=12 สำหรับข้อมูลรายเดือน
# พล็อตกราฟอนุกรมเวลา
plot(sales_ts, main = "ยอดขายรายเดือน", xlab = "ปี", ylab = "ยอดขาย")
# ติดตั้งแพ็กเกจ "forecast"
install.packages("forecast")
library(forecast)
# สร้างโมเดล ARIMA (AutoRegressive Integrated Moving Average)
# auto.arima จะช่วยเลือกพารามิเตอร์ที่เหมาะสม
arima_model <- auto.arima(sales_ts)
summary(arima_model)
# ทำนายยอดขายในอนาคต 12 เดือน
forecast_sales <- forecast(arima_model, h = 12)
plot(forecast_sales)

#การจัดการกับ  Big Data
# ติดตั้งแพ็กเกจ data.table (ทำแค่ครั้งเดียว)
install.packages("data.table")
# เรียกใช้ data.table
library(data.table)

# สร้าง data.table จาก data.frame หรือสร้างใหม่
dt_data <- data.table(
  ID = 1:1000000,
  Category = sample(LETTERS[1:5], 1000000, replace = TRUE),
  Value = rnorm(1000000, mean = 50, sd = 10)
)

# เปรียบเทียบความเร็ว (Optional: ลองรันโค้ดด้านล่างเพื่อดูความแตกต่าง)
system.time({
   df_data <- data.frame(
     ID = 1:1000000,
     Category = sample(LETTERS[1:5], 1000000, replace = TRUE),
     Value = rnorm(1000000, mean = 50, sd = 10)
   )
   df_filtered <- df_data[df_data$Category == "A", ]
   df_summary <- aggregate(Value ~ Category, data = df_data, FUN = mean)
 })

system.time({
   dt_filtered <- dt_data[Category == "A"] # กรองแถว
   dt_summary <- dt_data[, ( value = mean(Value)), by = Category] # จัดกลุ่มและหาค่าเฉลี่ย
 })

# การกรองข้อมูล (i)
dt_filtered <- dt_data[Category == "A"]
print(head(dt_filtered))

# การเลือกและคำนวณคอลัมน์ (j)
dt_selected_calculated <- dt_data[, .(Avg_Value = mean(Value), Sum_Value = sum(Value))]
print(head(dt_selected_calculated))

# การจัดกลุ่มและสรุปข้อมูล (by)
dt_summary_by_category <- dt_data[, .(Mean_Value = mean(Value)), by = Category]
print(dt_summary_by_category)

# การเรียงลำดับ
dt_sorted <- dt_data[order(Value)]
print(head(dt_sorted))

# การอัปเดตข้อมูลแบบ in-place (ไม่ต้องสร้างวัตถุใหม่)
dt_data[, Value_Squared := Value^2] # เพิ่มคอลัมน์ใหม่
print(head(dt_data))