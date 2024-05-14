// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.


#include <stdio.h>
#include <stdlib.h>
#define R1 4
#define C1 8
#define R2 8
#define C2 4

//int main()
//{
//printf("Hello World!!!!!\n");
//return 0;
//}

int input_stimuli[] = {99, 67, 12, 17, 120, 121, 73, 8, 30, 45, 104, 2, 5, 21, 82, 93, 82, 57, 69, 38, 95, 24, 87, 23, 47, 79, 99, 10, 118, 99, 62, 55, 57, 39, 65, 65, 97, 104, 32, 103, 68, 45, 119, 111, 70, 79, 75, 26, 38, 60, 29, 107, 25, 29, 22, 29, 55, 40, 117, 55, 23, 115, 124, 56, 14, 33, 52, 76, 33, 77, 90, 28, 15, 38, 40, 54, 64, 11, 33, 102, 4, 118, 93, 62, 73, 30, 58, 122, 69, 66, 29, 62, 79, 86, 50, 47, 125, 5, 112, 116, 101, 13, 33, 43, 86, 17, 92, 14, 83, 63, 99, 91, 115, 113, 42, 89, 25, 4, 94, 64, 61, 115, 83, 77, 77, 109, 102, 73, 23, 30, 113, 4, 62, 21, 124, 91, 64, 60, 8, 87, 5, 9, 66, 12, 104, 104, 92, 19, 84, 66, 124, 82, 102, 58, 55, 105, 11, 17};

int rom_coeff [] = {3, 22, 11, 1, 8, 3, 1, 2, 
                    8, 15, 2, 4, 12, 6, 1, 2, 
                    18, 40, 3, 2, 16, 9, 1, 2, 
                    1, 10, 4, 0, 2, 12, 1, 2};
                    
void matrixmultiplication(int input_stimuli[], int rom_coeff[], int start_index)
{
    int input_matrix [R1][C2];
    int coeff_matrix [R2][C2];
    int z = start_index;
    int x = 0;
    int sum;
    
    printf("Resultant Matrix is:\n");
    for (int i = 0; i< 8; i++){
        for(int j = 0; j < 4 ; j++ ){
            input_matrix[j][i] = input_stimuli[z];
            z ++;
        }
    }
   for (int i = 0; i< 4; i++){
        for(int j = 0; j < 8 ; j++ ){
            coeff_matrix[j][i] = rom_coeff[x];
            x ++;
        }
    }
    
    for (int i = 0; i < C2; i++){       
		for (int j = 0; j < R1; j++){                 
		     sum = 0;
		     for (int k = 0; k < C1; k++){
		         sum += input_matrix[i][k] * coeff_matrix[k][j];
		     }
		     printf("%d\t", sum);
		}
		printf("\n");
	}

    return;
    
}


int main()
{
    
    for (int y = 0; y < 5; y++) {
        int start_index = 32 * y;
        matrixmultiplication(input_stimuli, rom_coeff, start_index);
    }

    return 0;
}
