//
//  main.m
//  PrintNum
//
//  Created by Mi on 2018/4/5.
//  Copyright © 2018年 Mi. All rights reserved.
//

#import <Foundation/Foundation.h>

 void findNums(int originNums[],int length){
    
//     for (int i = 0; i < length; ++i)
//     {
//         printf("%d",originNums[i]);
//     }
//     return;
/****************************************冒泡排序***********************************************************/

//     for(int i = 0; i < length-1; i++){
//         for(int j = 0; j < length-1-i;j++){
//             if(originNums[j]<originNums[j+1]){
//                 int temp = originNums[j];
//                 originNums[j] = originNums[j+1];
//                 originNums[j+1] = temp;
//             }
//         }
//     }
//
//     printf("冒泡排序后的序列为：\n");
//
//     for(int i = 0; i < length; i++ ) {
//         printf("%d\n",originNums[i]);
//     }
/****************************************选择排序***********************************************************/
//     
//     for(int i = 0; i < length-1; i++){
//         int min = i;
//         for(int j = min+1; j < length;j++){
//             if(originNums[j]<originNums[min]){
//                 min = j;
//             }
//         }
//         //交换 min 和 i
//         if(min != i){
//             int temp = originNums[min];
//             originNums[min] = originNums[i];
//             originNums[i] = temp;
//         }
//     }
//     
//     printf("选择排序后的序列为：\n");
//     
//     for(int i = 0; i < length; i++ ) {
//         printf("%d\n",originNums[i]);
//     }
/****************************************插入排序***********************************************************/

     //假设第一个元素为有序的，所以从第二个元素开始
     for(int i = 1;i < length; i++){
         
         int j = i;
         int temp = originNums[i];
         
         while (j > 0 && originNums[j-1] > temp) {
             originNums[j] = originNums[j-1];
             j--;
         }
         
         originNums[j] = temp;
         
     }
     printf("插入排序后的序列为：\n");
     
     for(int i = 0; i < length; i++ ) {
         printf("%d\n",originNums[i]);
     }
     
     
     return;
     
    int start = 0,count=0,tempCount = 1,tempStart = 0;
    

    for(int i = 0; i < length-1;i++){
        
        if(originNums[i+1] - originNums[i] == 1){
            if(tempCount == 1 ){
                tempStart = i;
            }
            tempCount++;
            if(i == length-2){
                if (count < tempCount) {
                    count = tempCount;
                    start = tempStart;
                }
            }
        }else {

            if (count < tempCount) {
                count = tempCount;
                start = tempStart;
            }
            tempCount = 1;
        }
        
    }
    
     printf("连续最大的整数递增序列为：\n");

    for(int i = 0; i < count; i++ ) {
        printf("%d\n",originNums[start+i]);
//        Log.i("xx", originNums[start+i]+"");
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int nums[8] = {1,9,2,3,7,6,8,9,10};
        findNums(nums,8);
        
    }
    return 0;
}
