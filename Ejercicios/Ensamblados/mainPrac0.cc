// Assignment 0: Basic concepts

#include <iostream>
#include <stdlib.h>
#include <string.h>

using namespace std;

typedef struct
{
    int number;
    string name;
    double mark;
    string obs;
    
}Student;

bool multiple(int,int);
int printN(int);
int firstPrimes(int);
void Goldbach(int,int &,int &);
bool search(int [],const int,int);
int position(int [],const int,int);
int count(int [],const int,int);
int minOdds(int [],const int);
int posMaxMultFive(int v[],const int);
void extractStudentData(char []);

int main()
{
  // Exercise 1
  cout << "Exercise 1" << endl << endl;
  
  cout << "multiple(15,3) = " << multiple(15,3) << endl;
  cout << "multiple(17,5) = " << multiple(17,5) << endl;
  cout << "multiple(5,76) = " << multiple(5,76) << endl;
  cout << "multiple(12,72) = " << multiple(12,72) << endl;

  cout << "-----------------------------------------------------------" << endl;

  // Exercise 2
  cout << "Exercise 2" << endl << endl;
  
  int nAsteriscs = 0;

  nAsteriscs = printN(1);
  cout << "printN(1) = " << nAsteriscs << endl;
  nAsteriscs = printN(4);
  cout << "printN(4) = " << nAsteriscs << endl;
  nAsteriscs = printN(6);
  cout << "printN(6) = " << nAsteriscs << endl;

  cout << "-----------------------------------------------------------" << endl;

  // Exercise 3
  cout << "Exercise 3" << endl << endl;
  
  int sum = 0;
  
  sum = firstPrimes(1);
  cout << endl << "firstPrimes(1) = " << sum << endl;

  sum = firstPrimes(3);
  cout << endl << "firstPrimes(3) = " << sum << endl;
  
  sum = firstPrimes(6);
  cout << endl << "firstPrimes(6) = " << sum << endl;
  
  sum = firstPrimes(10);
  cout << endl << "firstPrimes(10) = " << sum << endl;
  
  cout << endl << "-----------------------------------------------------------" << endl;
  
//   // Exercise 4
//   cout << "Exercise 4" << endl << endl;
//   
//   int p1 = 0;
//   int p2 = 0;
//   
//   Goldbach(6,p1,p2);
//   cout << "Goldbach(6,p1,p2) = (" << p1 << "," << p2 << ")" << endl;
// 
//   Goldbach(12,p1,p2);
//   cout << "Goldbach(12,p1,p2) = (" << p1 << "," << p2 << ")" << endl;
// 
//   Goldbach(458,p1,p2);
//   cout << "Goldbach(458,p1,p2) = (" << p1 << "," << p2 << ")" << endl;
// 
//   Goldbach(32896,p1,p2);
//   cout << "Goldbach(32896,p1,p2) = (" << p1 << "," << p2 << ")" << endl;
// 
//   cout << "-----------------------------------------------------------" << endl;

  // Exercise 5
  cout << "Exercise 5" << endl << endl;
  
  int v[] = {1,2,3,4,5,6,5,4,3,2,1};
  
  cout << "search({1,2,3,4,5,6,5,4,3,2,1},11,7) = " << search(v,11,7) << endl;
  cout << "search({1,2,3,4,5,6,5,4,3,2,1},11,2) = " << search(v,11,2) << endl;
  
  cout << "position({1,2,3,4,5,6,5,4,3,2,1},11,7) = " << position(v,11,7) << endl;
  cout << "position({1,2,3,4,5,6,5,4,3,2,1},11,2) = " << position(v,11,2) << endl;

  cout << "count({1,2,3,4,5,6,5,4,3,2,1},11,7) = " << count(v,11,7) << endl;
  cout << "count({1,2,3,4,5,6,5,4,3,2,1},11,2) = " << count(v,11,2) << endl;
  
  cout << "------------------------------------------------------------" << endl;
  
  // Exercise 6
  cout << "Exercise 6" << endl << endl;
  
  int v1[] = {3,4,7,2,275,5,1};
  int v2[] = {2,4,8,0,24,8};
  int v3[] = {3,7,8,51,3,2};
  
  cout << "minOdds({3,4,7,2,275,5,1},7) = " << minOdds(v1,7) << endl;
  cout << "minOdds({2,4,8,0,24,8},6) = " << minOdds(v2,6) << endl;
  cout << "minOdds({3,7,8,51,3,2},6) = " << minOdds(v3,6) << endl;

  int v4[] = {2,3,8,17,24,8};
  int v5[] = {3,7,8,50,3,2};

  cout << "posMaxMultFive({3,4,7,2,275,5,1},7) = " << posMaxMultFive(v1,7) << endl;
  cout << "posMaxMultFive({2,3,8,17,24,8},6) = " << posMaxMultFive(v4,6) << endl;
  cout << "posMaxMultFive({3,7,8,50,3,2},6) = " << posMaxMultFive(v5,6) << endl;

  cout << "------------------------------------------------------------" << endl;

  // Exercise 7
  cout << "Exercise 7" << endl << endl;
  
  char data1[] = "1234:Perez Perez, Pedro:3.4:Good work, but did not submit the last assignment";  
  extractStudentData(data1);
  cout << endl;
  
  char data2[] = "33452:Cruz Pi, Teo:7.9:No comment";
  extractStudentData(data2);
  cout << endl;
  
  char data3[] = "12:Mas Mora, Ana:9.4:Superb!";
  extractStudentData(data3);
  
  return 0;
}

