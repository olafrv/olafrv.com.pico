---
title: La confusión en computación sobre los Watts (W) y los Volts-Ampères (VA)
created: 2012/02/29
image: ampere.jpg
---

Fuentes: [www.unicrom.com](https://www.unicrom.com/topic.asp?TOPIC_ID=4983&FORUM_ID=25&CAT_ID=5&Forum_Title=UPS+-+Sistemas+de+Fuerza+Ininterrumpible&Topic_Title=los+KVA), [www.um.es](https://www.um.es/docencia/barzana/FIS/watios_va.html), [www.newsai.es](https://www.newsai.es/fqa.htm). 

**Introducción.** 

Esta nota tratará de ayudar a entender la diferencia entre Watts y VA, y explicará como los términos son correcta ó incorrectamente usados en la especificación de la potencia de los equipos protectores como Reguladores ó UPS. Mucha gente tiene una gran confusión acerca de la diferencia entre Watts y Volts-Amperes en el momento de seleccionar la potencia de una UPS. Muchos fabricantes de equipos contribuyen a esa confusión, al obviar la distinción entre esos dos valores. 

**Los Watts, los VA y el Factor de Potencia.**

La potencia consumida por un equipo de computación es expresada en Watts (W) ó Volts-Amperes (VA). La potencia en Watts es la potencia real consumida por el equipo. Se denomina Volts-Amperes a la" potencia aparente" del equipo, y es el producto de la tensión aplicada y la corriente que por él circula. Ambas valores tienen un uso y un propósito. Los Watts determinan la potencia real consumida desde la compañía de energía eléctrica y la carga térmica generada por el equipo. El valor en VA es utilizado para dimensionar correctamente los cables y los circuitos de protección. En algunos tipos de artefactos eléctricos, como las lámparas incandescentes, los valores en Watts y en VA son idénticos. Sin embargo, para equipos de computación, los Watts y los VA pueden llegar a diferir significativamente, siendo el valor en VA siempre igual o mayor que el valor en Watts. La relación entre los Watts y los VA es denominada "Factor de Potencia" y es expresada por un número (ejemplo: 0.7) ó por un porcentaje (ejemplo: 70%). El valor del consumo, en Watts, para una computadora, es típicamente 60 a 70% de su valor en VA. Virtualmente todas las computadoras modernas, utilizan una fuente de alimentación de tipo switching con un gran capacitor de entrada. Debido a las características de éstos convertidores, éstas fuentes de alimentación presentan un factor de potencia de 0.7 , tendiendo las computadoras personales a 0.6. Esto significa que los Watts consumidos por una computadora típica son aproximadamente el 60% de su consumo medido en VA. Recientemente fue introducida al mercado un nuevo tipo de fuente de poder, llamada fuente de switching con factor de potencia corregido. Para éste tipo de fuente de poder, el factor de potencia es igual a 1. Este tipo de fuente es utilizado en grandes servidores, usualmente con consumos por sobre sobre los 500 Watts. La mayoría de las veces, no será posible para el usuario determinar el factor de potencia de la carga, y por lo tanto deberá asumir el peor caso cuando calcule la potencia necesaria para un equipo de protección. 

**Los valores de potencia de una UPS.**

Una UPS también tiene valores en Watts y en VA y ninguno de ambos (ni Watts, ni los VA) puede ser excedido. En muchos casos, los fabricantes solamente publican la potencia en VA de la UPS. Sin embargo, es un estándar en la industria, que su valor en Watts es aproximadamente el 60% del valor en VA, ya que es éste el valor típico del factor de potencia de las cargas. Por lo tanto, como un factor de seguridad, se debe asumir que la potencia en Watts de la UPS es el 60% del valor publicado en VA. 

**Ejemplos de cómo puede ocurrir un error de cálculo.**

Ejemplo Nro.1: Considere el caso de una UPS de 1000 VA. El usuario quiere alimentar 9 lámparas incandescentes de 100 Watts (total 900Watts). Las lámparas tienen un consumo de 900 W ó 900 VA, ya que su factor de potencia es 1. Aunque el consumo en VA de la carga es de 900 VA, lo cual está dentro de las características de la UPS, el equipo no podrá soportar esa carga. Esto se debe a que el consumo de 900Watts supera la potencia en Watts de la UPS, que es aproximadamente el 60% de los 1000VA de la especificación, es decir 600 Watts.

Ejemplo Nro.2: Considere el caso de una UPS de 1000 VA. El usuario quiere alimentar un servidor de 900 VA con la UPS. El servidor tiene una fuente de alimentación con factor de potencia corregido, y por lo tanto tiene un consumo de 900 Watts ó 900 VA. Aunque los VA consumidos por la carga son 900, lo cual está dentro de las especificaciones de la UPS, ella no podrá soportar esa carga. Esto se debe a que los 900W de la carga superan la potencia en Watts de la UPS, que es aproximadamente el 60% de los 1000 VA de la especificación, es decir 600 Watts. 

**Como evitar errores de tamaño.** 

Las etiquetas o placas de datos de los equipos están frecuentemente en VA, lo cual hace dificultoso conocer el consumo en Watts. Si usa los valores especificados en las placas de los equipos, un usuario podría configurar un sistema que parezca correctamente elegido, basado en el consumo en VA, pero que sobrepase la potencia en Watts de la UPS. Si se determina que el valor de la carga en VA no exceda el 60 a 70 % de la potencia en VA de la UPS, es imposible exceder la potencia en Watts. Por lo tanto a menos que Ud. tenga seguridad sobre el consumo en Watts de la carga, la manera más segura de proceder, es mantener la suma de los valores de los consumos por debajo del 60% de la potencia en VA de la UPS. Solamente una medición realizada con los instrumentos adecuados proveerá un dato exacto de los valores en Watts y VA. 

**Conclusión.** 

La información sobre el consumo de las cargas de computación, no está todavía especificada de forma que resulte simple la elección del tamaño de la UPS. Es posible configurar sistemas que parezcan correctamente dimensionados, pero que en la práctica sobrecarguen la UPS. Sobredimensionando la UPS ligeramente por encima de las especificaciones de potencia de los equipos, brindará una operación más segura. Un sobredimensionamiento también tiene el beneficio de proveer un mayor tiempo de autonomía (backup) a la carga.