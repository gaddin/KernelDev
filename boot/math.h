#ifndef MATH_H 
#define MATH_H

inline int pow(int base, int exponent) {
    int power;

    for(int i = 0; i <= exponent, i++) {
        power *= base;
    }

    return power; 
}

inline int fact(int num) {
    
    int product;
    int num_size = num - 1;
    for(int i = 0; i <= num_size; i++) {
        product = num * (num--);
    }
    return product;
}
#endif /*MATH_H*/
