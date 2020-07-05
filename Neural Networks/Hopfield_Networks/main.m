clc, clear all

fprintf("1 PATTERN EMBEDDED:\n");
experiment('0');
experiment('+');
experiment('7');
fprintf("\nAs expected, networks are very successful in this case.\n\n\n\n");

fprintf("2 PATTERNS EMBEDDED:\n");
experiment('1', '9');
experiment('8', ':');
experiment('3', '8');
fprintf("\nNetworks are successful again.\n\n\n\n");

fprintf("3 PATTERNS EMBEDDED:\n");
experiment('+', '6', '7');
experiment('3', '5', '%');
experiment('3', '5', '8');
fprintf("\n'3' and '8' are harder to seperate.\n\n\n\n");

fprintf("4 PATTERNS EMBEDDED:\n");
experiment('1', '3', '9', 'x');
experiment('2', '5', '7', '+');
fprintf("\nMore noise brings worse results.\n");
experiment('2', '5', '8', '9');
fprintf("\nSeperating '8' and '9' is very hard for the network.\n\n\n\n");

fprintf("5 PATTERNS EMBEDDED:\n");
experiment('3', '4', '5', '7', ':');
experiment('x', '2', '3', '5', '8');
experiment('0', '7', '8', '-', 'x');
fprintf("\nThe network is overloaded with 5 patterns.\n\n\n\n");

fprintf("6 PATTERNS EMBEDDED:\n");
experiment('1', '2', '3', '4', '5', '6');
experiment('%', '=', '+', '-', 'x', ':');
experiment('+', '0', '3', '6', '9', '-');
fprintf("\nSome results are better than 5 pattern case because their patterns are distinct.\n\n\n\n");

fprintf("7 PATTERNS EMBEDDED:\n");
experiment('=', '3', '5', '7', '9', '-', ':');
experiment('=', '=', '5', '7', '9', '-', ':');
fprintf("\nIncreasing the weight of '=' in network resulted in great success.\n");
experiment('0', '7', '8', '-', 'x');
fprintf("\nThe network is not robust anymore.\n");

