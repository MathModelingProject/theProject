function find_conflicts(course_name,ExcelDoc)
%%%%% Obtains frequencies of course combinations and adds them to the
%%%%% "PairsofTop73Courses" document.

%file1='PairsofTop73Courses.xlsx';
%TopPairs=xlsread(file1); 
TopPairs=ExcelDoc;  %Couldn't get read command to work, so hand-imported
dimTopP=size(TopPairs);
TopPairsName=string(TopPairs(:,1:2));
TopPairsFreq=cell2mat(TopPairs(:,3));

index=1;
conflict_list=strings(72,1);  %will store frequency of pairings

for ii = 1:dimTopP(1)
    
        if TopPairsName(ii,1)== course_name && TopPairsFreq(ii)> 1
            conflict_list(index)=TopPairsName(ii,2);
        %1st class in pair
        elseif TopPairsName(ii,2)== course_name && TopPairsFreq(ii)> 1
           conflict_list(index)=TopPairsName(ii,1);
           %2nd class in pair
        end %if statements
            
    index=index+1;    
end %ii for loop

conflict_list=rmmissing(conflict_list);

conflict_list
file2="Course_Conflict_List.xlsx";
%xlswrite(file2,conflict_list);


end