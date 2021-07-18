#include <iostream>

using namespace std;

bool search(int[], const int, int);
int position(int[], const int, int);
int count(int[], const int, int);

int main()
{
    cout << "Exercise 5" << endl << endl;
  
    int v[] = {1,0,3,0,5,0,5,4,3,0,0};
  
    cout << "search({1,2,3,4,5,6,5,4,3,2,1},11,7) = " << search(v,11,7) << endl;
    cout << "search({1,2,3,4,5,6,5,4,3,2,1},11,2) = " << search(v,11,2) << endl;
  
    cout << "position({1,2,3,4,5,6,5,4,3,2,1},11,7) = " << position(v,11,7) << endl;
    cout << "position({1,2,3,4,5,6,5,4,3,2,1},11,2) = " << position(v,11,2) << endl;
    
    cout << "count({1,2,3,4,5,6,5,4,3,2,1},11,7) = " << count(v,11,0) << endl;
    cout << "count({1,2,3,4,5,6,5,4,3,2,1},11,2) = " << count(v,11,2) << endl;
  
    cout << "------------------------------------------------------------" << endl;
}

bool search(int v[], const int TAMVECTOR, int n)
{
    bool encontrado= false;//Variable booleano que indica si hemos encontrado n
    int i;
    
    for(i=0; i<TAMVECTOR; i++)//Bucle para recorrer el vector
    {
        if(v[i]==n)//Condición que indica si ha encontrado n
        {
            encontrado= true;
        }
    }
    return encontrado;
}

int position(int v[], const int TAMVECTOR, int n)
{
    int i;//Variable para poder recorrer el vector
    int posicion;//Variable que guarda la posición de n
    bool encontrado= false;//Variable booleana que nos indica si lo hemos encontrado el valor n
    
    for(i=0; i<TAMVECTOR; i++)//Bucle para recorrer el vector
    {
        if(v[i]==n)//Condición que encuentra n en el vector v
        {
            encontrado= true;
            if(posicion>i)//Condición para poder obtener la primera posición de n en el vector
                posicion=i;
        }
    }
    if(encontrado==false)//En caso de no existir n en el vector, le dará valor -1 a posicion
        posicion=-1;
    
    return posicion;
}

int count(int v[], const int TAMVECTOR, int n)
{
    int i;
    int contador=0;//Variable que cuenta el número de veces que encuentra n
    
    for(i=0; i<TAMVECTOR; i++)//Bucle que se encarga de recorrer el vector
    {
        if(v[i]==n)//Condición que encuentra el valor n
        {
            contador++;//Aumenta el valor de contador si encuentra n
        }
    }
    return contador;
}