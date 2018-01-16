//
//  main.m
//  MemoryDo
//
//  Created by Mi on 2018/1/3.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


void BubbleSort(int a[], int size)
{
    //需要排几趟
    for(int i = 0; i < size-1; i++){
        //每一趟比较到第几趟之前结束
        for(int j = 0; j < size-1-i; j++){
            if(a[j] < a[j+1]){
                int tmp = a[j];
                a[j] = a[j+1];;
                a[j+1] = tmp;
            }
        }
    }
    for(int i = 0; i < size; i++){
        printf("bubble%d\n",a[i]);
    }
}

void SelectionSort(int a[], int size)
{
    for(int i = 0; i < size-1; i++){
        int tmpMin = i;
        for(int j = i+1; j < size; j++){
            if(a[j] > a[tmpMin]){
                tmpMin = j;
            }
        }
        int tmp = a[i];
        a[i] = a[tmpMin];
        a[tmpMin] = tmp;
    }
    
    for(int i = 0; i < size; i++){
        printf("sort%d\n",a[i]);
    }
}

void InsertSort(int a[], int size)
{
    for(int i = 1; i < size; i++){
        for(int j = 0; j < i ; j++){
            if(a[j] < a[i]){
                int tmp = a[i];
                for(int k = i; k > j; k--){
                    a[k] = a[k-1];
                }
                a[j] = tmp;
                break;
            }
        }
    }
    for(int i = 0; i < size; i++){
        printf("insert%d\n",a[i]);
    }
}



int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int a[] = {1,9,4,2,7,3,6};
        BubbleSort(a, 7);
        
        SelectionSort(a,7);
        
        InsertSort(a, 7);
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
