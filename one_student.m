function name_of_classes = one_student(NameOfMajor)
%Inner function 1 student in one time step
%NameOfMajor string with major for this student

econ = strcmpi(NameOfMajor, 'Econ');
business = strcmpi(NameOfMajor , 'Business');

myRand = rand();
Rand = randi([0,2],1,1);
randomThree = randi([2, 3], 1, 1);
numClassesTaken = 0;
name_of_classes = string(zeros(1));

if econ == 1
        if myRand >= .5
            numClassesTaken = 2;
            name_of_classes = major(NameOfMajor);
         
        else
            numClassesTaken = 1;
            m = major(NameOfMajor);
            name_of_classes = m(1,1);
        end %Ends if statement for myRand
        % randomly choose a number from the matrix
elseif business == 1
        if Rand == 2
            numClassesTaken = 3;
            name_of_classes = major(NameOfMajor);
        elseif Rand == 1
            numClassesTaken = 2;
            m = major(NameOfMajor);
            name_of_classes = [m(1,1),m(1,randomThree)];
        else 
            numClassesTaken = 1;
            m = major(NameOfMajor);
            name_of_classes = m(1,1);
        end %End of if statement for Rand
        
            
end

% student_info_vector = [NameOfMajor ; numClassesTaken];

end