bool multiple(int a, int b)
{
    bool multiplo;//Booleano que hacemos que devuelva la función
    int resto;//Variable que contiene la operación con la que obtenemos el resto
    
    multiplo= false;//Lo inicializamos como falso
    
    if(a>b){//Comprobamos cual es el número de mayor valor
        resto= a%b;
        if(resto==0)//Comprobamos si su resto da 0
            multiplo= true;
        
    }
    else{
        resto= b%a;
        if(resto==0)
            multiplo= true;
    }
    
    return multiplo;    
}
//-----------------------------------------------------------------------------------------//
int printN(int n)
{
    int i, j;
    int contador=0;//Variable incializada en 0 que usaremos como contador
    
    if(n<4)//Comprobar el valor de n
        cout << "El tamaño introducido no es válido" << endl;
    
    else{
        for(i=0; i<n; i++)//Recorre las filas
        {
            for(j=0; j<n; j++)//Recorre las columnas
            {
                if(j==0 || j==n-1 || i==j)//Instrucciones para crear la n: primera columna o última columna o la diagonal
                {
                    cout << "*";
                    contador++;//Suma cuando se coloca un "*"
                }
                else
                {   
                    cout << " ";//Cuando no se cumple ninguna colocamos un espacio en blanco
                }
            }
            cout << endl;
        }
    }
    
    return contador;
}
//-----------------------------------------------------------------------------------------//
bool isPrime(int p)
{
    bool primo= false;//Inicialmente es falso
    int j;
    int contador=0;
    j=p;//j adquiere el valor de p

    while(j>0)
    {
        if(p%j==0)//Si el resto da 0 entonces aumentará el contador
            contador++;
        j--;//El valor de j se va reduciendo, pero el de p se mantiene constante
    }
    if(contador==2)//Si el contador vale 2, entonces es primo, porque habrá dado resto en los dos casos que buscamos, entre si mismo y 1
        primo= true;
    
    return primo;
}

int firstPrimes(int n)
{
    int i=0;//Lo usaremos para contar las iteraciones
    int j=2;//El primer primo es 2
    int suma=0;
    
    while(i<n)
    {
        if(isPrime(j)==1)//Si cumple que es primo, entonces escribirá dicho número
        {
            cout << j;
            cout << " ";
            suma= suma + j;//Para saber la suma total
            i++;//Solo aumenta cuando se ha encontrado un primo
        }
        cout << " ";
        j++;
    }
    return suma;
}
//-----------------------------------------------------------------------------------------//
// bool isPrime(int p)
// {
//     bool primo= false;//Inicialmente es falso
//     int j;
//     int contador=0;
//     j=p;//j adquiere el valor de p
// 
//     while(j>0)
//     {
//         if(p%j==0)//Si el resto da 0 entonces aumentará el contador
//             contador++;
//         j--;//El valor de j se va reduciendo, pero el de p se mantiene constante
//     }
//     if(contador==2)//Si el contador vale 2, entonces es primo, porque habrá dado resto en los dos casos que buscamos, entre si mismo y 1
//         primo= true;
//     
//     return primo;
// }

