extern "C"
#include <math.h>
__global__ void softmax_strided_double(int n,int xOffset, double *dx,int incx,double max,double sum,double *result) {
        for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
                          if(i >= xOffset &&  i % incx == 0)
                                result[i] = exp(dx[i] - max) / sum;
             }

 }


