learningRate = 0.001;

w1 = randn(2, 20);
m1 = max(max(abs(w1)));

w1 = w1 / m1;
b1 = randn(1, 1);

w2 = randn(20, 5);
m2 = max(max(abs(w2)));

w2 = w2 / m2;
b2 = randn(1, 1);

f = fopen('train.csv', 'r');

epochs = 1:1:50;
y = zeros(1, 50);

for j = epochs

    startt = time();

    for i = 1:1:50000

        [h, w, n1, n2, n3, n4, n5] = fscanf(f, '%f,%f,%i,%i,%i,%i,%i\n', "C");
        x = [h, w];
        expected = [n1, n2, n3, n4, n5];

        z1 = (x * w1) + b1;

        a1 = sig(z1);

        z2 = a1 * w2;

        a2 = sig(z2);

        err = 1/5 * sum((expected - a2).^2);
        y(j) = err;

        dC = (a2 - expected);
        da2 = a2 .* (1 - a2);

        deltaL_2 = dC .* da2;
        dw2 = a1' * deltaL_2;

        deltaL_1 = deltaL_2 * w2' .* (a1 .* (1 - a1));
        dw1 = x' * deltaL_1;

        db1 = sum(deltaL_1);
        db2 = sum(deltaL_2);

        w1 = w1 - learningRate * dw1;
        w2 = w2 - learningRate * dw2;
        b1 = b1 - learningRate * db1;
        b2 = b2 - learningRate * db2;

    endfor

    endt = time();

    printf("EPOCH: %i\nError: %f\n", j, err);
    printf("Time: %f\n---\n", endt - startt);
    frewind(f);

    plot(epochs, y);
    title("Neural Network error over epochs")
    xlabel("Epochs");
    ylabel("Error");

endfor

fclose(f);

printf("DONE\n");