// void Goldbach(int n, int &p1, int &p2)
// {
//     int i, j;
//     int num1, num2;//Variables auxiliares
//     
//     for(i=2; i<n; i++)//Empezando en 2, recorre todos los números entre 2 y n, de izquierda a derecha
//     {
//         if(isPrime(i)==1)//Encuentra un número primo
//         {
//             num1=i;//Una vez encontrado no cambia hasta que se hayan realizado todas las sumas
//             for(j=n; j>0; j--)//Siendo j=n, recorre todos los números entre n y 0, de derecha a izquierda
//             {
//                 if(isPrime(j)==1)//Encuentra un número primo
//                 {
//                     num2=j;
//                     if(num1+num2==n)//Comprueba si la suma de los dos números es igual a n
//                     {
//                         p1=num2;
//                         p2=num1;
//                     }
//                 }
//             }
//         }
//     }
//     
// }
//-----------------------------------------------------------------------------------------//
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
//-----------------------------------------------------------------------------------------//
int minOdds(int v[], const int TAMVECTOR)
{
    int i;
    int min;
    bool impares= false;
    
    for(i=0; i<TAMVECTOR; i++)
    {
        if(v[i]%2!=0)
        {
            impares=true;
            if(min>v[i])
                min=v[i];
        }
    }
    if(impares==false)
        min=-1;
    
    return min;
}

int posMaxMultFive(int v[], const int TAMVECTOR)
{
    int i;
    int contador;//Se encarga de guardar la posición del múltiplo de 5 encontrado
    bool multiplo= false;//Indica si hemos encontrado un múltiplo de 5
    
    for(i=0; i<TAMVECTOR; i++)//Bucle que recorre el vector v
    {
        if(v[i]%5==0)//Comprueba si el elemento del vector es múltiplo de 5
        {
            multiplo= true;
            if(contador>i)//Guarda el valor de contador más bajo
                contador=i;
        }
    }
    if(multiplo==false)//Hace que contador valga -1
        contador=-1;
    
    return contador;
}

void extractStudentData(char data[])
{
    Student estudiante;
    int i, j, k, l;
    int c=0;
    int num=0;
    char cadena[10];

    i=0;
    while(data[i]!=':')//Bucle que recopila el valor de number
    {
        num= data[i] + num*10;//Para formar el número completo
        num= num - 48;//Para pasar de char a int(Código ASCII)
        i++;
    }
    estudiante.number= num;//Guardamos en el struct
    
    j=i+1;//Empezamos dónde ha acabado el anterior bucle, sin contar el primer ":" que encontramos
    
    while(data[j]!=':')//Bucle que recopila el nombre del estudiante
    {
        estudiante.name= estudiante.name + data[j];
        j++;
    }
    
    k=j+1;//Empezamos dónde ha acabado el anterior bucle, sin contar el primer ":" que encontramos
    
    while(data[k]!=':')
    {
        cadena[c]= data[k];
        k++;
        c++;
    }
    estudiante.mark= atof(cadena);
    
    l=k+1;//Empezamos dónde ha acabado el anterior bucle, sin contar el primer ":" que encontramos
    
    while(data[l]!='\0')//Bucle que recopila el nombre del estudiante
    {
        estudiante.obs= estudiante.obs + data[l];
        l++;
    }    
    //Salida deseada:
    
    cout << "Name: " << estudiante.name << endl;
    cout << "Mark: " << estudiante.mark << endl;
    cout << "Obs: " << estudiante.obs << endl;
    cout << "Number: " << estudiante.number << endl;
    
    cout << "....................................." << endl;
}








