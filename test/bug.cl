// RUN: %clang_cc1 -triple spir -O0 -cl-std=cl2.0 -finclude-default-header %s -emit-llvm-bc -o %t.bc
// RUN: llvm-spirv %t.bc -o %t.spv
// RUN: spirv-val %t.spv

struct Node {
    __global struct Node* next;
};

__kernel void linked_lists(__global struct Node* node)
{
    node = node->next;
}
