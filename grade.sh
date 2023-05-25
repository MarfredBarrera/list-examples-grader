CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


path="student-submission/ListExamples.java";

if [[ -f "$path" ]];
then
    echo "ListExamples.java found"
else
    echo "ListExamples.java not found. Here are the files we see: "
    ls student-submission
    exit
fi

to_path="grading-area"
cp -r "$path" "TestListExamples.java" "lib" "$to_path"
cd grading-area
javac -cp $CPATH *.java

if [[ $? = 1 ]]; 
then
    echo "Compile failed! See above for error message"
    exit
else
    echo "Compiled successfully!"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
