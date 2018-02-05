//
//  PrintBinaryTreeTopToBottom.c
//  DataStructDemo
//
//  Created by Mi on 2018/1/17.
//  Copyright © 2018年 iwming. All rights reserved.
//

#include "PrintBinaryTreeTopToBottom.h"


struct BinaryTreeNode {
    int  m_nValue;
    struct BinaryTreeNode *m_pLeft;
    struct BinaryTreeNode *m_pRight;
};


/*
 *       8
 *    /    \
 *   6     10
 *  /  \   / \
 * 5   7  9  11
 从上往下分层打印 8 6 10 5 7 9 11
 思路：1、取根结点加入队列，
      2、while循环依次吐出结点，并同时将该结点的左子结点、右子结点加入到队列中，直到队列全部吐完。
 */

//void PrintBinaryTreeFromTopToBottom(struct BinaryTreeNode *root)
//{
//
//    int queue[100] = {1,2,3};
//    for(int i = 0; i < 5; i++){
//        printf("%d",queue[i]);
//    }
//
//    Queue<BinaryTreeNode *> queue;//创建一个队列
//    queue.push_back(root);//加入根结点
//
//    while(sizeof(queue)){
//        BinaryTreeNode *node = queue.front();//读出第一个结点
//        queue.pop_front();//弹出
//        printf("%d",node->m_nValue);
//        if(node->m_pLeft){
//            queue.push_back(node->m_pLeft);
//        }
//        if(node->m_pRight){
//            queue.push_back(node->m_pRight);
//        }
//    }
//}

