filename = 'Top73CourseList.xlsx' ;
Top73 = xlsread(filename);
[~,Top73Courses] = xlsread(filename, 'A:A');

filename2 = 'CommonCourseCombinations.xlsx';
CommonCourses = xlsread(filename2);
[~,CoursesTaken] = xlsread(filename2, 'N:N');
[~,StudentID] = xlsread(filename2, 'O:O');
StudentCourses = [StudentID,CoursesTaken];


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
C_all = {0};  %will hold all of the course pairs
index=1;  %Keeps track of where to put the new course pairs in C_all
for jj = 1:length(UniqueStudentID)
    a = {};
for ii = 1:size(StudentsTakenTop73,1)
        if strcmp(StudentsTakenTop73(ii,1),UniqueStudentID(jj,1)) == 1
                a{end+1} = StudentsTakenTop73{ii,2}; %Courses taken by student
        end
end
    %pairs up classes in a and puts them into C_one
    C_one = nchoosek(a,2); 
    rowcol=size(C_one);  %dimensions of the C_one matrix so can peel off the row count
    for kk = 1:rowcol(1)%Growing list of classes paired together per student
        C_all(index-1+kk,1) = C_one(kk,1);
        C_all(index-1+kk,2) = C_one(kk,2);
    end
    index=index+rowcol;  %Advances index by number of course pairs
end

filename3='TakenPairings.xlsx';
xlswrite(filename3,C_all)

   %%% Grabs each class a single student takes.  Lists them as pairs
   %%% using nchoosek and then put them into an expanding vector that lists
   %%% all of the combined courses for every student
%end


