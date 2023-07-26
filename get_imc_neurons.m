function x = get_imc_neurons(imc)
    x = zeros(1, 5);
    idx = 0;

    if imc < 18.5
        idx = 1;
    elseif imc >= 18.5 && imc <= 24.9
        idx = 2;
    elseif imc >= 25 && imc <= 29.9
        idx = 3;
    elseif imc >= 30 && imc <= 39.9
        idx = 4;
    else
        idx = 5;
    endif

    x(idx) = 1;

endfunction
