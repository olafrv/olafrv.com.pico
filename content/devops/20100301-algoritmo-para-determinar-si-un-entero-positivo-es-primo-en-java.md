---
title: Algoritmo para determinar si un entero positivo es primo en JAVA
created: 2010/03/01
image: java.png
---

A continuación tienen el archivo **"primo.java"**, compilarlo y ejecutarlo pasándole como argumento un número entero positivo cualquiera.

```java
    public class primo{
    	public static void main(String [] args){
    		int numero=new Integer(args[0]).intValue();
    		boolean esprimo=true;
    		int divisor=0;
    		for(int i=2;i<=(numero/2);i++){
    			esprimo=esprimo && (numero%i!=0);
    			if(!esprimo){
    				divisor=i;
    				break;
    			}
    		}
    		System.out.println(esprimo+" - el divisor es "+divisor);
    	}
    }
```
