function [real3,imag3]=complex_multiply(real1,imag1,real2,imag2)

    real3=real1*real2 - imag1*imag2;
    imag3=real1*imag2 + real2*imag1;

end