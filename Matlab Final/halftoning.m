function [outputArg1] = halftoning(A,METHOD)
%HALFTONING Summary of this function goes here
%   Detailed explanation goes here
SIZE = size(A);
THRESHOLD = 128;
IMAGE = double(A);
TEMP = [zeros(SIZE(1),2),IMAGE,zeros(SIZE(1),2)];
TEMP = [TEMP;zeros(2,SIZE(2)+4)];

E_FS = [0,0,7 ; 3 5 1]/16;
E_J = [0 0 0 7 5; 3 5 7 5 3; 1 3 5 3 1]/48;
E_S = [0 0 0 8 4; 2 4 8 4 2; 1 2 4 2 1]/42;



for n = 1:SIZE(1)
    for m = 1:SIZE(2)
  
        if TEMP(n,m+2)>= THRESHOLD
            ERROR = TEMP(n,m+2)-255;
            TEMP(n,m+2) = 255;
            
        else
            ERROR = TEMP(n,m+2)-0;
            TEMP(n,m+2) = 0;
        end
        
        switch METHOD
            case 'FloydSteinburg'
                ERROR = ERROR*E_FS; %error matrix
                TEMP(n+1:n+2,m+1:m+3) = TEMP(n+1:n+2,m+1:m+3) + ERROR;
            case 'Jarvis'
                ERROR = ERROR*E_J; %error matrix
                TEMP(n:n+2,m:m+4) = TEMP(n:n+2,m:m+4) + ERROR;
            case 'Stucki'
                ERROR = ERROR*E_S; %error matrix
                TEMP(n:n+2,m:m+4) = TEMP(n:n+2,m:m+4) + ERROR;
        end
            
    end
    
    
    end

outputArg1 = TEMP(1:SIZE(1)-2,3:SIZE(2)-2);
end

