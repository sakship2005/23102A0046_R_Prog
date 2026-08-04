
R version 4.6.1 (2026-06-24 ucrt) -- "Happy Hop"
Copyright (C) 2026 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> #Assigning values to varibles
> x<-10
> y="Hello"
> z<-TRUE
> print(x)
[1] 10
> print(y)
[1] "Hello"
> print(z)
[1] TRUE
> 
> 
> #Variables
> var1<-5
> var.name<-10
> _var<-20
Error: unexpected symbol in "_var"
> 2var<-30
Error: unexpected symbol in "2var"
> Var<-100
> var<-200
> print(Var)
[1] 100
> print(var)
[1] 200
> #Varaible assginmnet Methods
> a<-15
> b=20
> 10->a
> assign("c",250
+ assign("c",25)
Error: unexpected symbol in:
"assign("c",250
assign"
> assign("c",25)
> print(a)
[1] 10
> print(b)
[1] 20
> print(c)
[1] 25
> #Dynamic typing in R
> x<-10
> x<-"R Programming"
> print(x)
[1] "R Programming"
> #comments 
> x=10
> if(FALSE){
+ #this is a multi line comment
+ #It wont be executed
+ x<-5=10
+ }
> print(x)
[1] 10
> y<-x*2
> print(y)
[1] 20
> #using if-else
> x<=10
[1] TRUE
> if(x>5){
+ print("x is greater than 5")
+ }
[1] "x is greater than 5"
> else{
Error: unexpected 'else' in "else"
> if(x>5){
+ print("x is greater than 5")
+ }else{
+ print("x is less than or equal to 5")
+ }
[1] "x is greater than 5"
> #Using for loop 
> for(i in 1:5){
+ print(i)
+ }
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
> #Using while loop
> count<-1
> while(count<=3){
+ print(paste("Count is",count))
+ count<-count+1
+ }
[1] "Count is 1"
[1] "Count is 2"
[1] "Count is 3"
> #Using function 
> square<-function(x){//R supports function with default value 
Error: unexpected '/' in "square<-function(x){/"
> return(x*x)
Error: no function to return from, jumping to top level
> }
Error: unexpected '}' in "}"
> print(square(4))
Error in square(4) : could not find function "square"
> for(i in 1:10){
+ if(i==6){
+ break
+ }
+ print(i)
+ }
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
> #Using next
> for(i in 1:5){
+ if(i==3){
+ next
+ }
+ print(i)
+ 
+ #Invalid use of keywords 
+ if<-10
Error: unexpected assignment in:
"#Invalid use of keywords 
if<-"
> TRUE<-5
Error in TRUE <- 5 : invalid (do_set) left-hand side to assignment
> function<-"test"
Error: unexpected assignment in "function<-"
> #R operators and R Data 
> #Arithmetic Operators
> a<-10
> b<-3
> print(a+b)
[1] 13
> print(a-b)
[1] 7
> print(a*b)
[1] 30
> print(a/b)
[1] 3.333333
> print(a^b)
[1] 1000
> print(a%%b)
[1] 1
> print(a%/%b)
[1] 3
> #Relationsal Operators
> x<-5
> print(x==y)
[1] FALSE
> print(x!=y)
[1] TRUE
> print(x>y)
[1] FALSE
> print(x<y)
[1] TRUE
> print(x>=y)
[1] FALSE
> print(x<=y)
[1] TRUE
> #Logical Operator
> a<-TRUE
> b<-FALSE
> print(a&b)
[1] FALSE
> print(a|b)
[1] TRUE
> print(!a)
[1] FALSE
> print(a&&b)
[1] FALSE
> print(a||b)
[1] TRUE
> #Assignmnet operators
> 
> x<-10
> 20<-y
Error in 20 <- y : invalid (do_set) left-hand side to assignment
> z=30
> print(x)
[1] 10
> print(y)
[1] 20
> print(z)
[1] 30
> #Miscellaneous Operators
> seq<-1:5
> print(seq)
[1] 1 2 3 4 5
> print(3 %in% c(1,2,3))
[1] TRUE
> mat1<-matrix(1:4,nrow=2)
> mat2<-matrix(5:8,nrow=2)
> print(mat1 %*% mat2)
     [,1] [,2]
[1,]   23   31
[2,]   34   46
> #Basic Data Types
> num<-10.5
> int<-5L
> char<-"Hello"
> bool<-TRUE
> comp<-3+2i
> print(class(num))
[1] "numeric"
> print(class(int))
[1] "integer"
> print(class(char))
[1] "character"
> print(class(bool))
[1] "logical"
> print(class(comp))
[1] "complex"
> #Special DataTypes
> x<-NULL
> y<-NA
> z<-Inf
> w<-NaN
> print(x)
NULL
> print(y)
[1] NA
> print(z)
[1] Inf
> print(w)
[1] NaN
> #Composite Data Types
> 
> vec<-c91,2,3)
Error: unexpected ',' in "vec<-c91,"
> vec<- c(1,2,3)
> lst<-list(1,"a",TRUE)
> print(lst)
[[1]]
[1] 1

[[2]]
[1] "a"

[[3]]
[1] TRUE

> #Matrix
> mat<-matrix(1:4,nrow=2)
> print(mat)
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> #Data Frame
> df<-data.frame(name=c("Alice","Bob"),age=c(25,30))
> print(df)
   name age
1 Alice  25
2   Bob  30
> #Factor
> fac<-factor(c("A","B","A"))
> print(fac)
[1] A B A
Levels: A B
> #Create a simple unordered factor
> gender<-factor9c("Male","Female","Male","Female"))
Error: unexpected ')' in "gender<-factor9c("Male","Female","Male","Female"))"
> print(gender)
Error: object 'gender' not found
> gender<-factor(c("Male","Female","Male","Female"))
> #Specifying Levels
> grades<-factor(c("A","B","A","C","B","A","B","C"),levels=c("A","B","C","D"))
> print(grades)
[1] A B A C B A B C
Levels: A B C D
> #Improved Example: Survery Data 
> responses<-c("iPhone","Samsung","iPhone","Xiaomi","Samsung")
> all_brands<-c("iPhone","Samsung","Google","Xiaomi","Oneplus")
> phone_factor<-factor(responses,levels=all_brans)
Error: object 'all_brans' not found
>  phone_factor<-factor(responses,levels=all_brands)
> print(phone_factor)
[1] iPhone  Samsung iPhone  Xiaomi  Samsung
Levels: iPhone Samsung Google Xiaomi Oneplus
> table(phone_factor)
phone_factor
 iPhone Samsung  Google  Xiaomi Oneplus 
      2       2       0       1       0 
> #Ordered Factors
> temperature<-factor(
+ c("low","Medium","Low"),
+ levels=c("Low",'Medium","High"),
+ ordered=TRUE
+ )
+ print(temperature)
+ #Accessing levels
+ colors<-factor(c("Red","Blue","Green"))
+ print(levels(colors))
+ #Change levels
+ levels(colors)<-c("R","B","G")
+ print(colors)
+ #Change colors
+ 
+ 
+ f<-factor9c("Apple","banana","Apple"))
+ f<-factor(c("Apple","banana","Apple"))
+ print(as.character(f))
+ print(as.numeric(f))
+ 

+ > f<-factor(c("Apple","banana","Apple"))
> 
>  print(as.character(f))
[1] "Apple"  "banana" "Apple" 
> print(as.numeric(f))
[1] 1 2 1
> 
> #Adding/Removing Levels
> f<-factor(c("A","B","A","C"),levels=c("A","B","C","D"))
> f_new<-factor(f,levels=c("A","B"))
> print(f_new)
[1] A    B    A    <NA>
Levels: A B
> 
> #remove unused levels
> f_clean<-droplevels(f)
> print(f_clean)
[1] A B A C
Levels: A B C
> 
> #Statistical Modelling
> data<-data.frame(
+ yeild=c(10,15,12,20),
+ fertilizer=factor(c("A","B","A","B"))
+ )
> model<-lm(yeild~fertilizer,data=data)
> summary(model)

Call:
lm(formula = yeild ~ fertilizer, data = data)

Residuals:
   1    2    3    4 
-1.0 -2.5  1.0  2.5 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept)   11.000      1.904   5.777   0.0287 *
fertilizerB    6.500      2.693   2.414   0.1372  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.693 on 2 degrees of freedom
Multiple R-squared:  0.7445,    Adjusted R-squared:  0.6167 
F-statistic: 5.828 on 1 and 2 DF,  p-value: 0.1372

> #Reordering
> #Acciedentally Conveting Factors to Numbers
> f<-factor(c(10,20,10))
> as.numeric(f)
[1] 1 2 1
> as.numeric(as.character(f))
[1] 10 20 10
> 
> #Missing levels
> factor(data,levels=c("A","B","C"))
     yeild fertilizer 
      <NA>       <NA> 
Levels: A B C
> 
> #Unintended Alphabetical Order
> factor(data,levels=c("Low","Medium","High"))
     yeild fertilizer 
      <NA>       <NA> 
Levels: Low Medium High
> 
