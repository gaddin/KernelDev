#ifndef MATH_H 
#define MATH_H

inline int pow(int base, int exponent) {
    int power;

    for(int i = 0; i <= exponent, i++) {
        power *= base;
    }

    return power; 
}


#endif /*MATH_H*/
