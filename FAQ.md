# FAQ - Preguntas Frecuentes

## ¿Qué es una VLAN?
Segmentación lógica de una red. Permite dividir un switch en "redes virtuales" sin hardware adicional.

## ¿Qué es un Trunk?
Un puerto que permite que múltiples VLANs compartan un mismo cable físico entre switches.

## ¿Qué es SVI?
Switch Virtual Interface. Es una interfaz virtual en el switch que actúa como gateway/router para una VLAN específica.

## ¿Cómo comunican dispositivos en diferentes VLANs?
A través de la SVI. El tráfico pasa por el switch que hace de router entre VLANs.

## ¿Sin SVI qué pasa?
Dispositivos en la misma VLAN se comunican normal, pero los de diferentes VLANs no pueden comunicarse.

## ¿Por qué necesito un Trunk?
Porque sin trunk, cada cable solo llevaría una VLAN. Con trunk, múltiples VLANs usan el mismo cable.

## ¿Cómo identifica el switch qué VLAN es cada paquete en el trunk?
Con etiquetas 802.1Q. Agregan una etiqueta al paquete indicando a qué VLAN pertenece.

## ¿Puedo tener una VLAN en solo un switch?
Sí, completamente válido.

## ¿Puedo tener más de 2 VLANs?
Sí, puedes crear tantas como necesites (hasta 4094).

## ¿Qué es la VLAN 1?
La VLAN por defecto en todos los switches. Por buena práctica, no la uses para usuarios.

## ¿Necesito un router externo para inter-VLAN routing?
No si usas SVIs. El switch hace el routing. Pero en redes grandes es recomendable un router dedicado.

## ¿Cómo verifico que mi configuración funciona?
```
show vlan brief              # Ver VLANs creadas
show interface trunk         # Ver información del trunk
show interface vlan 10       # Ver estado de la SVI
ping 192.168.X.X            # Probar conectividad
```

## ¿Qué es 802.1Q?
El estándar IEEE que define cómo etiquetar VLANs en ethernet.
