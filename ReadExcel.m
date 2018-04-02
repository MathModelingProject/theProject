filename = 'Top73CourseList.xlsx' ;
Top73 = xlsread(filename);
[~,Top73Courses] = xlsread(filename, 'A:A');

filename2 = 'CommonCourseCombinations.xlsx';
CommonCourses = xlsread(filename2);
[~,CoursesTaken] = xlsread(filename2, 'N:N');
[~,StudentID] = xlsread(filename2, 'O:O');
StudentCourses = [StudentID,CoursesTaken]


StudentsTakenTop73 = string([]);
for ii = 1:size(StudentCourses,1)
    for jj = 1:size(Top73Courses,1)
        if (ismember(Top73Courses(jj,1), StudentCourses(ii,2)))
        StudentsTakenTop73(ii,:)= StudentCourses(ii,:);
        end %if statement
    end %jj iteration
end %ii iteration

StudentsTakenTop73 = rmmissing(StudentsTakenTop73); %deletes <missing> rows

% need vector for each student listng the courses they took
% n choose k to list them as pairs

%StudentID = Zeros(1,2);
UniqueStudentID = unique(StudentsTakenTop73(:,1));

UniqueStudentClasses = Zeros(length(UniqueStudentID), 6)

for ii = 1:length(UniqueStudentID)
    for jj = 1:length(StudentsTakenTop73)
        while UniqueStudentClasses(ii) == StudentsTakenTop73(jj,1)
            UniqueStudentClasses =


    UniqueStudnetClasses(ii,:) =


end
