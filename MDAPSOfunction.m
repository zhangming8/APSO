% use the functions in paper: A novel stability-based adaptive inertia weight for particle swarm optimization
% the minimum of all functions are shifted to 0  ---by: MingZhang
function y=MDAPSOfunction(xx,num)
    global M 
    global initial_flag
    d=length(xx);
    switch num
        case 1
            %% 1 sphere
                sum = 0;
                for ii = 1:d
                    xi = xx(ii);
                    sum = sum + xi^2;
                end
                y = sum;
        case 2
            %% 2 Rotated hyper-ellipsoid
            outer = 0;
            for ii = 1:d
                inner = 0;
                for jj = 1:ii
                    xj = xx(jj);
                    inner = inner + xj^2;
                end
                outer = outer + inner;
            end
            y = outer;
        case 3
            %% 3 step
            sum = 0;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + (xi+0.5)^2;
            end
            y = sum; 
        case 4
            %% 4 Branin
            x1 = xx(1);
            x2 = xx(2);
            t = 1 / (8*pi);
            s = 10;
            r = 6;
            c = 5/pi;
            b = 5.1 / (4*pi^2);
            term1 = (x2 - b*x1^2 + c*x1 - r)^2;
            term2 = s*(1-t)*cos(x1);
            y = term1 + term2 + s - 5/(4*3.14159);
        case 5
            %% 5 Rosenbrock
            sum = 0;
            for ii = 1:(d-1)
                xi = xx(ii);
                xnext = xx(ii+1);
                new = 100*(xnext-xi^2)^2 + (xi-1)^2;
                sum = sum + new;
            end
            y = sum;
        case 6
            %% 6 McCormick
            x1 = xx(1);
            x2 = xx(2);
            term1 = sin(x1 + x2);
            term2 = (x1 - x2)^2;
            term3 = -1.5*x1;
            term4 = 2.5*x2;
            y = term1 + term2 + term3 + term4 + 1 + 1.9133; 
        case 7
            %% 7 Beale
            x1 = xx(1);
            x2 = xx(2);
            term1 = (1.5 - x1 + x1*x2)^2;
            term2 = (2.25 - x1 + x1*x2^2)^2;
            term3 = (2.625 - x1 + x1*x2^3)^2;
            y = term1 + term2 + term3;
        case 8
            %% 8 Bukin N.6
            x1 = xx(1);
            x2 = xx(2);
            term1 = 100 * sqrt(abs(x2 - 0.01*x1^2));
            term2 = 0.01 * abs(x1+10);
            y = term1 + term2;
        case 9
            %% 9 Schwefel
            sum = 0;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + xi*sin(sqrt(abs(xi)));
            end
            y = - sum;
            y = y + d*418.982;
        case 10
            %% 10 Rastrigin
            sum = 0;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + (xi^2 - 10*cos(2*pi*xi));
            end
            y = 10*d + sum;
        case 11
            %% 11 Noncontinuois Rastrigin
            y = 0;
            x=xx;
            for i=1:d
                if abs(x(i)) < 0.5
                    z(i)=x(i);
                else
                    z(i)=0.5*round(x(i));
                end
                y = y + z(i)^2-10*cos(2*pi*z(i)) + 10;
            end
        case 12
            %% 12 Ackley
            sum1 = 0;
            sum2 = 0;
            c = 2*pi;
            b = 0.2;
            a = 20;
            for ii = 1:d
                xi = xx(ii);
                sum1 = sum1 + xi^2;
                sum2 = sum2 + cos(c*xi);
            end
            term1 = -a * exp(-b*sqrt(sum1/d));
            term2 = -exp(sum2/d);
            y = term1 + term2 + a + exp(1);
        case 13
            %% 13 Griewank
            sum = 0;
            prod = 1;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + xi^2/4000;
                prod = prod * cos(xi/sqrt(ii));
            end
            y = sum - prod + 1;
        case 14
            %% 14 Levy
            for ii = 1:d
                w(ii) = 1 + (xx(ii) - 1)/4;
            end
            term1 = (sin(pi*w(1)))^2;
            term3 = (w(d)-1)^2 * (1+(sin(2*pi*w(d)))^2);
            sum = 0;
            for ii = 1:(d-1)
                wi = w(ii);
                    new = (wi-1)^2 * (1+10*(sin(pi*wi+1))^2);
                sum = sum + new;
            end
            y = term1 + sum + term3;
        case 15
            %% 15 Shubert
            x1 = xx(1);
            x2 = xx(2);
            sum1 = 0;
            sum2 = 0;
            for ii = 1:5
                new1 = ii * cos((ii+1)*x1+ii);
                new2 = ii * cos((ii+1)*x2+ii);
                sum1 = sum1 + new1;
                sum2 = sum2 + new2;
            end
            y = sum1 * sum2 + 186.7309;
        case 16
            %% 16 Rotated Schwefel
            y=M*(xx.'); 
            y=y.';
            xx=y;
            sum = 0;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + xi*sin(sqrt(abs(xi)));
            end
            y = - sum;
            y = y + d*418.982;
        case 17
            %% 17 Rotated Rastrigin
            y=M*(xx.');  % xx��һ����������
            y=y.';
            xx=y;
            sum = 0;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + (xi^2 - 10*cos(2*pi*xi));
            end
            y = 10*d + sum;
        case 18
            %% 18 Rotated Noncontinuois-Rastrigin
            y=M*(xx.'); 
            y=y.';
            x=y; 
            y = 0;
            for i=1:d
                if abs(x(i)) < 0.5
                    z(i)=x(i);
                else
                    z(i)=0.5*round(x(i));
                end
                y = y + z(i)^2-10*cos(2*pi*z(i)) + 10;
            end
        case 19
            %% 19 Rotated Ackley
            y=M*(xx.'); 
            y=y.';
            xx=y;
            sum1 = 0;
            sum2 = 0;
            c = 2*pi;
            b = 0.2;
            a = 20;
            for ii = 1:d
                xi = xx(ii);
                sum1 = sum1 + xi^2;
                sum2 = sum2 + cos(c*xi);
            end
            term1 = -a * exp(-b*sqrt(sum1/d));
            term2 = -exp(sum2/d);
            y = term1 + term2 + a + exp(1);
        case 20 
            %% 20 Rotated Griewank
            y=M*(xx.'); 
            y=y.';
            xx=y;
            sum = 0;
            prod = 1;
            for ii = 1:d
                xi = xx(ii);
                sum = sum + xi^2/4000;
                prod = prod * cos(xi/sqrt(ii));
            end
            y = sum - prod + 1;
        case 21
            y = SIS_novel_func(xx,1); %CF1
        case 22
            y = SIS_novel_func(xx,6); %CF6
        otherwise
            disp warning:func_num=1-22
    end

            