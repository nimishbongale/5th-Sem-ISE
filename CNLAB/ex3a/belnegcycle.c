#include <stdio.h>
#include <stdlib.h>

#define INFINITY 100

struct edge
{
    int src, dest, cost;
};

int main()
{
    int v, i, j, n, costMatrix[20][20], edgeCounter = 0;
    struct edge edges[50];

    printf("Enter the no. of vertices: ");
    scanf("%d", &n);

    printf("Enter the cost matrix: \n");
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
        {
            scanf("%d", &costMatrix[i][j]);
            if (i != j && costMatrix[i][j] != INFINITY)
            {
                edges[edgeCounter].src = i;
                edges[edgeCounter].dest = j;
                edges[edgeCounter].cost = costMatrix[i][j];
                edgeCounter++;
            }
        }

    int distance[20];
    printf("Enter source: ");
    scanf("%d", &v);
   
    for (i = 0; i < n; i++)
        if (i != v)
            distance[i] = INFINITY;
        else
            distance[i] = 0;

    for (i = 0; i < n - 1; i++)
        for (j = 0; j < edgeCounter; j++)
            if (distance[edges[j].src] + edges[j].cost < distance[edges[j].dest])
				    distance[edges[j].dest] = distance[edges[j].src] + edges[j].cost;
    	        
    
     for (i = 0; i < n - 1; i++)
        for (j = 0; j < edgeCounter; j++)
            if (distance[edges[j].src] + edges[j].cost < distance[edges[j].dest]){
            	printf("Negative Weight Edge cycle exists");
            	exit(0);
            }

    printf("The distances from source to all other nodes are:\n");
    for (i = 0; i < n; i++)
        printf("%d to %d costs %d\n", v, i + 1, distance[i]);

    return 0;
}
