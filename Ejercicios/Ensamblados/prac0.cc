//DNI 23900664F BELTRÁN MARCO, RAÚL
#include <iostream>
#include <stdlib.h>
#include <string.h>

using namespace std;

//Ejercicio1-------------------------------------------------------------------------------//
bool multiple(int a, int b)
{
    bool multiplo;//Booleano que hacemos que devuelva la función
    int resto;//Variable que contiene la operación con la que obtenemos el resto
    
    multiplo= false;//Lo inicializamos como falso
    
    if(a>b)//Comprobamos cual es el número de mayor valor
    {
        resto= a%b;
        if(resto==0)//Comprobamos si su resto da 0
            multiplo= true;
    }
    else
    {
        resto= b%a;
        if(resto==0)
            multiplo= true;
    }
    return multiplo;    
}
//Ejercicio2-------------------------------------------------------------------------------//
int printN(int n)
{
    int i, j;
    int contador=0;//Variable incializada en 0 que usaremos como contador
    
    if(n<4)//Comprobar el valor de n
        cout << "ERROR" << endl;
    
    else
    {
        for(i=0; i<n; i++)//Bucle que recorre las filas
        {
            for(j=0; j<n; j++)//Bucle que recorre las columnas
            {
                if(j==0 || j==n-1 || i==j)//Columna 1 | Columna 2 | Diagonal de la N
                {
                    cout << "*";
                    contador++;
                }
                else
                {   
                    cout << " ";
                }
            }
            cout << endl;
        }
    }
    
    return contador;
}
//Ejercicio3-------------------------------------------------------------------------------//
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
    int i=0;//Lo usamos de contador
    int j=2;//Adquiere el valor de 2 porque es el primo de menor valor
    int suma=0;
    
    while(i<n)//Bucle que recorre todos los números desde 0 a n
    {
        if(isPrime(j)==1)//Lo optimizamos empezando en el 2
        {
            cout << j;
            cout << " ";
            suma= suma + j;//Cuando detecta un primo se lo suma a la variable suma para que el valor se vaya acumulando
            i++;//Aumenta cuando encuentra un primo
        }
        j++;
    }
    return suma;//Valor total después de realizar todas las sumas del bucle
}

//Ejercicio4-------------------------------------------------------------------------------//
void Goldbach(int n, int &p1, int &p2)
{
    int num, aux;
    int dif;
    bool suma= false;//Variable booleana para finalizar el bucle
    num=2;//Inicializamos num en el primo de menor valor

    do
    {
        if(isPrime(num)==1)//Condición que detecta si num es primo
        {
            aux= num;//Guarda el primer primo encontrado en una variable auxiliar
            num++;
        }
        else
            num++;
        dif= n-aux;//Con esta operación obtenemos el segundo valor de la suma
        
        if(isPrime(dif)==1)//Condición que comprueba que aux + dif es n y dif es primo
        {
            suma= true;
            p1= aux;
            p2= dif;
        }
    }
    while(suma!= true);   
}
//Ejercicio5-------------------------------------------------------------------------------//
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
//Ejercicio6-------------------------------------------------------------------------------//
int minOdds(int v[], const int TAMVECTOR)
{
    int i;
    int min;//Guarda el valor mínimo
    bool impares= false;//Indica si hemos encontrado impares
    
    for(i=0; i<TAMVECTOR; i++)//Bucle que recorre el vector v
    {
        if(v[i]%2!=0)//Comprueba si el elemento del vector es impar
        {
            impares=true;
            if(min>v[i])//Se encarga de guardar el valor más bajo
                min=v[i];
        }
    }
    if(impares==false)//Hace que min valga -1, no se han encontrado impares
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
            if(contador>i)//Guarda el valor de contador más bajo, la primera posición
                contador=i;
        }
    }
    if(multiplo==false)//Hace que contador valga -1, no se han encontrado múltiplos
        contador=-1;
    
    return contador;
}
//Ejercicio7-------------------------------------------------------------------------------//
void extractStudentData(char data[])
{
    typedef struct
    {
        int number;
        string name;
        double mark;
        string obs;
    }Student;
    
    Student estudiante;
    int i, j, k, l;
    int c=0;
    int num=0;
    char cadena[100];

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
        cadena[c]= data[k];//Guardamos el valor de data en cadena, usando cadena como un char[] auxiliar
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