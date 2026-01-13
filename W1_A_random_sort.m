%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kyungyun Kim, CSE - URP (2020272006), Week 1 assignment 1-1
% File Name: A_random_sort.m
%
% Program Description:
% This script generates 100 random numbers using the random function
% and sorts them in ascending order.
%
% Results Description:
% The output displays the first five elements of the sorted list.
%
% Program Usage Instructions:
% The script is executed as follows:
% >> A_random_sort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate 100 random numbers
A = rand(100,1);

% Sort the numbers in ascending order
A_sorted = sort(A);

% Display the first five elements of the sorted list
disp('First five numbers, sorted:');
disp(A_sorted(1:5));
