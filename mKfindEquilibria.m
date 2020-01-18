function [equilibria, symbolic] = mKfindEquilibria(xdot)
% This function finds all the equilibria for the (non)linear system in the
% input array xdot, where xdot is the state space representation of the
% system.
%
% Input: xdot (nx1) is the state space representation of the system using
% symbolic variables.
% Output: The output is an nxm vector representing the equilibria in each
% column as a seperate equilibrium returned as doubles
% , where m is the amount of found equilibria.

    %% Check whether xdot is [n,1].
    if length(xdot(1,:)) ~= 1
        error('xdot is not an nx1 matrix')
    end

    %% Create the equation array.
    eqn = [];
    for i = 1:length(xdot)
        eqn = [eqn; xdot(i) == 0];
    end
    
    %% Solve the equations.
    solutions = solve(eqn, 'ReturnConditions', true);
    variables = fieldnames(solutions);
    first_variable = variables{1};
    
    symbolic = false;
    for i = 1:length(xdot)
        try
            column = double(solutions.(variables{i}));
        catch
            column = solutions.(variables{i});
            symbolic = true;
        end
        equilibria(i,:) = column;
        if symbolic == true
            equilibria = sym(equilibria);
        end
    end
end