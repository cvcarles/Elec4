// Copyright none

#include <eigen/Eigen/Dense>
#include <iostream>
#include <vector>
#include "Spline.hpp"

int main() {
    std::vector<double> xs{ 0., 0.16, 0.42, 0.6425, 0.8575};
    std::vector<double> ys{100., 183., 235., 40., 15.};
    Spline spline1(xs, ys);
    for (double x = 0.0 ; x <= 1.0 ; x += 0.1) {
        std::cout << "Value for " << x
                  << " is " << spline1.get_value(x)
                  << std::endl;
    }
}
