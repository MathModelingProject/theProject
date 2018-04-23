%%%%% Obtains frequencies of course combinations and adds them to the
%%%%% "PairsofTop73Courses" document.
file1='PairsofTop73Courses.xlsx';
%TopPairs=xlsread(file1); 
TopPairs=PairsofTop73Courses1;  %Couldn't get read command to work, so hand-imported
dimTopP=size(TopPairs);

file2='TakenPairings.xlsx';
%TakenPairs=xlsread(file2);
TakenPairs=TakenPairings;  %Couldn't get read command to work, so hand-imported
dimTaP=size(TakenPairs);

freqlist=zeros(dimTopP(1),1);  %will store frequency of pairings

for ii = 1:dimTopP(1)
    for jj = 1:dimTaP(1)
        if TopPairs(ii,1)== TakenPairs(jj,1) || TopPairs(ii,1)==TakenPairs(jj,2)
            if TopPairs(ii,2)== TakenPairs(jj,1) || TopPairs(ii,2)==TakenPairs(jj,2)
                freqlist(ii)=freqlist(ii)+1; %Records the existence of a match
            end %if statement 2nd class in pair
        end %if statement 1st class in pair
    end %jj for loop
    freqlist(ii)=freqlist(ii)*100/dimTopP(1); %Turns the match count into a frequency
end %ii for loop

xlswrite(file1,freqlist,'Sheet1','C1');
