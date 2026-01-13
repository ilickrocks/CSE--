%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kyungyun Kim, CSE - URP (2020272006), Week 1 assignment 1-2
% File Name: matrix_generation.m
%
% Program Description:
% This script generates two 4x4 matrices: A, B. 
% Matrix C is the product of A and B.
% Inverse Matrix of C will be derived by Gauss-Jordan Elimination.
% Caclulated inv C will be compared with inv(C) function.
% Return Identity Matrix by C * C_inv. 
% 
%
% Results Description:
% The output displays Identity Matrices and normalized error value
%
% Program Usage Instructions:
% The script is executed as follows:
% >> matrix_generation;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Generate matrix A and B (4x4) (using randi for integer)
A = randi(4,4);
B = randi(4,4);

% Generate matrix C with product of A and B
C = A*B;

% Generate inverse C
C_inv = inv(C);

% Verify C * inverse(C) equals identity matrix
I = C * C_inv;



%%% Using Gauss-Jordan Elimination Method to find C_inv

% Check if its inversible
if det(C) == 0
    disp("Matrix C is not inversible");
end

% making identity matrix for Gauss-Jordan Elimination method
I_4x4 = [1 0 0 0
 0 1 0 0 
 0 0 1 0
 0 0 0 1];

% Augmenting I_4x4 onto matrix C
C_GJ = [C I_4x4];


[m,n] = size(C_GJ);

    %%% Forward elimination
    for i = 1:m-1               % pivot row index (1 to 3)
        
        % Normalize the pivot row
        C_GJ(i,:) = C_GJ(i,:) / C_GJ(i,i);
        
        % Use pivot row to eliminate rows below
        for row = i+1:m
            k = C_GJ(row,i);
            C_GJ(row,:) = C_GJ(row,:) - k * C_GJ(i,:);
        end
    end
    
    % Normalize the last pivot (pivot = 4)
    C_GJ(m,:) = C_GJ(m,:) / C_GJ(m,m);


    %%% Backward elimination
    for j = m:-1:2           % pivot = 4,3,2
        for row = j-1:-1:1   % rows ABOVE pivot
            k = C_GJ(row,j);
            C_GJ(row,:) = C_GJ(row,:) - k * C_GJ(j,:);
        end
    end



% Extract C inverse

C_GJ_inv = zeros(4,4);

for k = 1:4
    for l = 1:4
        C_GJ_inv(k,l) = C_GJ(k,l+4);
    end
end

% Verify C * inverse(C) equals identity matrix
I_GJ = C * C_inv;

% Comparing identity matrices
disp("Identity Matrix by inv(C)")
disp(I)

disp("Identity Matrix by Gauss-Jordan Elimination")
disp(I_GJ)


% Norm of the error
Err = I - I_GJ;
err_norm = norm(Err);
disp("Error norm = ")
disp(err_norm)
