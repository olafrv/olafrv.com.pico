---
title: Algoritmo para determinar si un entero positivo es primo en JAVA
link: https://www.olafrv.com/wordpress/algoritmo-para-determinar-si-un-entero-positivo-es-primo-en-java/
author: chanchito
description: 
post_id: 322
created: 2010/03/01 23:18:51
created_gmt: 2010/03/02 03:48:51
comment_status: open
post_name: algoritmo-para-determinar-si-un-entero-positivo-es-primo-en-java
status: publish
post_type: post
---

# Algoritmo para determinar si un entero positivo es primo en JAVA

A continuación tienen el archivo **"primo.java"**, compilarlo y ejecutarlo pasándole como argumento un número entero positivo cualquiera. 
    
    
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