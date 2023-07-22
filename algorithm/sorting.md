# Sorting
## Selection Sort
### Pesudo Code
```cpp
selectionSort(A[], n){
    for last <- n downto 2{
        A[1 ... last] 중 가장 큰 수 A[k]를 찾는다;
        A[k] <-> A[last];
    }
}
```

## Bubble Sort
### Pesudo Code
```cpp
buubleSort(A[], n){
    for last <- n downto 2
        for i<-1 to last-1
            if(A[i] > A[i+1]) then A[i] <-> A[i+1]
}
```

## Insertion Sort
### Pesudo Code
```cpp
insertionSort(A[], n){
    for i <- 2 to n
        A[1 ... i]의 적합한 자리에 A[i]를 삽입한다.
}
```

## Merge Sort
### Pesudo Code
```cpp
mergeSort(A[], p, r){
    if (p < r) then{
        q <- (p+r)/2;           // p, r의 중간 지점 계산
        mergeSort(A, p, q);     // 전반부 정렬
        mergeSort(A, q+1, r);   // 후반부 정렬
        merge(A, p, q, r);      // 병합
    }
}

merge(A[], p, q, r){
    정렬되어있는 두 배열 A[p ... q]와 A[q ... r]을 합쳐
    정렬된 하나의 배열 A[p ... r]을 만든다.
}
```
```cpp
merge(A[], p, q, r){
    i <- p; j <- q+1; t <- 1;
    while(i <= q and j <= r){
        if(A[i] <= A[j])
        then tmp[t++] <- A[i++];
        else tmp[t++] <- A[j++];
    }
    while(i <= q)   // 왼쪽부분 배열이 남은 경우
        tmp[t++] <- A[i++];
    while(j <= r)   // 오른쪽부분 배열이 남은 경우
        tmp[t++] <- A[j++];
    i <- p; t <- 1;
    while(i <= r)   // 결과를 A[p ... r]에 저장
        A[i++] <- tmp[t++];
}
```

## Quick Sort
### Pesudo Code
```cpp
quickSort(A[], p, r){
    if(p < r) then {
        q <- partition(A, p, r);    // 분할
        quickSort(A, p, q-1);       // 왼쪽 부분 배열 정렬
        quickSort(A, q+1, r);       // 오른쪽 부분 배열 정렬
    }
}

partition(A[], p, r){
    배열 A[p...r]의 원소들을 A[r] 기준으로 양쪽으로 재배치하고
    A[r]이 자리한 위치를 리턴한다;
}
```

```cpp
partition(A[], p, r){
    x <- A[r];          // 기준원소
    i <- p-1;           // i는 1구역의 끝지점
    for j<-p to r-1     // j는 3구역의 시작지점
        if(A[j] <= x) then A[++i] <-> A[j];     // 의미는 i값 증가 후 A[i] <-> A[j] 교환
    A[i+1] <-> A[r];    // 기준원소와 2구역 첫 원소 교환
    return i+1;
}
```

## Heap Sort
### Pesudo Code
```cpp
heapSort(A, n){
    buildHeap(A, n);
    for i <- n downto 2 {
        A[1] <-> A[i];
        heapify(A, 1, i-1);
    }
}
```

```cpp
buildHeap(A[], n){
    for i <- (n/2) downto 1
        heapify(A, i, n);
}

heapify(A[], k, n){
// A[k]를 루트로 하는 트리를 힙성질을 만족하도록 수선한다.
// A[k]의 두 자식을 루트로 하는 서브 트리는 힙성질을 만족하고 있다.
// n은 최대 인덱스(전체 배열의 크기)
    left <- 2k; right <- 2k+1;
    // 작은 자식 고르기. smaller: A[2k]와 A[2k+1] 중에 작은 원소
    if(right <= n) then{    // k가 두 자식을 가지는 경우
        if(A[left] < A[right])  then smaller <- left;
                                else smaller <- right;
    }
    else if (left <= n) then smaller <- left;   // k의 왼쪽 자식만 있는 경우
    else return;    //A[k]가 리프 노드임. 끝남.
    //재귀적 조정
    if(A[smaller] < A[k]) then{
        A[k] <-> A[smaller];
        heapify(a, smaller, n);
    }
}
```

## Radix Sort
### Pesudo Code
```cpp
radixSort(A[], n, k){
//원소들이 각각 최대 k 자릿수인 A[1 ... n]을 정렬한다.
//가장 낮은 자릿수를 1번째 자릿수라 한다.
    for i <- 1 to k
        i번째 자릿수에 대해 A[1 ... n]을 안정성을 유지하면서 정렬한다.
}
```

## Counting Sort
### Pesudo Code
```cpp
countingSort(A[], B[], n){
// A[]: 입력 배열, B[]: 배열 A[]를 정렬한 결과
    for i <- 1 to k
        C[i] <- 0;
    for j <- 1 to n
        C[A[j]]++;
    // 이 시점에서 C[i]: 값이 i인 원소의 총수
    for i <- 2 to k
        C[i] <- C[i] + C[i-1];
    // 이 시점에서 C[i]: i보다 작거나 같은 원소의 총수
    for j <- n downto 1{
        B[C[A[j]]] <- A[j];
        C[A[j]]--;
    }
}
```

## Complexity

Algorithm | Worst Case | Average Case
---|---|---
Selection Sort | $n^2$ | $n^2$
Bubble Sort | $n^2$ | $n^2$
Insertion Sort | $n^2$ | $n^2$
Mergesort | $nlogn$ | $nlogn$ 
Quicksort | $n^2$ | $nlogn$
Counting Sort | $n$ | $n$
Radix Sort | $n$ | $n$
Heapsort | $nlogn$ | $nlogn$