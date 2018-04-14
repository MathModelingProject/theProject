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
UniqueStudentID = unique(StudentsTakenTop73(:,1));

for jj = 1:length(UniqueStudentID)
    a = {};
for ii = 1:size(StudentsTakenTop73,1)
        if strcmp(StudentsTakenTop73(ii,1),UniqueStudentID(jj,1)) == 1
                a{end+1} = StudentsTakenTop73(ii,2);
        end
end
    % do something with a -- put it somewhere
    b{jj,1} = UniqueStudentID(jj);
    b{jj,2} = a;
end


   %%% Grabs each class a single student takes.  Will list them as pairs
   %%% using nchoosek and then put them into an expanding vector that lists
   %%% all of the combined courses for every student
%end


% need vector for each student listng the courses they took
% n choose k to list them as pairs
