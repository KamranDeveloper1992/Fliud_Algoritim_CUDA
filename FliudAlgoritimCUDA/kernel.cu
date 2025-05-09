#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>

__global__ void SimulationFliud(int sizeFluid, int rateFluid, int* status) {
    if (sizeFluid > 50 || rateFluid < 20) {
        *status = 1;  
    }
    else {
        *status = 0; 
    }
}
int main() {
    int result = -1;
    int* d_result;

    cudaMalloc((void**)&d_result, sizeof(int));


    SimulationFliud << <1, 1 >> > (100, 200, d_result);


    cudaFree(d_result);

    cudaDeviceReset();

    return 0;
}
